var windowHeight=$(window).height();
var pageSize = 12;
 
$(function(){
	$(".close_btn").click(function(){
		$(this).parent().parent().hide();			  
	});
	
//	$("#createChannelBtn").bind('click', function(){
//		$("#createChannelForm").submit();
//	});
	
	$('#createChannelForm').form({
		url : base+"api/apiCommon/doPost", //
		onSubmit : function() {
			
			var userToken = $("#userToken").val();
			if(!userToken) {
				alert("您还未登录，请先登录！");
				return false;
			}
			
			var channelIcon = $("#uploadFile").val();
		    if(channelIcon == '') {
				alert("请选择频道封面照");
				return false;
			}
		    var name = $("#channelName").val();
		    if(name == '') {
				$("#channelName").focus();
				return false;
			}
		    var categoryId = $("#categoryId").val();
		    if(categoryId == '') {
				alert("请选择频道类别");
				return false;
			}
		    var shortDesc = $("#shortDesc").val();
			if(shortDesc == '') {
				$("#shortDesc").focus();
				return false;
			}
			$("#type").val("UL011");
			$("#param").val(JSON.stringify({"shortDesc":shortDesc,"name":name,"categoryId":categoryId,"userToken":userToken}));
			
			return true;
		},
		success : function(data) {
			console.log("创建房间data:" + data);
			data = $.parseJSON(data);
			if(data.obj){
				console.log("创建房间data.obj:" + data.obj);
        		var result = $.parseJSON(data.obj);
				if(result.serverStatus == 0) {
	        		var channel = result.returnObject;
	        		var $channelTemplate = $("#channelTemplate");	
	        		var $channelItem = $channelTemplate.clone().removeAttr("id").show();
	        		$("#con_one_1 .list_main1 ul").prepend($channelItem);
	        		$("#con_one_1 .list_main1 ul li:last").remove();
	        		$channelItem.find(".list_1 span").html(channel.name);
	        		$channelItem.find(".list_1 em").html("在线：0"); 
	        		$channelItem.find(".list_2 span img").attr("src", 'http://' + channel.displayIconUrl);
	        		$channelItem.find(".list_2 em").html(channel.shortDesc); 
	        		$channelItem.find(".list_3 span").html("创建者：" + channel.nickName); 
            		$channelItem.find(".list_3 em a").attr('channelToken', channel.token).attr("channelId", channel.id).bind("click", function(){
            			channel_roomPage($(this).attr("channelId"), $(this).attr("channelToken"));
            		}); 
	        		
	        		$(".windows").hide();
	        	} else {
	        		// 创建失败
	        		alert(result.returnMessage);
	        	}
			}
		}
	});
	
	$('#createRoomForm').form({
		url : base+"api/apiCommon/doPost", //
		onSubmit : function() {
			var userToken = $("#userToken").val();
			if(!userToken) {
				alert("您还未登录，请先登录！");
				return false;
			}
			
			var roomTitle = $("#roomTitle").val();
		    if(roomTitle == '') {
		    	$("#roomTitle").focus();
				return false;
			}
		    var livePsw = $("#livePsw").val();
		    if(livePsw == '') {
		    	$("#livePsw").focus();
		    	return false;
		    }
		    var startTime = $("#startTime").val();
		    if(startTime == '') {
				$("#startTime").focus();
				return false;
			}
		    var endTime = $("#endTime").val();
			if(endTime == '') {
				$("#endTime").focus();
				return false;
			}
			var channelToken = $("#channelToken_addRoom").val();
			$(this).find("[name=type]").val("UL042");
			$(this).find("[name=param]").val(JSON.stringify({"title":roomTitle,"password":livePsw,"startTime":startTime,"endTime":endTime,"channelToken":channelToken,"userToken":userToken}));
			
			return true;
		},
		success : function(data) {
			console.log("创建房间data:" + data);
			data = $.parseJSON(data);
			if(data.obj){
				console.log("创建房间data.obj:" + data.obj);
        		var result = $.parseJSON(data.obj);
				if(result.serverStatus == 0) {
					channel_roomPage($("#channelId_addRoom").val(), $("#channelToken_addRoom").val(),$("#channelName_addRoom").val());
	        	} else {
	        		// 创建失败
	        		alert(result.returnMessage);
	        	}
			}
		}
	});
	
	channelPage(1); // 频道列表
	communityPage(1); // 社区列表
	channelCategory(); // 频道分类
	communityCategory(); // 社区分类
//	channel_roomPage(); // 频道房间列表
	
	function ProcessFile() {
		var file = document.getElementById('uploadFile').files[0];
		if (file) {
			var reader = new FileReader();
			reader.onload = function ( event ) {
				var txt = event.target.result;
				$('.img-preview').attr('src',txt);
			};
		}
	    reader.readAsDataURL(file);
	}
	$(document).delegate('#uploadFile','change',function () {
		if($(this).val() == '') {
			$('.img-preview').attr('src','images/xj.gif');
		} else {
			ProcessFile();
		}
		
	});
});


function showChcBox(){
	$(".windows").hide();
	$("#chcBox").show();
	var top=(windowHeight-473)/2;
	$("#chcBox .windows_box").css("top",top);
}

function showLoginBox(){
	$(".windows").hide();
	$("#loginBox").show();
	var top=(windowHeight-577)/2;
	$("#loginBox .windows_box").css("top",top);		
}

function showChannelAddBox(){
	$(".windows").hide();
	$("#chaBox").show();
	var top=(windowHeight-parseInt($("#chaBox .windows_box").height()))/2;
	$("#chaBox .windows_box").css("top",top);	
	
	$("#categoryId").empty();
	var categorys = getCategorys("UL013");
	for(var i in categorys) {
		var $option = $('<option value="'+categorys[i].id+'">'+categorys[i].name+'</option>');
		$("#categoryId").append($option);
	}
}

var channelTotal;
function channelPage(pageNo){
	$.ajax({
        type: "POST",
        url: base+"api/apiCommon/doGet", // Channel/Page
        data:{"pageSize":pageSize,"pageNo":pageNo,"type":"UL010"},
        dataType:"json",
        success:function (data) {
        	if(data.obj){
        		console.log("获取频道：" + data.obj);
        		var result = $.parseJSON(data.obj);
        		if(result.serverStatus == 0) {
        			if(!channelTotal) {
        				channelTotal = result.returnValue;
        				createPage(channelTotal, 1);
        			}
        			var channels = result.returnObject;
                	var $channelTemplate = $("#channelTemplate");
                	$("#con_one_1 .list_main1 ul li:not(:first)").remove();
					var userTokenName = $("#userToken").val();
                	for(var i=0; i<channels.length; i++) {
                		var $channelItem = $channelTemplate.clone().removeAttr("id").show();
                		$("#con_one_1 .list_main1 ul").append($channelItem);
                		$channelItem.find(".list_1 span").attr('title', channels[i].name).html(channels[i].name);
                		$channelItem.find(".list_1 em").html("在线：" + channels[i].userOnlineCount);
                		$channelItem.find(".list_2 span img").attr("src", 'http://' + channels[i].displayIconUrl);
                		$channelItem.find(".list_2 em").attr('title', channels[i].shortDesc).html(channels[i].shortDesc);
                		$channelItem.find(".list_3 span").html("创建者：" + channels[i].nickName);
                		$channelItem.find(".list_3 em a").attr('channelToken', channels[i].token).attr("channelId", channels[i].id).attr("channelName", channels[i].name).bind("click", function(){
                			channel_roomPage($(this).attr("channelId"), $(this).attr("channelToken"),$(this).attr("channelName"));
                		});
						if(userTokenName === channels[i].userToken){
							$channelItem.find(".list_3 ol").attr({'channelToken': channels[i].token, 'channelId': channels[i].id, 'channelName': channels[i].name}).show().bind("click", function(){
								$("#channelToken_addRoom").val($(this).attr("channelToken"));
								$("#channelId_addRoom").val($(this).attr("channelId"));
								$("#channelName_addRoom").val($(this).attr("channelName"));
								showLoginBox();
							});
						}
                	}
        		}
        	}
        }
	});
}

function createPage(total, type) {
	var totalPage = parseInt(total%pageSize == 0 ? total/pageSize : total/pageSize + 1);
	var $page = $("#con_one_" + type).find(".content");
	$page.empty();
	var html = '';
	for(var i=1; i<=totalPage; i++) {
		html += '<a href="javascript:void(0);">'+i+'</a>';
	}
	$page.append(html);
	$page.find("a").bind("click", function(){
		var currentPage = $(this).closest(".fax_list").find('span').html();
		var selPage = $(this).html();
		if(selPage != currentPage) {
			$(this).closest(".fax_list").find('span').html(selPage);
			if(type == 1) channelPage(selPage);
			else if(type == 2) communityPage(selPage);
		}
	});
	
	$page.mCustomScrollbar();
}

function previousPage(self, type) {
	var currentPage = parseInt($(self).parent().find(".fax_list span").html());
	if(currentPage == 1) return;
	
	$(self).parent().find(".fax_list span").html(currentPage-1);
	if(type == 1) channelPage(currentPage-1);
	else if(type == 2) communityPage(currentPage-1);
}

function nextPage(self, type) {
	var maxPage = parseInt($(self).parent().find(".content a:last").html());
	var currentPage =  parseInt($(self).parent().find(".fax_list span").html());
	if(currentPage == maxPage) return;
	
	$(self).parent().find(".fax_list span").html(currentPage+1);
	if(type == 1) channelPage(currentPage+1);
	else if(type == 2) communityPage(currentPage+1);
}

function channel_roomPage(channelId, channelToken,channelTitle){
	$.ajax({
        type: "POST",
        url: base+"api/apiCommon/doGet", // House/Houses
        data:{"channelToken":channelToken,"type":"UL012"},
        dataType:"json",
        success:function (data) {
        	if(data.obj){
        		console.log("获取房间：" + data.obj);
        		var result = $.parseJSON(data.obj);
        		if(result.serverStatus == 0) {
        			var rooms = result.returnObject;
        			if(rooms.length > 0) {
        				$("#roomsCount").html(rooms.length);
        				var $roomTemplate = $("#channel_roomTemplate");
						$(".dj_title span strong").text(channelTitle);
        				$(".fz_xt ul li:not(:first)").remove();
						for (var i = 0; i < rooms.length; i++) {
							var $roomItem = $roomTemplate.clone().removeAttr("id").show();
							$(".fz_xt ul").append($roomItem);
							$roomItem.find(".list_1 span").attr('title', rooms[i].title).html(rooms[i].title);
							$roomItem.find(".list_1 em").html("在线：" + (rooms[i].onlineUserCount || 0));
							$roomItem.find(".list_2 span img").attr("src", "http://" + rooms[i].houseIcon);
//                    		$roomItem.find(".list_2 em").html(''); //TODO 不明
							$roomItem.find(".list_3 span:eq(0)").html("房号：" + rooms[i].id);
							$roomItem.find(".list_3 span:eq(1)").html("房主：" + rooms[i].adminNickName);
							$roomItem.find(".list_3 em a").attr({
								"houseId": rooms[i].id,
								"houseToken": rooms[i].token,
								"huanxinRoomId": rooms[i].huanxinRoomId,
								"adminToken" : rooms[i].adminToken
							}).bind("click", function () {
								var userToken = $("#userToken").val();
								var houseToken = $(this).attr("houseToken");
								var houseId = $(this).attr("houseId");
								var huanxinRoomId = $(this).attr("huanxinRoomId");
								var adminToken = $(this).attr("adminToken");
								var owner = adminToken == userToken;
								function joinHouse() {
									//  调用joinHouse接口
									ajaxPostSync({
										"type": "UL014",
										"param": JSON.stringify({"houseToken": houseToken, "userToken": userToken})
									}, function () {
										$.cookie(houseToken, true);
									});
								}

								if (userToken) {
									ajaxPostSync({
										"type": "UL031",
										"param": JSON.stringify({"houseToken": houseToken, "userToken": userToken})
									}, function () {
										joinHouse();
									});
								} else {
									ajaxPostSync({"type": "UL037"}, function (data) {
										var username = data.huanxinUid;
										var password = data.password;
										userToken = data.token;
										ajaxGetSync({
											"type": "UL040",
											"huanxinUid": username,
											"password": password
										}, function () {
											joinHouse();
										});
									});
								}

								var href = 'room.jsp?houseToken=' + houseToken
									+ '&houseId=' + houseId
									+ '&channelId=' + channelId
									+ '&huanxinRoomId=' + huanxinRoomId
									+ '&owner=' + owner;
								window.open(href);
							});
						}

						showChcBox();
        			} else {
        				alert("亲！该频道下还没有房间！");
        			}
        		}
        	}
        }
	});
}

var communityTotal;
function communityPage(pageNo){
	$.ajax({
        type: "POST",
        url: base+"api/apiCommon/doGet", //
        data:{"pageSize":pageSize,"pageNo":pageNo,"type":"UL020"},
        dataType:"json",
        success:function (data) {
        	if(data.obj){
        		var result = $.parseJSON(data.obj);
        		if(result.serverStatus == 0) {
        			if(!communityTotal) {
        				communityTotal = result.returnValue;
        				createPage(communityTotal, 2);
        			}
        			var communitys = result.returnObject;
                	var $communityTemplate = $("#communityTemplate");
                	$("#con_one_2 .list_main1 ul li:not(:first)").remove();
                	for(var i=0; i<communitys.length; i++) {
                		var $communityItem = $communityTemplate.clone().removeAttr("id").show();
                		$("#con_one_2 .list_main1 ul").append($communityItem);
                		$communityItem.find(".list_1 span").html(communitys[i].name);
                		$communityItem.find(".list_1 em").html("在线：" + communitys[i].userOnlineCount);
                		$communityItem.find(".list_2 span img").attr("src",  "http://" + communitys[i].channelIcon);
                		$communityItem.find(".list_2 em").html(communitys[i].shortDesc);
                		$communityItem.find(".list_3 span").html("创建者：" + communitys[i].nickName);
                		$communityItem.find(".list_3 em a").attr("communityId", communitys[i].id);
                	}
        		}
        	}
        }
	});
}

function getCategorys(type) {
	var categorys = [];

	ajaxGetSync({"type":type},function(data){
		categorys = data;
	});
	return categorys;
};

function channelCategory(){
	var categorys = getCategorys("UL013"); // Category/Category
	for(var i in categorys) {
		var $li = $('<li><a href="javascript:void(0);" categoryId="'+categorys[i].id+'"><ol>'+categorys[i].name+'</ol> <em>245.300</em></a></li>');
		$("#channelCategory").append($li);
	}
}

function communityCategory(){
	var categorys = getCategorys("UL023"); // Community/Category
	for(var i in categorys) {
		var $li = $('<li><a href="javascript:void(0);" categoryId="'+categorys[i].id+'"><ol>'+categorys[i].name+'</ol> <em>245.300</em></a></li>');
		$("#communityCategory").append($li);
	}
}
