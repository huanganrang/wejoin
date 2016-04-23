(function(house) {
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
})($house);