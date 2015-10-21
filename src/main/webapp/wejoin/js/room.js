$(function(){
	var wechat = new WeChat();
	wechat.init();
});
var WeChat = function() {
	this.socket = null;
};

WeChat.prototype = {
	init : function() {
		var _this = this;
		this.socket = new WebSocket('ws://127.0.0.1:8080/wechat');
		// 建立连接
		this.socket.onopen = function(event) {
			// 发送身份信息
			//_this.socket.send({'userToken':''});
		};
		// 监听消息
		this.socket.onmessage = function(event) {
			console.log("Receive message", event.data);
//			var rs = $.parseJSON(event.data);
			_this._displayNewMsg({'username':'我是会飞的鱼','owner':false, 'content':'消息内容'});
		};
		// 关闭
		this.socket.onclose = function(event) {
			console.log("socket has colsed!", event);
		};
		this._initFace();
		// 回车发送消息
		$("#content").bind('keyup', function(e){
			var content = $("#content").val();
			if (e.keyCode == 13 && $.trim(content) != '') {
				$("#content").val('');
				// 发送聊天消息
//				_this.socket.send({'content':content});
				_this._displayNewMsg({'username':'我是会飞的鱼','owner':true, 'content':content});
            };
		});
		// 表情点击事件
		$("#faceWrapper a").bind('click', function(){
			var content = $("#content").val();
			$("#content").focus();
			content += '[ee_' + $(this).find('img').attr("title") + ']';
			$("#content").val(content);
		});
	},
	_initFace: function() {
    	var $face = $("#faceWrapper");
        for (var i = 1; i <= 35; i++) {
        	var $img = $('<a><img src="images/emoji/ee_'+i+'.png" title="'+i+'" style="width: 26px;  height: 26px;"/></a>');
        	$face.append($img);
        };
    },
    // 渲染文本消息
	_displayNewMsg: function(data) {
		var owner = data.owner;
		var ownerClass = (owner && 'wo') || (!owmer && '');
        var $arrow = (owner && '<em></em>') || (!owmer && '<ol></ol>');
        
        var content = this._showFace(data.content); // 过滤表情
        	
		var $messageHtml = '<li class="'+ownerClass+'">'
					+ '<div class="ltian_img"><a><img src="images/tx.gif" /></a></div>'
					+ '<div class="ltian_txt">'
					+ '<span>'+data.username+'</span>'
					+ '<div class="txt_zi">'+content+'</div>' + $arrow
					+ '</div><div class="clear"></div></li>';
		
		$(".ltian ul").append($messageHtml);
		$(".content").scrollTop($(".content")[0].scrollHeight); // 设置无效
    },
    
    // 显示符号表情格式化
    _showFace: function(content) {
    	// 正则替换所有的本地聊天内容中的'[ee_*]'
    	var reg = new RegExp(faceReg, 'g');
    	content = content.replace(reg, function(r){
    		r = r.replace(/\[|\]/g,"");
    		return '<img src="images/emoji/'+r+'.png" style="width: 19px;  height: 19px;"/>';
    	});
    	
    	return content;
    },
};

var faceReg = "\\[ee_1\\]|\\[ee_2\\]|\\[ee_3\\]|\\[ee_4\\]|\\[ee_5\\]|\\[ee_6\\]|\\[ee_7\\]|\\[ee_8\\]|\\[ee_9\\]|\\[ee_10\\]|\\[ee_11\\]|\\[ee_12\\]|\\[ee_13\\]|\\[ee_14\\]|\\[ee_15\\]|\\[ee_16\\]|\\[ee_17\\]|\\[ee_18\\]|\\[ee_19\\]|\\[ee_20\\]|\\[ee_21\\]|\\[ee_22\\]|\\[ee_23\\]|\\[ee_24\\]|\\[ee_25\\]|\\[ee_26\\]|\\[ee_27\\]|\\[ee_28\\]|\\[ee_29\\]|\\[ee_30\\]|\\[ee_31\\]|\\[ee_32\\]|\\[ee_33\\]|\\[ee_34\\]|\\[ee_35\\]";