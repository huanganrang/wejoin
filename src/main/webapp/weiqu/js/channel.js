//频道模块
var WEIQU_CHANNEL = {};
$(document).ready(function () {

    WEIQU_CHANNEL.init();
});

WEIQU_CHANNEL.init = function(){
    //频道列表结尾dom
    WEIQU_CHANNEL.channelClearDom = $(".center_list ul >.clear");
    //分页
    WEIQU_CHANNEL.scroll.init();
    //分类信息
    WEIQU_CHANNEL.initCategories();
    //构建频道窗口
    WEIQU_CHANNEL.channelWidow.init();
    //房间列表窗口
    WEIQU_CHANNEL.roomWindow.init();
}
//分类
WEIQU_CHANNEL.categories = [];
WEIQU_CHANNEL.initCategories = function() {
    var type = "UL013";
    ajaxGet({"type":type},function(data){
        WEIQU_CHANNEL.categories = data;
        WEIQU_CHANNEL.renderWithCategories(data);
    });
};
//用分类渲染
WEIQU_CHANNEL.renderWithCategories = function(data){
    var categories = data;
    for(var i in categories) {
        var category = categories[i];
        var $li = '<p class="menu_head" categoryId="'+category.id+'">'+category.name+'<em>245.300</em></p>';
        $("#secondpane").append($li);
        var $option = $('<option value="'+category.id+'">'+category.name+'</option>');
        $("#categoryId").append($option);
    }
    $("#secondpane p.menu_head").click(function(){
        $(this).css({backgroundImage:"url(images/hov.gif)" , color:"#70b615"}).next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
        $(this).siblings().css({backgroundImage:"" , color:"#666666"});
    });
}

//频道窗口
WEIQU_CHANNEL.channelWidow = {
    window:null,
    init:function(){
        WEIQU_CHANNEL.channelWidow.window = $("#channelBox");
        $(".left_an a").click(function () {
            WEIQU_CHANNEL.channelWidow.show();
        });
        $("#channelBox .up_an .a2").click(function () {
            $('#createChannelForm').submit();
        });
        $("#channelBox .close_btn a").click(function () {
            WEIQU_CHANNEL.channelWidow.hide();
        });
        WEIQU_CHANNEL.initCreateChannel();
    },
    show:function(){
        $(".windows").hide();
        WEIQU_CHANNEL.channelWidow.window.show();
        var top=(windowHeight-630)/2
        $("#channelBox .windows_box").css("top",top);
    },
    hide:function(){
        WEIQU_CHANNEL.channelWidow.window.hide();
    }
}

//分页函数 type为分类，keyword为搜索条件
WEIQU_CHANNEL.page = function (pageNumber, type, keyword) {
    ajaxGet({"pageSize": WEIQU_CHANNEL.scroll.size, "pageNo": pageNumber, "type": "UL010"}, function (json) {
        //$(".center_list ul").remove();
        //总数
        var channelTotal = json.returnValue;
        WEIQU_CHANNEL.scroll.total = channelTotal;
        var channels = json.returnObject;
        for (var i = 0; i < channels.length; i++) {
            var channel = channels[i];
            WEIQU_CHANNEL.buildChannel(channel);
        }
    }, function (data) {
        return data;
    });
}

WEIQU_CHANNEL.channelClearDom = null;

//构建频道dom
WEIQU_CHANNEL.buildChannel = function(channel){
    var viewData = Util.cloneJson(channel);
    viewData.userOnlineCount = "在线：" + (viewData.userOnlineCount||0);
    viewData.displayIconUrl = viewData.displayIconUrl?"http://" + viewData.displayIconUrl:"images/p1.gif";
    viewData.displayIconUrl = '<img src="' + viewData.displayIconUrl + '" />';
    viewData.nickName = 'ID：' + viewData.nickName;
    var dom = Util.cloneDom("template_channel", channel, viewData);
    WEIQU_CHANNEL.channelBind(dom, channel);
    WEIQU_CHANNEL.channelClearDom.before(dom);
    return dom;
}


WEIQU_CHANNEL.channelBind = function (dom, channel) {
    dom.find("b a").click(channel, WEIQU_CHANNEL.joinChannel);
    dom.find("ol a").click(channel, WEIQU_CHANNEL.attention);
}

//关注
WEIQU_CHANNEL.attention = function (event) {
    var channel = event.data;
    alert(channel.nickName);
}

//加入频道
WEIQU_CHANNEL.joinChannel = function (event) {
    var channel = event.data;
    var template = $("#template_room");
    var scrollDom = template.clone().show().removeAttr("id");
    scrollDom.children().remove();
    var center = $(".room_center > ul");
    center.children().remove();
    center.append(scrollDom)
    ajaxGet({
        "type": "UL012",
        "channelToken": channel.token
    }, function (rooms) {
        WEIQU_CHANNEL.roomWindow.rendering(rooms,template,scrollDom);
    });
}

WEIQU_CHANNEL.roomWindow = {
    show:function(){
        $(".windows").hide();
        $("#roomBox").show();
        var top=(windowHeight-630)/2
        $("#roomBox .windows_box").css("top",top)
    },
    init:function(){
        //加入房间
        $("#roomBox .up_an").click(function(){
           var select = WEIQU_CHANNEL.roomWindow.select;
            var room = $(select).data();
            function joinHouse() {
                //  调用joinHouse接口
                ajaxPostSync({
                    "type": "UL014",
                    "param": {"houseToken": room.token, "userToken": userToken.token}
                }, function () {
                    //$.cookie(houseToken, true);
                });
            }

            if (userToken&&userToken.token) {
                ajaxPostSync({
                    "type": "UL031",
                    "param": {"houseToken": room.token, "userToken": userToken.token}
                }, function () {
                    joinHouse();
                });
            } else {
                ajaxPostSync({"type": "UL037"}, function (data) {
                    var username = data.huanxinUid;
                    var password = data.password;
                    userToken = data.token;
                    ajaxGetSync({
                        "type": "UL040",
                        "huanxinUid": username,
                        "password": password
                    }, function () {
                        joinHouse();
                    });
                });
            }
            window.open("room.jsp");
        });
    },
    rendering:function(rooms,template,scrollDom){
        for(var i in rooms){
            var room = rooms[i];
            var viewData = Util.cloneJson(room);
            viewData.onlineUserCount = "在线 "+viewData.onlineUserCount;
            var dom = Util.cloneDom(template.children().eq(0), room, viewData);
            dom.find(".moo_2 a").each(function(i){
                var _this = $(this);
                if(i==0&&viewData.isDescNull==1){
                    _this.hide();
                }else if(i==1&&viewData.isLessonDescNull==1){
                    _this.hide();
                }else if(i==2&&viewData.isPasswordNull==1){
                    _this.hide();
                }
            });
            WEIQU_CHANNEL.roomWindow.bindClick(dom);
            var domTeacher = Util.cloneDom(template.children().eq(1), room, viewData);
            domTeacher.hide();
            scrollDom.append(dom).append(domTeacher);
            dom.find(".moo_2 a:eq(0)").click(function(){
                $(this).parents("li:eq(0)").next().toggle();
            });
        }
        //显示房间列别弹出层
        WEIQU_CHANNEL.roomWindow.show();
        scrollDom.mCustomScrollbar();
    },
    select:null,
    bindClick:function(dom){
        dom.click(function(){
            WEIQU_CHANNEL.roomWindow.select = this;
        });
    }
}

//初始化创建频道
WEIQU_CHANNEL.initCreateChannel = function(){
    $('#createChannelForm').form({
        url : base+"api/apiCommon/doPost", //
        onSubmit : function() {

            var channelIcon = $("#uploadFile").val();
            if(channelIcon == '') {
                alert("请选择频道封面照");
                return false;
            }
            var name = $("#channelName");
            if(Util.checkInputNull(name)) {
                $("#channelName").focus();
                return false;
            }
            var categoryId = $("#categoryId");
            if(Util.checkInputNull(categoryId)) {
                alert("请选择频道类别");
                return false;
            }
            var shortDesc = $("#shortDesc");
            if(Util.checkInputNull(shortDesc)) {
                $("#shortDesc").focus();
                return false;
            }
            $("#type").val("UL011");
            $("#param").val(JSON.stringify({"shortDesc":shortDesc.val(),"name":name.val(),"categoryId":categoryId.val(),"userToken":userToken.token}));
            return true;
        },
        success : function(data) {
            console.log("创建频道data:" + data);
            data = $.parseJSON(data);
            if(data.obj){
                var result = $.parseJSON(data.obj);
                if(result.serverStatus == 0) {
                    var channel = result.returnObject;
                    WEIQU_CHANNEL.buildChannel(channel);
                    WEIQU_CHANNEL.channelWidow.hide();
                } else {
                    // 创建失败
                    alert(result.returnMessage);
                }
            }
        }
    });
}
//滚动分页
WEIQU_CHANNEL.scroll = {
    init:function(){
        //获取第一页
        WEIQU_CHANNEL.page(WEIQU_CHANNEL.scroll.page);
        $(window).scroll(function () {
            /*console.log("滚动条到顶部的垂直高度: " + $(document).scrollTop());
            console.log("页面的文档高度 ：" + $(document).height());
            console.log('浏览器的高度：' + $(window).height());*/
            var totalHeight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());     //浏览器的高度加上滚动条的高度

            if ($(document).height() <= totalHeight)     //当文档的高度小于或者等于总的高度的时候，开始动态加载数据
            {
                WEIQU_CHANNEL.page(++WEIQU_CHANNEL.scroll.page);
            }
        });
    },
    page:1,//第几页
    size:30,//每页多少
    total:0 //总记录数
}




