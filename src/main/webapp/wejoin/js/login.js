var windowHeight=$(window).height();
var time = 59;

$(function(){
	
	$(".close_btn").click(function(){
		$(this).parent().parent().hide();			  
	});
	$(".a_1").click(function(){
		showDjcgBox();							   
	});
	
	$("#login_btn").bind('click', login);
	$("#syldBox .validCode_btn").bind('click', "register", getValidCode);
	$("#register_btn").bind('click', register);
});


function register() {
	var mobile = $("#syldBox #telphone").val();
	if(!checkMobile(mobile)) {
		$("#syldBox #telphone").focus();
		return;
	}
	var valiCode = $("#syldBox #validCode").val();
	if(valiCode == '') {
		$("#syldBox #validCode").focus();
		return;
	}
	var username = $("#syldBox #username").val();
	if(username == '') {
		$("#syldBox #username").focus();
		return;
	}
    var password = $("#syldBox #password").val();
    if(password == '') {
    	$("#syldBox #password").focus();
		return;
	} else {
		if(!checkpassword(password)) {
			alert("密码由6-20位字母,数字组合");
			$("#syldBox #password").focus();
 	 		return;
		}
	}
    
    $.ajax({
        type: "POST",
        url: "api/apiCommon/doPost", // User/User
        data: {"type":"UL003", "param":JSON.stringify({"mobile":mobile,"nickName":username,"password":password,"validCode":valiCode})},
        dataType:"json",
        success:function (data) {
//        	alert(data.obj);
        	var json = JSON.parse(data.obj);
        	if(json.serverStatus == 0) {
        		alert("注册成功");
        		showDjcgBox();	
        	} else {
        		// 注册失败
        		alert(json.returnMessage);
        	}
        }
    });
}

function login() {
	var username = $("#djcgBox #username").val();
	if(username == "") {
		$("#djcgBox #username").focus();
		return false;
	}
    var password = $("#djcgBox #password").val();
    if(password == "") {
    	$("#djcgBox #password").focus();
		return false;
	} 
    $.ajax({
        type: "GET",
        url: "api/apiCommon/doGet", // User/User
        data: {"type":"UL001", "mobile":username, "password":password},
        dataType:"json",
        success:function (data) {
//        	alert(data.obj);
        	var json = JSON.parse(data.obj);
        	if(json.serverStatus == 0) {
        		window.location.href = 'wejoin/home.jsp';
        	} else {
        		// 登录失败
        		alert(json.returnMessage);
        	}
        }
    });
}

var interval;
function getValidCode(event) {
	var mobile = $.trim($(".syldBox #telphone").val());
	if(!checkMobile(mobile)) {
		return;
	}
	
	$("#syldBox .validCode_btn").html("<div style='font-size:8pt;'>重新发送（<font id=\"time\" style='font-size:8pt;'>"+time+"</font>）</div>").unbind("click");
	time--;
	interval = setInterval(function(){
		$("#time").html(time);
		if(time == 0) {
			clearInterval(interval);
			$("#syldBox .validCode_btn").html("点击获取").bind('click', "register", getValidCode);
			time = 59;
		} else {
			time -- ;
		}
  	}, 1000);
	
    $.ajax({
        type: "POST",
        url: "api/apiCommon/doPost", // ValidCode/ValidCode
        data: {"type":"UL002", "param":JSON.stringify({"mobile":mobile,"channel":event.data})},
        dataType:"json",
        success:function (data) {
//        	alert(data.obj);
        	var json = JSON.parse(data.obj);
        	if(json.serverStatus == 0) {
        		// 成功
        	} else {
        		alert("获取验证码失败");
        		clearInterval(interval);
    			$("#syldBox .validCode_btn").html("点击获取").bind('click', "register", getValidCode);
    			time = 59;
        	}
        }
        
    });
}

function checkMobile(mobile) {
	if(mobile == "") {
		alert("请输入手机号");
		return false;
	}
	if(!checkphone(mobile)) {
		alert("手机号格式不正确");
		return false;
	}

	return true;
}

function showSyplqBox(){
	$("#syplqBox").show();
	var top=(windowHeight-568)/2;
	$(".syplqBox .windows_box").css("top",top);
}

function showDjcgBox(){
	$(".windows").hide();
	$("#djcgBox").show();
	var top=(windowHeight-473)/2;
	$("#djcgBox .windows_box").css("top",top);
}

function showSyldBox(){
	$(".windows").hide();
	$("#syldBox").show();
	var top=(windowHeight-parseInt($("#syldBox .windows_box").height()))/2;
	$("#syldBox .windows_box").css("top",top);		
}

function showTjcgBox(){
	$(".windows").hide();
	$("#tjcgBox").show();
	var top=(windowHeight-parseInt($("#tjcgBox .windows_box").height()))/2;
	$("#tjcgBox .windows_box").css("top",top);			
}