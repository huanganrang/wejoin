var conn = null;
var wechat = null;
var users = []; // 缓存用户，获取昵称
$(function(){
	if($("#userToken").val() == '') {
		window.location.href = '../login.jsp';
	}
	if(!$.cookie($("#houseToken").val())) {
		window.location.href = 'home.jsp';
	}
	initMembersList();
	wechat = new WeChat();
	wechat.init();
	connInit();
	
    login();
    
    $(window).bind('beforeunload', function() {
        if (conn) {
        	conn.clear();
			conn.onClosed();
        }
        //  调用退出接口
		$.ajax({
	        type: "POST",
	        url: base+"api/apiCommon/doPost", // HouseUser/HouseUser
	        data: {"type":"UL031", "param":JSON.stringify({"houseToken":$("#houseToken").val(),"userToken":$("#userToken").val()})},
	        dataType:"json",
	        success:function (data) {
	        }
	    });
		$.cookie($("#houseToken").val(), null);
    });
    
});

function connInit() {
	 conn = new Easemob.im.Connection();
     
    conn.init({
         onOpened : function() {
        	 console.log("成功登录");
//		         alert("成功登录");
	         conn.setPresence();
         },
         onTextMessage : function(message){
			console.log(message);
			if(message.from != $("#huanxinUid").val()) {
				var fromUsername = message.from;
				if(users[message.from]) fromUsername = users[message.from].nickName;
				wechat._displayNewMsg({'username':fromUsername,'owner':false, 'content':message.data});
			}
		},
		//收到表情消息时的回调方法
        onEmotionMessage : function(message) {
        	console.log(message);
        	if(message.from != $("#huanxinUid").val()) {
        		var fromUsername = message.from;
				if(users[message.from]) fromUsername = users[message.from].nickName;
        		wechat._displayNewMsg({'username':fromUsername,'owner':false, 'content':message});
        	}
        },
		//当连接关闭时的回调方法
		onClosed : function() {
		}
    });
}

var login = function(){
	var user = $("#huanxinUid").val();
    var pass = $("#password").val();
    //根据用户名密码登录系统
    conn.open({
        apiUrl : Easemob.im.config.apiURL,
        user : user,
        pwd : pass,
        //连接时提供appkey
        appKey : Easemob.im.config.appkey
    });         
    return false;
};

var sendText = function(msg) {
	if(!conn.isOpened()) {
		connInit();
		login();
	}
	var options = {
		to : $("#huanxinRoomId").val(),
//		to : '125914257123443160',
		msg : msg,
		type : "groupchat"
	};
	conn.sendTextMessage(options);
	msg = msg.replace(/\n/g, '<br>');
	wechat._displayNewMsg({'username':$("#nickName").val(),'owner':true, 'content':msg});
};

var WeChat = function() {
	//this.stompClient = null;
};

function initMembersList() {
	$.ajax({
        type: "POST",
        url: base+"api/apiCommon/doGet", // HouseUser/HouseUsers
        data:{"type":"UL030", "houseToken":$("#houseToken").val()},
        dataType:"json",
        async: false,
        success:function (data) {
        	if(data.obj){
        		console.log("获取房间用户：" + data.obj);
        		var result = $.parseJSON(data.obj);
        		if(result.serverStatus == 0) {
        			var members = result.returnObject;
        			for(var i in members) {
        				users[members[i].huanxin_uid] = members[i];
        				var userIcon = members[i].userIcon || '';
        				var $li = $('<li><a href="javascript:void(0);" userToken="'+members[i].userToken+'"><img src="'+userIcon+'" />'+members[i].nickName+'</a></a></li>');
        				$(".v_ren ul").append($li);
        			}
        		}
        	}		            	
    	}
   });
}

WeChat.prototype = {
	init : function() {
		this._initFace();
		// 回车发送消息
		$("#content").bind('keyup', function(e){
			var content = $("#content").val();
			if (e.keyCode == 13 && $.trim(content) != '') {
				$("#content").val('');
				// 发送聊天消息
				sendText(content);
            };
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
	},
	_initFace: function() {
		var _this = this;
		var sjson = Easemob.im.Helper.EmotionPicData;
        for ( var key in sjson) {
            var emotions = $('<img>').attr({
                "id" : key,
                "src" : sjson[key],
                "style" : "cursor:pointer;width: 26px; height: 26px;"
            }).click(function() {
            	_this._selectEmotionImg(this);
            });
            $('<a>').append(emotions).appendTo($('#faceWrapper'));
        }
    },
    // 渲染文本消息
	_displayNewMsg: function(data) {
		var owner = data.owner;
		var ownerClass = (owner && 'wo') || (!owner && '');
        var $arrow = (owner && '<em></em>') || (!owner && '<ol></ol>');
        
//        var content = this._showFace(data.content); // 过滤表情
        var	messageContent;
        if (typeof data.content == 'string') {
        	messageContent = Easemob.im.Helper.parseTextMessage(data.content);
        	messageContent = messageContent.body;
        } else {
        	messageContent = data.content.data;
        }
        
        var content = '';
        for (var i = 0; i < messageContent.length; i++) {
            var msg = messageContent[i];
            var type = msg.type;
            var r = msg.data;
            
            if (type == "emotion") {
            	content += '<img src="'+r+'" style="width: 19px;  height: 19px;"/>';
            }else {
            	content += r;
            }
        }
        
        // TODO 根据users动态取头像、昵称
		var $messageHtml = '<li class="'+ownerClass+'">'
					+ '<div class="ltian_img"><a><img src="images/tx.gif" /></a></div>'
					+ '<div class="ltian_txt">'
					+ '<span>'+data.username+'</span>'
					+ '<div class="txt_zi">'+content+'</div>' + $arrow
					+ '</div><div class="clear"></div></li>';
		
		$(".ltian ul").append($messageHtml);
		$("#box4 .content").mCustomScrollbar("scrollTo", "bottom"); // 滚动至底部
    },
    // 表情点击事件
    _selectEmotionImg:function(selImg){
    	var content = $("#content").val();
		content += selImg.id;
		$("#content").val(content);
		$("#content").focus();
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