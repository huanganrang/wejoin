//聊天窗口
(function(house) {
    //房间配置
    var cfg = house.cfg;
    var option = {
        huanxinUid: userToken.huanxinUid,
        onOpened: function (conn) {

        },
        onTextMessage: function (message) {
            var filters = house.chart.filters;
            //1、通知消息
            var data = $.parseJSON(message.data);
            data.from = message.from;
            for (var i = 0; i < filters.length; i++) {
                var filter = filters[i];
                if (filter.mapper(data)) {
                    filter.handle(data);
                    break;
                }
            }
        },
        username: userToken.huanxinUid,
        password: userToken.password,
        huanxinRoomId:cfg.huanxinRoomId
    };
    //实例化聊天对象
    var chart = new $chart(option);
    house.chart = chart;

    //初始化聊天按钮
    function initToolbar(chart){
        var toolbar = {};
        //发送按钮
        toolbar.send = $('.input-toolbar .send');
        var textarea = $('.right .input textarea');
        toolbar.send.click(function(){
            var input = textarea;
            var val = input.val().trim();
            if(val){
                var msg = chart.messageFactory.CHART(val);
                //发送消息
                chart.sendText(msg);
                input.val("");
                chart.addBubble(val);
            }
        });
        // 回车发送消息
        textarea.bind('keyup', function (e) {
            if (e.keyCode == 13) {
                toolbar.send.click();
            }
        });
        chart.toolbar = toolbar;
    }

    //初始化对话框
    function initDialog(chart){
        var dialog = {};
        chart.dialog = dialog;
        dialog.container = $('.right .conversation');
        dialog.container.children().remove();
    }

    initToolbar(house.chart);
    initDialog(house.chart);

    //添加自己的气泡
    chart.addBubble = function(message){
        var myid = userToken.huanxinUid;
        var users = chart.userList||{};
        var user = users[myid]||{};
        var container = chart.dialog.container;
        var data = {message:message,nickName:userToken.nickName,icon:user.icon};
        if(data.icon.indexOf("http://")<0){
            data.icon = "http://"+data.icon;
        }
        var messageDom =  Util.cloneDom("chartMessage",data);
        container.append(messageDom);
        //滚到底部
        container[0].scrollTop = container[0].scrollHeight;
    }

    //添加其他成员消息
    chart.addUserBubble = function(message){
        var container = chart.dialog.container;
        var data = {message:message.content,nickName:message.myname,icon:message.myicon};
        if(data.icon.indexOf("http://")<0){
            data.icon = "http://"+data.icon;
        }
        var messageDom =  Util.cloneDom("receivedMessage",data);
        container.append(messageDom);
        //滚到底部
        container[0].scrollTop = container[0].scrollHeight;
    }

    //构造消息过滤器
    function initFilters() {
        var filters = new Array();
        house.chart.filters = filters;
        //通知过滤器，模仿过滤器来做，后续还要改进
        filters.push({
            mapper: function (data) {
                return data.type != undefined && data.type != 30 && data.type != 3;
            },
            handle: function (data) {
                if (executors[data.type])
                    executors[data.type](data);
            }
        });

        filters.push({
            mapper: function (data) {
                return data.type != undefined && data.type == 30;
            },
            handle: function (data) {
                /*//var data  =  $.parseJSON(message.data);
                var user = getUserInfo(message);
                user.content = user.content.data;*/
                console.log(data);
                chart.addUserBubble(data);
            }
        });
        var showDocsImages = function(images) {
        }
            var executors = {
            1: function (data) {
                //showDocsImages([data.url]);
                house.defaultBoard.setImg(data.url);
                $('.header .middle .whiteboard').click();
            },
            2: function (data) {
                //showVedios(data.url);
            },
            3: function (data) {
                //音频
                //showVedios(data.url);
            },
            13: function () {
                //openPullStream()
            },
            14: function () {
                //closePullStream()
            },
            15: function (data) {
                /*if (users[data.id])return;
                getUserByHuanxinuid(data.id);*/

            },
            16: function (data) {
                //退出房间
                /*var huanxinUid = data.id;
                console.log("退出房间" + huanxinUid);

                $(".list_name ul li").each(function () {
                    var $this = $(this);
                    console.log($this)
                    if (huanxinUid == $this.data("huanxinuid")) {
                        $this.remove();
                    }
                });
                $(".v_ren ul li").each(function () {
                    var $this = $(this);
                    if (huanxinUid == $this.data("huanxinuid")) {
                        $this.remove();
                    }
                });*/
            },
            6: function (data) {
                showDocsImages([data.url]);
            },
            7: function (data) {
                showDocsImages([data.url]);
            },
            8: function (data) {
                showDocsImages([data.url]);
            },
            9: function (data) {
                showDocsImages([data.url]);
            },
            10: function (data) {
                showDocsImages([data.url]);
            },
            11: function (data) {
                showDocsImages([data.url]);
            }
        };
        chart.messageFactory = {
            JOIN_ROOM: function (id) {
                return {"type": 15, "id": id};
            },
            LOGOUT_ROOM : function(id){
                return {"type": 16, "id": id};
            },
            CHART: function (message) {
                message = message.trim();
                var myid = userToken.huanxinUid;
                var users = chart.userList||{};
                var user = users[myid]||{};
                var result = {"type": 30, "content": message,"myid":myid,"myname":user.nickName||"","myicon":user.icon||""};
                console.log(result);
                return result;
            },
            VOICE:function(url){return {"type": 3, "url": url};},
            VEDIO:function(url){return {"type": 2, "url": url};},
            CLOSE_STREAM : function(){
                return {"type":14};
            },
            OPEN_STREAM : function(){
                return {"type":13};
            },
            FILE:function(type,url) {
                return {"type":type,"url":url};
            }
        };
    }
    initFilters();
})($house);