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
	WEIQU_PERSON.CREATE.gridTable.load();
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

//个人基本信息模块
$(function(){
	//基本信息显示
	var BaseView= function(){
		this.baseInfo = userToken||{};
		var view = this;
		this.render = function(){

		}

		this.request = function(){
			view.render();
		}

		this.init = function(){
			view.request();
		}
		this.init();
	}

	var baseView = new BaseView();

	WEIQU_PERSON.BASE_VIEW = baseView;

	//编辑
	var EditPanel = function(baseView){
		var panel = this;
		this.render = function(){
			var data = baseView.baseInfo;

		}
		this.show = function(){
			$(".windows").hide();
			$("#nickBox").show();
			var top=(windowHeight-250)/2
			$("#nickBox .windows_box").css("top",top)
		}
		this.init = function(){
			//弹出框
			$(".personal .per_txt a:eq(0)").click(panel.show);
		}
		this.init();
	}
	new EditPanel(baseView);
	//绑定
	var BindPanel = function(baseView){
		var panel = this;
		this.show = function(){
			$(".windows").hide();
			$("#phoneBox").show();
			var top=(windowHeight-300)/2
			$("#phoneBox .windows_box").css("top",top)
		}
		this.render = function(){
			var data = baseView.baseInfo;

		}
		this.init = function(){
			$(".personal .per_txt a:eq(1)").click(panel.show);
		}
		this.init();
	}
	new BindPanel(baseView);

	//上传图像
	var ImagePanel = function(baseView){
		var panel = this;
		this.show = function(){
			$(".windows").hide();
			$("#portraitBox").show();
			var top=(windowHeight-350)/2
			$("#portraitBox .windows_box").css("top",top);
		}
		this.render = function(){
			var data = baseView.baseInfo;

		}
		this.init = function(){
			$(".personal .per_img a").click(panel.show);
		}
		this.init();
	}
	new ImagePanel(baseView);
});



