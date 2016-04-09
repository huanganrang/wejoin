//个人中心_我的创建_房间列表
(function(person){
	person.CREATEROOM = {};
	var ROOM = person.CREATEROOM;
	var GridTable = function(){
		var table = this;
		//渲染
		this.render = function(data){
			var viewData = Util.cloneJson(data);
			var dom =  Util.cloneDom("template_my_create_room",data,viewData);
			table.ul.append(dom);
			table.bindClick(dom,data);
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
			//dom.dblclick(data,table.dbClick);
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
			$(".person_create_room ol").prevAll().remove();
			$(".person_create_room ol").before(data.name+'-房间列表（<em>247</em> )');
		}
		//删除事件
		this.delete = function(event){
			var data  = event.data;
		}
		this.init = function(){
			table.countDom = $(".person_create >em");
			table.ul = $(".person_create_room >ul");

		}
		this.clear = function(){
			//清除
			table.ul.children().remove();
			table.countDom.text(0);
		}
		this.load = function(){
			table.clear();
			table.request({"userToken":userToken.token});
		}
		this.init();
	}
	//实例化表格对象
	ROOM.gridTable = new GridTable();
})(WEIQU_PERSON);





