/**
 * @author 邵智民
 * @file lesson.js
 * @Description 课程相关接口实现
 */
var windowHeight=$(window).height();
var pageNo = 1;
var pageSize = 4;

$(function(){
	//获取课程列表,目前没有全部社区的接口，无法直接从社区进入课程，采用指定 社区Token：de31c5e3-cc31-4a32-8d3a-408bbf14ed55
	getLessonByCommunity("de31c5e3-cc31-4a32-8d3a-408bbf14ed55",pageNo,pageSize);
	
});



/*
 * 获取课程(某个社区下的所有课程)
 */
function getLessonByCommunity(communityToken,pageNo,pageSize){
	$.ajax({
		type: "get",
        url: base+"api/apiCommon/doGet",
        data:{"communityToken":communityToken,"pageNo":pageNo,"pageSize":pageSize,"type":"UL044"},
        dataType:"json",
        success:function(data){
        	if(data.obj){
        		console.log("获取获取社区课程,"+communityToken+":"+ data.obj);
        		var result = $.parseJSON(data.obj);
        		if(result.serverStatus == 0) {
        			var lessons = result.returnObject;
        			
        		}
        	}
        }
	});
}

//初始化课程列表
function initCourseList(data){
	$.each(data,function(i,menu){
		var menu_li = getMenu(menu);
		$("#menu").append(menu_li);
	});
}

/*
 * 遍历课程结果集,创建course_list
 */
function createCourseList(){
	
}