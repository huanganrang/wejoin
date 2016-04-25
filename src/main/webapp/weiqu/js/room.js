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
})($house);

