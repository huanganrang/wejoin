var windowHeight=$(window).height();
 
$(function(){
	
	$(".close_btn").click(function(){
		$(this).parent().parent().hide();			  
	});
	$(".a_1").click(function(){
		showDjcgBox();							   
	});
	$(".ndztBox .a_2").click(function(){
		showDjcgBox();							   
	});
	
	$(".syld_from ul li dd.d_3 .s_1 a").mouseover(function(){												   
		var s_i=$(this).index()+1;
		var this_parent=$(this).parent();
		this_parent.children("a").attr("class","");
		for(var i=0;i<s_i;i++){
			this_parent.children("a").eq(i).attr("class","click");
		}
		this_parent.parent().children(".s_2").html(s_i+"心");
	});
	$(".syld_from ul li dd.d_3 .s_1 a").mouseout(function(){
		var pTar=$(this).parent().attr("tar");
		var this_parent=$(this).parent();
		this_parent.children("a").attr("class","");	
		if(!pTar){
			this_parent.parent().children(".s_2").html("");
		}else{
			this_parent.parent().children(".s_2").html(pTar+"心");
			for(var i=0;i<pTar;i++){
				this_parent.children("a").eq(i).attr("class","click")
			}
		}
	});
	
	$(".syld_from ul li dd.d_3 .s_1 a").click(function(){
		var ci=$(this).index()+1;
		$(this).parent().attr("tar",ci)	;											   
	});
	
	$("#login_btn").bind('click', login);
	$("#syldBox .validCode_btn").bind('click', "register", getValidCode);
	$("#register_btn").bind('click', register);
});


function register() {
	var mobile = $("#syldBox #telphone").val();
	var valiCode = $("#syldBox #validCode").val();
    var password = $("#syldBox #password").val();
    var username = $("#syldBox #username").val();
    $.ajax({
        type: "POST",
        url: "api/apiCommon/doPost",
        data: {"type":"UL003", "param":JSON.stringify({"mobile":mobile,"nickName":username,"password":password,"validCode":valiCode})},
        dataType:"json",
        success:function (data) {
        	alert(data.obj);
        	var json = JSON.parse(data.obj);
        }
    });
}

function login() {
    var password = $("#djcgBox #password").val();
    var username = $("#djcgBox #username").val();
    $.ajax({
        type: "GET",
        url: "api/apiCommon/doGet",
        data: {"type":"UL001", "mobile":username, "password":password, "validCode":""},
        dataType:"json",
        success:function (data) {
        	alert(data.obj);
        	var json = JSON.parse(data.obj);
        }
    });
}

function getValidCode(event) {
	var mobile = $(".syldBox #telphone").val();
    $.ajax({
        type: "POST",
        url: "api/apiCommon/doPost",
        data: {"type":"UL002", "param":JSON.stringify({"mobile":mobile,"channel":event.data})},
        dataType:"json",
        success:function (data) {
        	alert(data.obj);
        	var json = JSON.parse(data.obj);
        }
        
    });
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

function showLoginBox(){
	$(".windows").hide();
	$("#loginBox").show();
	var top=(windowHeight-377)/2;
	$("#loginBox .windows_box").css("top",top);		
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