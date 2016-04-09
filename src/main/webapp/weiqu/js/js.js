var windowHeight=$(window).height();
 
$(function(){
	
	$(".close_btn").click(function(){
		$(this).parent().parent().hide();			  
	})
	$(".a_1").click(function(){
		showDjcgBox();							   
	})
	$(".ndztBox .a_2").click(function(){
		showDjcgBox();							   
	})
	
	$(".a_1").click(function(){
		showDjcgBox();							   
	})
	
	$(".a_2").click(function(){
		showDjcgBox();							   
	})
	$(".a_3").click(function(){
		showDjcgBox();							   
	})
	$(".a_4").click(function(){
		showDjcgBox();							   
	})
	$(".a_5").click(function(){
		showDjcgBox();							   
	})
});

function showuplodBox(){
	$("#uplodBox").show();
	var top=(windowHeight-577)/2
	$(".uplodBox .windows_box").css("top",top)
}

function showdemandBox(){
	$(".windows").hide();
	$("#demandBox").show();
	var top=(windowHeight-630)/2
	$("#demandBox .windows_box").css("top",top)	
}

function showchannelBox(){
	$(".windows").hide();
	$("#channelBox").show();
	var top=(windowHeight-630)/2
	$("#channelBox .windows_box").css("top",top)		
}

function showroomBox(){
	$(".windows").hide();
	$("#roomBox").show();
	var top=(windowHeight-630)/2
	$("#roomBox .windows_box").css("top",top)		
}

function showportraitBox(){
	$(".windows").hide();
	$("#portraitBox").show();
	var top=(windowHeight-350)/2
	$("#portraitBox .windows_box").css("top",top)		
}

function shownickBox(){
	$(".windows").hide();
	$("#nickBox").show();
	var top=(windowHeight-250)/2
	$("#nickBox .windows_box").css("top",top)		
}


function showphoneBox(){
	$(".windows").hide();
	$("#phoneBox").show();
	var top=(windowHeight-300)/2
	$("#phoneBox .windows_box").css("top",top)		
}

function showsettingBox(){
	$(".windows").hide();
	$("#settingBox").show();
	var top=(windowHeight-600)/2
	$("#settingBox .windows_box").css("top",top)		
}

function showdianlistBox(){
	$(".windows").hide();
	$("#dianlistBox").show();
	var top=(windowHeight-300)/2
	$("#dianlistBox .windows_box").css("top",top)		
}

function showdianbjBox(){
	$(".windows").hide();
	$("#dianbjBox").show();
	var top=(windowHeight-630)/2
	$("#dianbjBox .windows_box").css("top",top)		
}