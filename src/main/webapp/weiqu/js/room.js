(function(house) {
    var cfg = house.cfg;
    function bindClick(){
        //登录
        $('.header .right .login').click(function(){
            window.location.href = 'login.jsp';
        });
        //注册
        $('.header .right .register').click(function(){
            window.location.href = 'register.jsp';
        });
        //搜索回车
        $('.members input').bind('keyup', function (e) {
            if (e.keyCode == 13) {
                searchUser(false);
            }
        });
    }
    //绑定点击事件
    bindClick();

    /**
     * 渲染用户
     * @param member
     */
    function appendUser(member){
        var viewData = Util.cloneJson(member);
        var userIcon = member.icon || 'images/tx.gif';
        if(userIcon.indexOf("file.")==0){
            userIcon = "http://"+userIcon;
            viewData.icon = userIcon;
        }
        var memberDom =  Util.cloneDom("userMember",member,viewData);

        var movieClass=""//on
        //1：普通用户，2：管理员，3：游客，4：房间创建者，5：教师
        var identificationName = "成员";
        switch(member.identification) {
            case 5:
                identificationName = "讲师";
                break;
            case 4:
                identificationName = "房主";
                break;
            case 3:
                identificationName = "游客";
                break;
            case 2:
                identificationName = "管理员";
                break;
            default :
                identificationName = "成员";
        }
        var membersList = $(".members .list");
        membersList.append(memberDom);
        $(".members .count").text(membersList.children().length);

/*        $li = $('<li data-identification="'+member.identification+'" data-huanxinuid="'+member.huanxinUid+'"><img src="' + userIcon + '" /><span>' + member.nickName + '</span><ol>'+identificationName+'</ol> <a href="#" class="'+movieClass+'">视频</a></li>');
        $(".list_name ul").append($li);
        //alert($(".v_ren ul").children().length);
        $("#onlineNum").html($(".v_ren ul").children().length+"人");*/
    }

    //获取房间用户
    function getUserByHuanxinuid(uid){
        ajaxGet({"type": "UL035", "huanxinUid": uid}, function (member) {
            //已经存在
            var users = chart.userList;
            if(users[member.huanxinUid])return;
            users[member.huanxinUid] = member;
            //appendUser(member);
        });
    }


    //获取房间用户
    function initMembersList() {
        var membersList = $(".members .list");
        membersList.children().remove();
        ajaxGet({"type": "UL030", "houseToken": cfg.houseToken}, function (members) {
            var users = {};
            for (var i in members) {
                users[members[i].huanxin_uid] = members[i];
                members[i].huanxinUid = members[i].huanxin_uid;
                appendUser(members[i]);
            }
            house.chart.userList = users;
        });
    }
    initMembersList();

    /**
     * 搜索用户
     * @param isManager
     */
    function searchUser(isManager){
        var searchValue = $('.members input').val().trim();
        var members = $(".members .list .member");
        if(searchValue == ""&&!isManager){
            members.show();
            return;
        }
        function checkIsManager(identification){
            return identification=="2"||identification=="4";
        }
        members.each(function () {
            var $this = $(this);
            var userNickName = $this.data("nickName");
            var identification = $this.data("identification");
            if ((isManager&&checkIsManager(identification))||(!isManager&&userNickName.indexOf(searchValue) > -1)) {
                $this.show();
            } else {
                $this.hide();
            }
        })
    }
    var defaultBoard = new DrawingBoard.Board('default-board');
    house.defaultBoard = defaultBoard;
    defaultBoard.oldImg = null;
    setInterval(function () {
        var img = defaultBoard.getImg();
        if(defaultBoard.oldImg == null){
            defaultBoard.oldImg = img;
        }
        if (img == defaultBoard.oldImg)return;
        ajaxPost({"type": "UL041", "param": {"data": img}}, function (filePath) {
            var chart = house.chart;
            var msg = chart.messageFactory.FILE(1, filePath);
            //发送消息
            chart.sendText(msg);
        }, function (data) {
            return data.returnValue;
        });
        defaultBoard.oldImg = img;
    }, 5000)



    //文档模块
    var DocumentModule = function(house){
        var _d = this;
        this.loading = $('.content .document .loading-tip').clone();
        this.content = $('.content .document');
        this.fileType = $('#uploadForm input[name="type"]');
        var methods ={
            init:function(){
                $('.document .upload').click(function(){
                    $("#file").click();
                });
                $("#file").change(function(){
                    _d.upload();
                });
            },
            showLoading:function(){
                _d.content.html(_d.loading);
            },
            hideLoading:function(){
                _d.content.find('.loading-tip').remove();
            },
            showDocsImages:function(images,index){
                if(images == undefined) return;
                _d.images = images;
                _d.index = index||0;
                if(images[_d.index]) {
                    var pic = images[_d.index].pic || images[_d.index];
                    var image = $('<img src="http://' + pic + '" alt="" width="100%" height="100%">');
                    _d.content.html(image);
                }
            },
            showDocsImagesAndSendMessage:function(images,index){
                if(images == undefined) return;
                var chart = house.chart;
                var image = images[index];
                if(image == undefined) return;
                var pic = image.pic || image;
                var msg = chart.messageFactory.FILE(_d.fileType.val(),pic);
                //发送消息
                chart.sendText(msg);
                _d.showDocsImages(images,index);
            },
            upload:function(){
                _d.showLoading();
                var fileContentType = $("#file").val().match(/^(.*)(\.)(.{1,8})$/)[3].toLowerCase(); //这个文件类型正则很有用：）
                var _fileType = _d.fileType;
                $('#uploadForm input[name="houseToken"]').val(house.cfg.houseToken);
                $('#uploadForm input[name="userToken"]').val(userToken.token);
                if(fileContentType.indexOf('txt')>-1){
                    _fileType.val(9);
                }else if(fileContentType.indexOf('doc')>-1 || fileContentType.indexOf('docx')>-1){
                    _fileType.val(6);
                }else if(fileContentType.indexOf('xls')>-1 || fileContentType.indexOf('xlsx')>-1){
                    _fileType.val(7);
                }else if(fileContentType.indexOf('pdf')>-1){
                    _fileType.val(10);
                }else if(fileContentType.indexOf('ppt')>-1){
                    _fileType.val(8);
                }
                var formData = new FormData($('#uploadForm')[0]);
                $.ajax({
                    url: SERVER_URL+'/upload',  //Server script to process data
                    type: 'POST',
                    //Ajax events
                    //beforeSend: beforeSendHandler,
                    //success: completeHandler,
                    //error: errorHandler,
                    // Form data
                    data: formData,
                    //Options to tell jQuery not to process data or worry about content-type.
                    cache: false,
                    contentType: false,
                    processData: false,
                    success:function (data) {
                        console.log(data);
                        var result = $.parseJSON(data);
                        if(result.serverStatus == 0){
                            var images = result.returnObject;
                            var chart = house.chart;
                            var msg = chart.messageFactory.FILE(_fileType.val(),images[0].pic);
                            //发送消息
                            chart.sendText(msg);
                            _d.hideLoading();
                            _d.showDocsImages(images);
                        }
                    },
                    error: function() {
                        alert("上传失败");
                    }

                });
            }
        }
        for(var i in methods){
            this[i] = methods[i];
        }
        this.init();
    }
    house.document = new DocumentModule(house);

    //分页
    var Pagination = function(){

        this.index = 0;
        this.data = [];
        this.previousDom = $('.pagination .previous');
        this.indexDom = $('.pagination .index');
        this.nextDom = $('.pagination .next');
        var _p = this;

        var methods = {
            model:function(){
                return $('.header .functions>span').index($('.header .functions .selected'));
            },
            refresh:function(){

                _p.handle();
            },
            buildData:function(){
                var model = _p.model();
                //文档
                if(model == 1){
                    _p.data = house.document.images||[];
                    //_p.index = house.document.index||0;
                }
            },
            handle:function(){
                _p.buildData();
                var model = _p.model();
                if(model == 1){
                    house.document.showDocsImagesAndSendMessage(_p.data,_p.index);
                }
                console.log(_p.index)
                _p.indexDom.html(_p.index+1);

            },
            previous:function(){
                _p.index--;
                _p.handle();
            },
            next:function(){
                _p.index++;
                _p.handle();
            },
            init:function(){
                _p.previousDom.click(function(){
                    console.log(_p.index)

                    _p.previous();
                });
                _p.nextDom.click(function(){
                    _p.next();
                });
            }
        }
        for(var i in methods){
            this[i] = methods[i];
        }
        house.pagination = this;
        this.init();
    }
    new Pagination();

    $('.header .functions>span').click(function(){
        house.pagination.refresh();
    })
})($house);

