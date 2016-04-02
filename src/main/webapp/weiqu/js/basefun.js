//基本功能函数
var WEIQU_BASE_FUN = {
}
//登陆功能
WEIQU_BASE_FUN.login = function(){
	var username = $("#username").val();
	if (Util.checkInputNull($("#username"))) {
		$("#username").focus();
		return false;
	}
	var password = $("#password").val();
	if (Util.checkInputNull($("#password"))) {
		$("#password").focus();
		return false;
	}
	ajaxGet({"type": "UL001", "identifier": username, "password": password},function (data) {
		if (data.serverStatus == 0) {
			window.location.href="/weiqu/channel.jsp";
		} else {
			alert(data.returnMessage);
		}
	},function(data){
		return data;
	});
}
WEIQU_BASE_FUN.checkMobile = function(mobile){
	if(mobile == "") {
		alert("请输入手机号");
		return false;
	}
	if(!Util.checkphone(mobile)) {
		alert("手机号格式不正确");
		return false;
	}
	return true;
}
//注册功能
WEIQU_BASE_FUN.register = function() {

	var username = $("#username").val();
	if(Util.checkInputNull($("#username"))) {
		$("#username").focus();
		return;
	}
	var mobile = $("#telphone").val();
	if(!WEIQU_BASE_FUN.checkMobile(mobile)) {
		$("#telphone").focus();
		return;
	}
	var valiCode = $("#validCode").val();
	if(Util.checkInputNull($("#validCode"))) {
		$("#validCode").focus();
		return;
	}

	var password = $("#password").val();
	if(Util.checkInputNull($("#password"))) {
		$("#password").focus();
		return;
	} else {
		if(!Util.checkpassword(password)) {
			alert("密码由6-20位字母,数字组合");
			$("#password").focus();
			return;
		}
	}
	ajaxPost({"type":"UL003", "param":JSON.stringify({"mobile":mobile,"nickName":username,"password":password,"validCode":valiCode})},function (json) {

		if(json.serverStatus == 0) {
			window.location.href="/weiqu/login.jsp";
		} else {
			// 注册失败
			alert(json.returnMessage);
		}

	},function(data){
		return data;
	});
}

//登出
WEIQU_BASE_FUN.logout = function(){
	var url = base+"api/apiCommon/logout";
	window.location.href = url;
}
//验证手机号
WEIQU_BASE_FUN.time = 60;
WEIQU_BASE_FUN.start = false;
WEIQU_BASE_FUN.getValidCode = function(){
	if(WEIQU_BASE_FUN.start)return;
	var _this = $(this);
	function start(){
		_this.html("短信发送中");
		WEIQU_BASE_FUN.start = true;
		WEIQU_BASE_FUN.time--;
	}

	function end(msg){
		WEIQU_BASE_FUN.time = 60;
		if(interval)
		clearInterval(interval);
		if(msg)
		_this.html(msg);
		WEIQU_BASE_FUN.start = false;
	}

	var mobile = $.trim($("#telphone").val());
	if(!WEIQU_BASE_FUN.checkMobile(mobile)) {
		return;
	}
	var interval;
	ajaxPost({
		"type": "UL002", "param": JSON.stringify({"mobile": mobile, "channel":"register"})
	}, function (json) {
		if (json.serverStatus == 0) {
			interval = setInterval(function(){
				_this.html(WEIQU_BASE_FUN.time+"秒后重新发送");
				if(WEIQU_BASE_FUN.time == 0) {
					end("重新获取")
				} else {
					WEIQU_BASE_FUN.time-- ;
				}
			}, 1000);
		} else {
			end("获取验证码失败");
		}
	}, function (data) {
		return data
	});
	start();
}


