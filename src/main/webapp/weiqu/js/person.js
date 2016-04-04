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
		var id = $(this).attr("id");
		$('.'+id).show();
		var events = id.split("_");
		var loadPageFun = "WEIQU_PERSON.load"+Util.firstUpper(events[1])+"();";
		try{
			eval(loadPageFun);
			WEIQU_PERSON.resize();
		}catch(e){
		}

	});
}
//点击我的创建加载事件
WEIQU_PERSON.loadCreate = function(){
	var data = {"channelName":"我是测试的","online":777,"description":"我是个搬砖的"};
	var viewDate = Util.cloneJson(data);
	viewDate.online = "在线:"+data.online;
	var dom =  Util.cloneDom("template_my_create",data,viewDate);
	//将dom对象插入
	$(".person_create ul >.clear").before(dom);
}
//加载我的关注
WEIQU_PERSON.loadAttention = function(){
	alert("加载我的关注");
}
//加载我的意见
WEIQU_PERSON.loadIdea = function(){
	alert("加载我的意见");

}
//加载我的消息
WEIQU_PERSON.loadMessage = function(){
	alert("加载我的消息");

}
//加载我的空间
WEIQU_PERSON.loadSpace = function(){
	alert("加载我的空间");

}

WEIQU_PERSON.my_create_edit = function(){

}

//重新调整页面
WEIQU_PERSON.resize = function(){

}




