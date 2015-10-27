$(function(){
	var wechat = new WeChat();
	wechat.init();
	
	initMembersList();
});
var WeChat = function() {
	this.stompClient = null;
};

function initMembersList() {
	$.ajax({
        type: "POST",
        url: base+"api/apiCommon/doGet", // HouseUser/Users
        data:{"type":"UL030", "houseToken":$("#houseToken").val()},
        dataType:"json",
        async: false,
        success:function (data) {
        	if(data.obj){
        		var result = $.parseJSON(data.obj);
        		if(result.serverStatus == 0) {
        			var members = result.returnObject;
        			for(var i in members) {
        				var $li = $('<li><a href="javascript:void(0);" userToken="'+members[i].userToken+'"><img src="'+members[i].userIcon+'" />'+members[i].nickName+'</a></a></li>');
        				$(".v_ren ul").append($li);
        			}
        		}
        	}		            	
    	}
   });
}

function ApplicationModel(wechat) {
    var self = this;
    self.connect = function() {
    	wechat.stompClient.connect({}, function(frame) {

            console.log('Connected ' + frame);

            wechat.stompClient.subscribe("/topic/participants/"+$("#houseToken").val(), function(message) {
               console.info(message);
               var body = $.parseJSON(message.body);
           		if(body.userToken != $("#userToken").val()) {
	           		wechat._displayNewMsg({'username':'系统消息','owner':false, 'content':decodeURIComponent(body.content)});
	           	}
            });

            wechat.stompClient.subscribe("/topic/message/"+$("#houseToken").val(), function(message) {
            	console.info(message);
            	var body = $.parseJSON(message.body);
            	if(body.userToken != $("#userToken").val()) {
            		wechat._displayNewMsg({'username':'我是会飞的鱼','owner':false, 'content':decodeURIComponent(body.content)});
            	}
            });
            
            wechat.stompClient.send("/app/participants",{},JSON.stringify({
            	'houseToken':encodeURIComponent($("#houseToken").val()),
                'userToken':encodeURIComponent($("#userToken").val()),
                'content':encodeURIComponent("哥华丽的上线了！")
            }));
        }, function(error) {
            console.log("STOMP protocol error " + error);
        });
    }

    self.logout = function() {
    	wechat.stompClient.disconnect();
    }
}

WeChat.prototype = {
	init : function() {
		var _this = this;
		var socket = new SockJS('http://service.weiqu168.com:8080/ws');
		this.stompClient = Stomp.over(socket);
        var appModel = new ApplicationModel(this);
        ko.applyBindings(appModel);
        appModel.connect();
        
		this._initFace();
		// 回车发送消息
		$("#content").bind('keyup', function(e){
			var content = $("#content").val();
			if (e.keyCode == 13 && $.trim(content) != '') {
				$("#content").val('');
				// 发送聊天消息
//				_this.socket.send({'content':content});
				_this.stompClient.send("/app/message",{},JSON.stringify({
		            'houseToken':encodeURIComponent($("#houseToken").val()),
		            'userToken':encodeURIComponent($("#userToken").val()),
		            'content':encodeURIComponent(content)
		        }));
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
		// 右键清屏
		$("#box4 .content").smartMenu([[{
				text: "清屏",
				func: function() {
					$(this).find("ul").empty();
				}
			}]], {
			name: "clear"
		});
		//监听浏览器关闭前的事件
		window.onbeforeunload = function(){
			return "确认离开";
		};
		//监听浏览器关闭时
		window.onunload = function(){
			alert(123);
			//appModel.logout();
			var houseToken = $("#houseToken").val();
	    	var userToken = $("#userToken").val();
	    	$.ajax({
		        type: "POST",
		        url: base+"api/apiCommon/doDetele", // HouseUser/HouseUser
		        data: {"type":"UL014", "param":JSON.stringify({"houseToken":houseToken,"userToken":userToken})},
		        dataType:"json",
		        success:function (data) {
		        	console.log(data.obj);
		        	result = $.parseJSON(data.obj);
		        }
		    });
		};
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
		var ownerClass = (owner && 'wo') || (!owner && '');
        var $arrow = (owner && '<em></em>') || (!owner && '<ol></ol>');
        
        var content = this._showFace(data.content); // 过滤表情
        	
		var $messageHtml = '<li class="'+ownerClass+'">'
					+ '<div class="ltian_img"><a><img src="images/tx.gif" /></a></div>'
					+ '<div class="ltian_txt">'
					+ '<span>'+data.username+'</span>'
					+ '<div class="txt_zi">'+content+'</div>' + $arrow
					+ '</div><div class="clear"></div></li>';
		
		$(".ltian ul").append($messageHtml);
		$("#box4 .content").mCustomScrollbar("scrollTo", "bottom"); // 滚动至底部
    },
    
    // 显示符号表情格式化
    _showFace: function(content) {
    	// 正则替换所有的本地聊天内容中的'[ee_*]'
    	var reg = new RegExp(faceReg, 'g');
    	content = content.replace(reg, function(r){
    		r = r.replace(/\[|\]/g,"");
    		return '<img src="images/emoji/ee_'+faceMap[r]+'.png" style="width: 19px;  height: 19px;"/>';
    	});
    	
    	return content;
    },
};

var faceMap = {"):":"1",":D":"2",";)":"3",":-o":"4",":p":"5","(H)":"6",":@":"7",":s":"8",":$":"9",":(":"10",":'(":"11",":|":"12","(a)":"13","8o|":"14","8-|":"15","+o(":"16","<o)":"17","|-)":"18","*-)":"19",":-#":"20",":-*":"21","^o)":"22","8-)":"23","(|)":"24","(u)":"25","(S)":"26","(*)":"27","(#)":"28","(R)":"29","({)":"30","(})":"31","(k)":"32","(F)":"33","(W)":"34","(D)":"35","ee_1":"1","ee_2":"2","ee_3":"3","ee_4":"4","ee_5":"5","ee_6":"6","ee_7":"7","ee_8":"8","ee_9":"9","ee_10":"10","ee_11":"11","ee_12":"12","ee_13":"13","ee_14":"14","ee_15":"15","ee_16":"16","ee_17":"17","ee_18":"18","ee_19":"19","ee_20":"20","ee_21":"21","ee_22":"22","ee_23":"23","ee_24":"24","ee_25":"25","ee_26":"26","ee_27":"27","ee_28":"28","ee_29":"29","ee_30":"30","ee_31":"31","ee_32":"32","ee_33":"33","ee_34":"34","ee_35":"35"};
var faceReg = "\\[\\):\\]|\\[:D\\]|\\[\\;\\)\\]|\\[:-o\\]|\\[:p\\]|\\[\\(H\\)\\]|\\[:@\\]|\\[:s\\]|\\[:\\$\\]|\\[:\\(\\]|\\[:'\\(\\]|\\[:\\|\\]|\\[\\(a\\)\\]|\\[8o\\|\\]|\\[8-\\|\\]|\\[\\+o\\(\\]|\\[<o\\)\\]|\\[\\|-\\)\\]|\\[\\*-\\)\\]|\\[:-#\\]|\\[:-\\*\\]|\\[\\^o\\)\\]|\\[8-\\)\\]|\\[\\(\\|\\)\\]|\\[\\(u\\)\\]|\\[\\(S\\)\\]|\\[\\(\\*\\)\\]|\\[\\(#\\)\\]|\\[\\(R\\)\\]|\\[\\({\\)\\]|\\[\\(}\\)\\]|\\[\\(k\\)\\]|\\[\\(F\\)\\]|\\[\\(W\\)\\]|\\[\\(D\\)\\]|\\[ee_1\\]|\\[ee_2\\]|\\[ee_3\\]|\\[ee_4\\]|\\[ee_5\\]|\\[ee_6\\]|\\[ee_7\\]|\\[ee_8\\]|\\[ee_9\\]|\\[ee_10\\]|\\[ee_11\\]|\\[ee_12\\]|\\[ee_13\\]|\\[ee_14\\]|\\[ee_15\\]|\\[ee_16\\]|\\[ee_17\\]|\\[ee_18\\]|\\[ee_19\\]|\\[ee_20\\]|\\[ee_21\\]|\\[ee_22\\]|\\[ee_23\\]|\\[ee_24\\]|\\[ee_25\\]|\\[ee_26\\]|\\[ee_27\\]|\\[ee_28\\]|\\[ee_29\\]|\\[ee_30\\]|\\[ee_31\\]|\\[ee_32\\]|\\[ee_33\\]|\\[ee_34\\]|\\[ee_35\\]";