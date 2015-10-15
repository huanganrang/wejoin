var windowHeight=$(window).height();
 
$(function(){
	$(".close_btn").click(function(){
		$(this).parent().parent().hide();			  
	});
	
	$("#createChannelBtn").bind('click', createChannel);
	
	channelPage(1); // 频道列表
	communityPage(1); // 社区列表
	channelCategory(); // 频道分类
	communityCategory(); // 社区分类
	channel_roomPage(); // 频道房间列表
	
	function ProcessFile() {
		var file = document.getElementById('channelIcon').files[0];
		if (file) {
			var reader = new FileReader();
			reader.onload = function ( event ) {
				var txt = event.target.result;
				$('.img-preview').attr('src',txt);
			};
		}
	    reader.readAsDataURL(file);
	}
	$(document).delegate('#channelIcon','change',function () {
		ProcessFile();
	});
});


function showDjcgBox(){
	$(".windows").hide();
	$("#djcgBox").show();
	var top=(windowHeight-473)/2;
	$("#djcgBox .windows_box").css("top",top);
}

function showChannelAddBox(){
	$(".windows").hide();
	$("#syldBox").show();
	var top=(windowHeight-parseInt($("#syldBox .windows_box").height()))/2;
	$("#syldBox .windows_box").css("top",top);	
	
	$("#categoryId").empty();
	var categorys = getCategorys("UL013");
	for(var i in categorys) {
		var $option = $('<option value="'+categorys[i].id+'">'+categorys[i].name+'</option>');
		$("#categoryId").append($option);
	}
}

function createChannel() {
	var shortDesc = $("#shortDesc").val();
	if(shortDesc == '') {
		$("#shortDesc").focus();
		return;
	}
    var name = $("#channelName").val();
    if(name == '') {
		$("#channelName").focus();
		return;
	}
    var categoryId = $("#categoryId").val();
    if(categoryId == '') {
		alert("请选择频道类别");
		return;
	}
    var channelIcon = $("#channelIcon").val();
    if(channelIcon == '') {
		alert("请选择频道封面照");
		return;
	}
	$.ajax({
        type: "POST",
        url: base+"api/apiCommon/doPost", // Channel/Channel
        data: {"type":"UL011", "param":JSON.stringify({"shortDesc":shortDesc,"name":name,"categoryId":categoryId,"channelIcon":channelIcon})},
        dataType:"json",
        success:function (data) {
        	if(data.obj){
        		var result = $.parseJSON(data.obj);
	        	if(result.serverStatus == 0) {
	        		var channel = result.returnObject;
	        		var $channelTemplate = $("#channelTemplate");	
	        		var $channelItem = $channelTemplate.clone().removeAttr("id").show();
            		$("#con_one_1 .list_main1 ul").prepend($channelItem);
            		$("#con_one_1 .list_main1 ul li:last").remove();
            		$channelItem.find(".list_1 span").html(channel.name);
            		$channelItem.find(".list_1 em").html("在线：" + channel.id); //TODO 在线数量不明
            		$channelItem.find(".list_2 span img").attr("src", channel.url + "/" + channel.channelIcon);
            		$channelItem.find(".list_2 em").html(channel.shortDesc); 
            		var username = channel.token.length > 10 ? channel.token.substring(0,10) + "..." : channel.token;
            		$channelItem.find(".list_3 span").html("创建者：" + username); //TODO 创建者不明
            		$channelItem.find(".list_3 em a").attr("channelId", channel.id).bind("click", showDjcgBox); 
            		
            		$(".windows").hide();
	        	} else {
	        		// 创建失败
	        		alert(result.returnMessage);
	        	}
        	}
        }
    });
}

function channelPage(pageNo){
	$.ajax({
        type: "POST",
        url: base+"api/apiCommon/doGet", // Channel/Page
        data:{"pageSize":16,"pageNo":pageNo,"type":"UL010"},
        dataType:"json",
        success:function (data) {
        	if(data.obj){
        		var result = $.parseJSON(data.obj);
        		if(result.serverStatus == 0) {
        			var channels = result.returnObject;
                	var $channelTemplate = $("#channelTemplate");
                	for(var i=0; i<channels.length; i++) {
                		var $channelItem = $channelTemplate.clone().removeAttr("id").show();
                		$("#con_one_1 .list_main1 ul").append($channelItem);
                		$channelItem.find(".list_1 span").html(channels[i].name);
                		$channelItem.find(".list_1 em").html("在线：" + channels[i].id); //TODO 在线数量不明
                		$channelItem.find(".list_2 span img").attr("src", channels[i].url + "/" + channels[i].channelIcon);
                		$channelItem.find(".list_2 em").html(channels[i].shortDesc); 
                		var username = channels[i].token.length > 10 ? channels[i].token.substring(0,10) + "..." : channels[i].token;
                		$channelItem.find(".list_3 span").html("创建者：" + username); //TODO 创建者不明
                		$channelItem.find(".list_3 em a").attr("channelId", channels[i].id).bind("click", showDjcgBox); 
                	}
        		}
        	}		            	
        }
	});
}

function channel_roomPage(){
	$.ajax({
        type: "POST",
        url: base+"api/apiCommon/doGet", // 
        data:{"pageSize":6,"pageNo":1,"type":"UL012"},
        dataType:"json",
        success:function (data) {
        	if(data.obj){
        		var result = $.parseJSON(data.obj);
        		if(result.serverStatus == 0) {
        			var rooms = result.returnObject;
                	var $roomTemplate = $("#channel_roomTemplate");
                	for(var i=0; i<rooms.length; i++) {
                		var $roomItem = $roomTemplate.clone().removeAttr("id").show();
                		$(".fz_xt ul").append($roomItem);
                		$roomItem.find(".list_1 span").html(rooms[i].name);
                		$roomItem.find(".list_1 em").html("在线：" + rooms[i].id); //TODO 在线数量不明
                		$roomItem.find(".list_2 span img").attr("src", rooms[i].url + "/" + rooms[i].channelIcon);
                		$roomItem.find(".list_2 em").html(rooms[i].shortDesc); 
                		$roomItem.find(".list_3 span:eq(0)").html("房号：" + rooms[i].id); //TODO 房号不明
                		$roomItem.find(".list_3 span:eq(1)").html("房主：会飞的鱼"); //TODO 房主不明
                		$roomItem.find(".list_3 em a").attr("roomId", rooms[i].id).bind("click", function(){
                			window.location.href = 'room.jsp';
                		}); 
                	}
        		}
        	}		            	
        }
	});
}

function communityPage(pageNo){
	$.ajax({
        type: "POST",
        url: base+"api/apiCommon/doGet", // 
        data:{"pageSize":16,"pageNo":pageNo,"type":"UL020"}, 
        dataType:"json",
        success:function (data) {
        	if(data.obj){
        		var result = $.parseJSON(data.obj);
        		if(result.serverStatus == 0) {
        			var communitys = result.returnObject;
                	var $communityTemplate = $("#communityTemplate");
                	for(var i=0; i<communitys.length; i++) {
                		var $communityItem = $communityTemplate.clone().removeAttr("id").show();
                		$("#con_one_2 .list_main1 ul").append($communityItem);
                		$communityItem.find(".list_1 span").html(communitys[i].name);
                		$communityItem.find(".list_1 em").html("在线：" + communitys[i].id); //TODO 在线数量不明
                		$communityItem.find(".list_2 span img").attr("src", communitys[i].url + "/" + communitys[i].channelIcon);
                		$communityItem.find(".list_2 em").html(communitys[i].shortDesc); 
                		var username = communitys[i].token.length > 10 ? communitys[i].token.substring(0,10) + "..." : communitys[i].token;
                		$communityItem.find(".list_3 span").html("创建者：" + username); //TODO 创建者不明
                		$communityItem.find(".list_3 em a").attr("communityId", communitys[i].id); 
                	}
        		}
        	}		            	
        }
	});
}

function getCategorys(type) {
	var categorys = [];
	$.ajax({
        type: "POST",
        url: base+"api/apiCommon/doGet", // Category/Category
        data:{"type":type},
        dataType:"json",
        async: false,
        success:function (data) {
        	if(data.obj){
        		var result = $.parseJSON(data.obj);
        		if(result.serverStatus == 0) {
        			categorys = result.returnObject;
        		}
        	}		            	
    	}
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
