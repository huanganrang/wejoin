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
    }
    //绑定点击事件
    bindClick();

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
        ajaxGet({"type": "UL030", "houseToken": cfg.houseToken}, function (members) {
            var users = {};
            for (var i in members) {
                users[members[i].huanxin_uid] = members[i];
                members[i].huanxinUid = members[i].huanxin_uid;
                //appendUser(members[i]);
            }
            house.chart.userList = users;
        });
    }
    initMembersList();
})($house);