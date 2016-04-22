//聊天窗口
(function(obj) {

    var option = {
        huanxinUid: userToken.huanxinUid,
        onOpened: function (conn) {

        },
        onTextMessage: function (message) {

        },
        username: userToken.huanxinUid,
        password: userToken.password
    };
    //实例化聊天对象
    var chart = new $chart(option);
})();