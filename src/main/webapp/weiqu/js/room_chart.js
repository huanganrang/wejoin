//聊天窗口
(function(house) {
    //房间配置
    var cfg = house.cfg;
    var option = {
        huanxinUid: userToken.huanxinUid,
        onOpened: function (conn) {

        },
        onTextMessage: function (message) {

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
        toolbar.send.click(function(){
            var input = $('.right .input textarea');
            var val = input.val();
            if(val){
                //发送消息
                chart.sendText(val);
            }
        });
        chart.toolbar = toolbar;
    }
    initToolbar(house.chart);
})($house);