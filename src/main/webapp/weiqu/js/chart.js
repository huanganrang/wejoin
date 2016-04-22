var $chart = function(option){
    var $this = this;
    this.init = function(){
        var conn = new Easemob.im.Connection();
        conn.init({
            onOpened: function () {
                console.log("环信成功登录");
                conn.setPresence();
                if(option.onOpened)
                option.onOpened(conn);
            },
            onTextMessage: function (message) {
                console.log("收到文本消息：" + JSON.stringify(message));
                message.data = $.base64.atob(message.data, true);
                if (message.from != option.huanxinUid) {
                    option.onTextMessage(message);
                }
            },
            //收到表情消息时的回调方法
            onEmotionMessage: function (message) {
                console.log("收到表情消息：" + JSON.stringify(message));
                //收到表情消息
                if (message.from != option.huanxinUid) {
                    option.onEmotionMessage(message);
                }
            },
            //当连接关闭时的回调方法
            onClosed: function () {

            }
        });
        var param = {
            apiUrl: Easemob.im.config.apiURL,
            user: option.username,
            pwd: option.password,
            //连接时提供appkey
            appKey: Easemob.im.config.appkey
        }
        console.log(param);
        conn.open(param);
        $this.conn = conn;
    }
    this.reOpen = function(){
        $this.init();
    }
    //发送消息
    this.sendText = function(msg){
        var conn = $this.conn;
        console.log("连接是否开启" + conn.isOpened());
        if (!conn.isOpened()) {
            $this.reOpen();
        }
        var options = {
            to: option.huanxinRoomId,
            msg: $.base64.btoa(JSON.stringify(msg)),
            type: "groupchat"
        };
        conn.sendTextMessage(options);
    }
    this.init();
}