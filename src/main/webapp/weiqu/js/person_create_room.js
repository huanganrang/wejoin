//个人中心_我的创建_房间列表
(function(person){
	person.CREATEROOM = {};
	var ROOM = person.CREATEROOM;
	var GridTable = function(){
		var table = this;
		//渲染
		this.render = function(data){
			var viewData = Util.cloneJson(data);
			viewData.onlineUserCount = "在线："+viewData.onlineUserCount;
			var dom =  Util.cloneDom("template_my_create_room",data,viewData);
			dom.find(".fj_1 b a").click(function(){
				var target =dom.find(".fj_1 .fj_box");
				var isHidden = target.is(":hidden");
				$(".person_create_room ul .fj_box").hide();
				if(isHidden){
					target.show();
				}else{
					target.hide();
				}
			});
			dom.find(".fj_2:eq(0) b a").click(function(){
				var target = dom.find(".fj_2:eq(0) .fj_box");
				var isHidden = target.is(":hidden");
				$(".person_create_room ul .fj_box").hide();
				if(isHidden){
					target.show();
				}else{
					target.hide();
				}
			});
			dom.find(".fj_2:eq(1) b a").click(function(){
				var target =dom.find(".fj_2:eq(1) .fj_box");
				var isHidden = target.is(":hidden");
				$(".person_create_room ul .fj_box").hide();
				if(isHidden){
					target.show();
				}else{
					target.hide();
				}
			});
			table.ul.append(dom);
			table.bindClick(dom,data);
		};
		//ajax请求
		this.request= function(params){
			params = $.extend({"type": "UL012"},params)
			ajaxGet(params, function (rooms) {
				for(var i in rooms){
					var room = rooms[i];
					table.render(room);
				}
				$(".person_create_room:eq(0) em").text(rooms.length);
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

		}
		//删除事件
		this.delete = function(event){
			var data  = event.data;
		}
		this.init = function(){
			table.countDom = $(".person_create >em");
			table.ul = $(".person_create_room >ul");
			$(".person_create_room span>a").click(function(){
				$(".person_create_room:eq(1)").toggle();
				$(".person_create_room_create").toggle();
			})
		}
		this.clear = function(){
			//清除
			table.ul.children().remove();
			table.countDom.text(0);
		}
		this.load = function(){
			table.clear();
			var select = person.CREATE.gridTable.select;
			table.request({"channelToken":select.token});
		}
		this.init();
	}
	//实例化表格对象
	ROOM.gridTable = new GridTable();

	//创建房间表单
	$(".currl_right .currl_an a").click(function(){
		var data = $.serializeObject($(".currl_left form"));
		var rightData = $.serializeObject($(".currl_right form"));
		var schedules = [];
		data.schedules = schedules;
		var startDate = rightData.startDate.replace(/\//g,"-");
		startDate = startDate.split(",");
		var startTime = rightData.startTime.split(",");
		var endDate = rightData.endDate.replace(/\//g,"-");
		endDate = endDate.split(",");
		var endTime = rightData.endTime.split(",");
		$(startDate).each(function(i){
			schedules.push({"startDate":startDate[i]+" "+startTime[i],"endDate":endDate[i]+" "+endTime[i]})
		})
		var select = person.CREATE.gridTable.select;
		data.channelToken = select.token;
		data.userToken = userToken.token;
		ajaxPost({"type":"UL042","param":data},function(data){},function (data) {
			return data;
		})
	});

})(WEIQU_PERSON);





