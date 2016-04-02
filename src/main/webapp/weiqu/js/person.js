//个人中心
var WEIQU_PERSON = {};
$(document).ready(function () {
	WEIQU_PERSON.bind();
});

//绑定事件
WEIQU_PERSON.bind = function(){
	//左侧菜单绑定手机
	$(".menu_list .menu_head").click(function () {
		$(this).addClass("on").siblings().removeClass("on");
		//对于的tab隐藏与显示
		$('.person_center').hide();
		$('.'+$(this).attr("id")).show();
	});
}



