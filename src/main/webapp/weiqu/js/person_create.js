//个人中心_我的创建
(function(person){
	person.CREATE = {};
	var CREATE = person.CREATE;
	//我的创建列表页面
	var GridTable = function(){
		var table = this;
		//渲染
		this.render = function(data){
			var viewData = Util.cloneJson(data);
			viewData.userOnlineCount = "在线：" + (viewData.userOnlineCount||0);
			viewData.displayIconUrl = viewData.displayIconUrl?"http://" + viewData.displayIconUrl:"images/p1.gif";
			viewData.displayIconUrl = '<img src="' + viewData.displayIconUrl + '" />';
			viewData.nickName = 'ID：' + viewData.nickName;
			var dom =  Util.cloneDom("template_my_create",data,viewData);
			table.bindClick(dom,data);
			table.clearDom.before(dom);
		};
		//ajax请求
		this.request= function(params){
			params = $.extend({"pageSize": 1000, "pageNo": 1,"type": "UL101"},params)
			ajaxGet(params, function (json) {
				//总数
				var channelTotal = json.returnValue;
				table.countDom.text(channelTotal);
				var channels = json.returnObject;
				for (var i = 0; i < channels.length; i++) {
					var channel = channels[i];
					table.render(channel);
				}
			}, function (data) {
				return data;
			});
		};
		this.bindClick = function(dom,data){
			dom.find("b a").click(data, table.delete);
			dom.find("ol a").click(data, table.edit);
			dom.dblclick(data,table.dbClick);
		}
		//修改事件
		this.edit = function(event){
			var data  = event.data;
		}
		//双击事件
		this.dbClick = function(event){
			var data  = event.data;
			$("[class*='person_create']").hide();
			$(".person_create_room").show();
			$(".person_create_room div1").text(data.name);
			table.select = data;
			person.CREATEROOM.gridTable.load();
		}
		//删除事件
		this.delete = function(event){
			var data  = event.data;
		}
		this.init = function(){
			table.clearDom = $(".person_create ul >.clear");
			table.countDom = $(".person_create >em");

		}
		this.clear = function(){
			//清除
			table.clearDom.prevAll().remove();
			table.countDom.text(0);
			$("[class*='person_create']").hide();
			$(".person_create").show();

		}
		this.load = function(){
			table.clear();
			table.request({"userToken":userToken.token});
		}
		this.init();
	}
	//实例化表格对象
	CREATE.gridTable = new GridTable();
})(WEIQU_PERSON);





