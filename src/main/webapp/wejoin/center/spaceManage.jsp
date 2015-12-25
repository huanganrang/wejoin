<%@ page import="jb.listener.Application" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String staticVersion = Application.version;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>频道列表</title>
<script type="text/javascript">
var base = '${pageContext.request.contextPath}/';
var namespace = "home";
</script>
<head>
<link href="${pageContext.request.contextPath}/wejoin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/login.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/wejoin/css/jquery.mCustomScrollbar.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/wejoin/js/tab.js" ></script>
<script src="${pageContext.request.contextPath}/wejoin/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/js.js"></script>
<script type="text/javascript">
function openShutManager(oSourceObj,oTargetObj,shutAble,oOpenTip,oShutTip){
var sourceObj = typeof oSourceObj == "string" ? document.getElementById(oSourceObj) : oSourceObj;
var targetObj = typeof oTargetObj == "string" ? document.getElementById(oTargetObj) : oTargetObj;
var openTip = oOpenTip || "";
var shutTip = oShutTip || "";
if(targetObj.style.display!="none"){
   if(shutAble) return;
   targetObj.style.display="none";
   if(openTip && shutTip){
    sourceObj.innerHTML = shutTip;
   }
} else {
   targetObj.style.display="block";
   if(openTip && shutTip){
    sourceObj.innerHTML = openTip;
   }
}
}
$(function(){
	changeHeightRight();
	//changeHeightLeft();
	$(".a_toggle").toggle(
	  function () {
		$('.img_x').attr('src','images/1.png');
		$('.main_right').hide();
		$(".main_center").css("width","100%");
	  },
	  function () {
		$('.img_x').attr('src','images/2.png');
		$('.main_right').show();
		$(".main_center").css("width","76%");
	  }
	);
})
$(function(){
    changeHeightRight();
	changeHeightLeft();
})
	$(window).resize(function() {
		changeHeightRight();
		changeHeightLeft();
	});
function changeHeightRight(){
	var head_h = $('.header').height();
	var ltian_menu_h = $('.ltian_menu').height();
	var ltian_form_h = $('.ltian_form').height();
	var itian_tb_h = $('.itian_tb').height();
	var b_h = $(window).height();
	var content_h = b_h - head_h - ltian_menu_h - ltian_form_h - itian_tb_h;
	$('.content_right').height(content_h)
}
function changeHeightLeft(){
	InitLeftVideo();
	var head_h = $('.header').height();
	var content_main_h = $('.content_main').height();
	var hy_title_h = $('.hy_title').height();
	var search_h = $('.search').height();
	var content_img_h = $('.content_img').height();
	var b_h = $(window).height();
	var content_h = b_h - head_h - content_main_h - hy_title_h - search_h - content_img_h ;
	console.log(content_h);
	
	if(content_h<=0){
		$('.content_main').height(195);
		content_h = b_h - head_h - content_main_h - hy_title_h - search_h - content_img_h ;
	}
	$('.content_buttom').height(content_h);
}
function InitLeftVideo(){
	var _l = $('#t_img .video').size();
	var obj_img = $('#t_img');
	if(_l==0){
		obj_img.height(0);
	}
	if(_l==1){
		obj_img.height(195);
	}
	if(_l>=2){
		obj_img.height(385);
	}
}
var bar=0;   
    var line="||";   
    var amount="";   
    document.getElementById("up").style.display="none";   
    function count(){   
    var f = document.getElementById("f");   
    var b = document.getElementById("b");   
    b.disabled  = true;   
    f.disabled  = true;   
    if(f.value==""){   
    b.disabled  = false;   
    f.disabled  = false;   
    alert("请添加上传文件");   
    return false;   
    }   
    document.getElementById("up").style.display="inline";   
    bar = bar+2;   
    amount = amount+line;   
    document.getElementById("chart").value=amount;   
    document.getElementById("percent").value=bar+"%";   
    if(bar<99){   
    setTimeout("count()",200);   
    }else{   
    b.disabled  = false;   
    f.disabled  = false;   
    alert("加载完毕！");   
    document.getElementById("up").style.display="none";   
    //  window.location="";   
    }   
    }   
function selectAllDels()
	{
		var allCheckBoxs = document.getElementsByName("preDelCheck");
		var desc = document.getElementById("allChecked");
		var selectOrUnselect=false;
		for(var i = 0; i < allCheckBoxs.length; i ++ )
		{
			if(allCheckBoxs[i].checked){
			selectOrUnselect=true;
			break;
		}
		}
			if (selectOrUnselect)
		{
			_allUnchecked(allCheckBoxs);
		}else
		{
			_allchecked(allCheckBoxs);
		}
		}
			function _allchecked(allCheckBoxs){
			for(var i = 0; i < allCheckBoxs.length; i ++ )
		{
			allCheckBoxs[i].checked = true;
		}
		}
			function _allUnchecked(allCheckBoxs){
			for(var i = 0; i < allCheckBoxs.length; i ++ )
		{
			allCheckBoxs[i].checked = false;
	}
}
</script>
</head>

<body class="ltbj">
<input type="hidden" id="userToken" value="${sessionScope.userToken.token}" />
<input type="hidden" id="userNickName" value="${sessionScope.userToken.nickName}" />
<div class="header" style="height:72px;">
	<div class="logo_list2">
		<c:choose>
			<c:when test="${!sessionScope.userToken.loginMark}">
				<div class="logo_dl">
		        	<a href="javascript:void(0);" onclick="showDjcgBox()">登录</a> 
		            <a href="javascript:void(0);" onclick="showSyldBox()">注册</a>
		        </div>
		        <c:if test="${sessionScope.userToken.token != null}">
		        	<div class="logo_name">${sessionScope.userToken.nickName} 您好！ </div>
		        	<a href="javascript:void(0)" onclick="goUserCenter()">个人中心</a>
					<a href="javascript:void(0)" onclick="logout()">退出</a>
				</c:if>
			</c:when>
			<c:otherwise>
				<div class="logo_name">会员：${sessionScope.userToken.nickName} 您好！ </div>
				<a href="javascript:void(0)" onclick="goUserCenter()">个人中心</a>
				<a href="javascript:void(0)" onclick="logout()">退出</a>
			</c:otherwise>
        </c:choose>
	</div>
    
    <div class="aa" style=" margin-top:13px;">
    <!--<span>游客：我是会飞的鱼</span>
    <ol><a href="#">注册</a>  |   <a href="#">登录</a>   </ol>-->
    <div class="hed_1"><a href="#">下载APP</a></div>
    <div class="hed_2"><a href="#">下载PC客户端</a></div>
    <div class="tel"></div>
    <div class="clear"></div>
    </div>
</div>

<div class="list_main">
	<div class="list_left">
    	<ul>
        	<div><span>我的收藏</span></div>
        	<li><a href="${pageContext.request.contextPath}/wejoin/center/spaceManage.jsp"><ol>收藏的频道</ol> <em>245.300</em></a></li>
            <li><a href="${pageContext.request.contextPath}/wejoin/center/association.jsp"><ol>收藏的社群</ol> <em>245.300</em></a></li>
        </ul>
        <div class="line"></div>
        <ul>
        	<div style="margin-top:10px;"><span>基本资料</span></div>
        	<li><a href="${pageContext.request.contextPath}/wejoin/center/reviseUserInfo.jsp"><ol>我的信息</ol> </a></li>
            <li><a href="${pageContext.request.contextPath}/wejoin/center/revisePassword.jsp"><ol>密码修改</ol></a></li>
        </ul>
        <div class="line"></div>
        <ul>
        	<div style="margin-top:10px;"><span>我的空间</span></div>
        	<li><a href="${pageContext.request.contextPath}/wejoin/center/spaceManage.jsp"><ol>空间管理</ol> </a></li>
        </ul>
        <div class="line"></div>
        <ul>
        	<div style="margin-top:10px;"><span>意见反馈</span></div>
        	<li><a href="${pageContext.request.contextPath}/wejoin/center/feedBack.jsp"><ol>意见反馈</ol> </a></li>
        </ul>
        <div class="line"></div>
        <ul>
        	<div style="margin-top:10px;"><span>系统消息</span></div>
        	<li><a href="#"><ol>系统消息</ol> </a></li>
        </ul>
        <div class="line"></div>
        <div class="lef_back"><a href="${pageContext.request.contextPath}/wejoin/home.jsp">返  回</a></div>
    </div>
  <div class="list_right">
    	<div class="search_title">
        	<ul>
            	<li class="hover"><a href="#">我的频道</a></li>
                <li><a href="#">我的社群</a></li>
            </ul>
            <div class="lise_se">
                <form action="" method="get">
               	  <input type="text" class="puta" onblur="if(this.value==''){this.value='请输入房间 / 室主号';this.style.color='#ccc'}" onfocus="if(this.value=='请输入房间 / 室主号'){this.value='';this.style.color='#333'}" value="请输入房间 / 室主号" id="textfield" name="telphone" style="color:#ccc;">
                    <input name="" type="submit" value="" class="putb"/>
                </form>
          </div>
        </div>
        
      <div class="list_txt">
      		<div class="space_manage">
            	<div class="progress_bar">
                	<ol>使用30%  &nbsp;&nbsp; 剩余4152MB</ol>
                    <span><strong style="width:30%;"></strong></span>
                </div>
                <div class="manage_list">
                	<ul>
                    	<li>
                        	<input name="preDelCheck" type="checkbox" value="sugar" class="lba"/>
                            <span><a href="#"><strong>(视频文件)</strong>雕刻机的飞的科教科发到空间付款副教科发到空间付款副科级教科发到空间付款副科级科级 </a></span>
                            <ol><div class="r_le">上传时间：2015/11/28  19:27</div>      <div class="r_rig">文件大小：21.6MB</div></ol>
                            <div class="manage_see">
                            	<a href="#">查看</a>
                                <a href="#">删除</a>
                            </div>
                        </li>
                        <li>
                        	<input name="preDelCheck" type="checkbox" value="sugar" class="lba"/>
                            <span><a href="#"><strong>(视频文件)</strong>雕刻机的飞的科教科发到空间付款副教科发到空间付款副科级教科发到空间付款副科级科级 </a></span>
                            <ol><div class="r_le">上传时间：2015/11/28  19:27</div>      <div class="r_rig">文件大小：21.6MB</div></ol>
                            <div class="manage_see">
                            	<a href="#">查看</a>
                                <a href="#">删除</a>
                            </div>
                        </li>
                        <li>
                        	<input name="preDelCheck" type="checkbox" value="sugar" class="lba"/>
                            <span><a href="#"><strong>(视频文件)</strong>雕刻机的飞的科教科发到空间付款副教科发到空间付款副科级教科发到空间付款副科级科级 </a></span>
                            <ol><div class="r_le">上传时间：2015/11/28  19:27</div>      <div class="r_rig">文件大小：21.6MB</div></ol>
                            <div class="manage_see">
                            	<a href="#">查看</a>
                                <a href="#">删除</a>
                            </div>
                        </li>
                        <li>
                        	<input name="preDelCheck" type="checkbox" value="sugar" class="lba"/>
                            <span><a href="#"><strong>(视频文件)</strong>雕刻机的飞的科教科发到空间付款副教科发到空间付款副科级教科发到空间付款副科级科级 </a></span>
                            <ol><div class="r_le">上传时间：2015/11/28  19:27</div>      <div class="r_rig">文件大小：21.6MB</div></ol>
                            <div class="manage_see">
                            	<a href="#">查看</a>
                                <a href="#">删除</a>
                            </div>
                        </li>
                        <li>
                        	<input name="preDelCheck" type="checkbox" value="sugar" class="lba"/>
                            <span><a href="#"><strong>(视频文件)</strong>雕刻机的飞的科教科发到空间付款副教科发到空间付款副科级教科发到空间付款副科级科级 </a></span>
                            <ol><div class="r_le">上传时间：2015/11/28  19:27</div>      <div class="r_rig">文件大小：21.6MB</div></ol>
                            <div class="manage_see">
                            	<a href="#">查看</a>
                                <a href="#">删除</a>
                            </div>
                        </li>
                        <li>
                        	<input name="preDelCheck" type="checkbox" value="sugar" class="lba"/>
                            <span><a href="#"><strong>(视频文件)</strong>雕刻机的飞的科教科发到空间付款副教科发到空间付款副科级教科发到空间付款副科级科级 </a></span>
                            <ol><div class="r_le">上传时间：2015/11/28  19:27</div>      <div class="r_rig">文件大小：21.6MB</div></ol>
                            <div class="manage_see">
                            	<a href="#">查看</a>
                                <a href="#">删除</a>
                            </div>
                        </li>
                        <li>
                        	<input name="preDelCheck" type="checkbox" value="sugar" class="lba"/>
                            <span><a href="#"><strong>(视频文件)</strong>雕刻机的飞的科教科发到空间付款副教科发到空间付款副科级教科发到空间付款副科级科级 </a></span>
                            <ol><div class="r_le">上传时间：2015/11/28  19:27</div>      <div class="r_rig">文件大小：21.6MB</div></ol>
                            <div class="manage_see">
                            	<a href="#">查看</a>
                                <a href="#">删除</a>
                            </div>
                        </li>
                        <li>
                        	<input name="preDelCheck" type="checkbox" value="sugar" class="lba"/>
                            <span><a href="#"><strong>(视频文件)</strong>雕刻机的飞的科教科发到空间付款副教科发到空间付款副科级教科发到空间付款副科级科级 </a></span>
                            <ol><div class="r_le">上传时间：2015/11/28  19:27</div>      <div class="r_rig">文件大小：21.6MB</div></ol>
                            <div class="manage_see">
                            	<a href="#">查看</a>
                                <a href="#">删除</a>
                            </div>
                        </li>
                        <li>
                        	<input name="preDelCheck" type="checkbox" value="sugar" class="lba"/>
                            <span><a href="#"><strong>(视频文件)</strong>雕刻机的飞的科教科发到空间付款副教科发到空间付款副科级教科发到空间付款副科级科级 </a></span>
                            <ol><div class="r_le">上传时间：2015/11/28  19:27</div>      <div class="r_rig">文件大小：21.6MB</div></ol>
                            <div class="manage_see">
                            	<a href="#">查看</a>
                                <a href="#">删除</a>
                            </div>
                        </li>
                        
                        <li>
                        	<input name="preDelCheck" type="checkbox" value="sugar" class="lba"/>
                            <span><a href="#"><strong>(视频文件)</strong>雕刻机的飞的科教科发到空间付款副教科发到空间付款副科级教科发到空间付款副科级科级 </a></span>
                            <ol><div class="r_le">上传时间：2015/11/28  19:27</div>      <div class="r_rig">文件大小：21.6MB</div></ol>
                            <div class="manage_see">
                            	<a href="#">查看</a>
                                <a href="#">删除</a>
                            </div>
                        </li>
                        
                        <div class="choice">
                        	<div>
                            <input name="" type="checkbox" value="sugar" class="lba_n" id="allChecked" onClick="selectAllDels()"/>
                            <label for="allChecked">全选</label>
                            </div>
                            <a href="#">批量删除</a>
                        </div>

                        
                        <div class="fax" style="right:170px; bottom:-48px; ">
                      <a href="#">上一页</a>
                          <div class="fax_list">
                              <span>1</span>
                              <div class="span_list">
                                  <div class="content mCustomScrollbar" style="height:95px;">
                                    <a href="#">1</a>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#">4</a>
                                    <a href="#">5</a>
                                    <a href="#">6</a>
                                    <a href="#">7</a>
                                    <a href="#">8</a>
                                  	<a href="#">9</a>                                </div>
                              </div>
                      </div>
                  	<a href="#">下一页</a>                
                    </div>
                  
                    </ul>
                </div>
            </div>
      </div>
  </div>
    
    <div class="hot_list">
    	<div><span>房间人气排行榜</span></div>
        <ul>
        	<li><a href="#"><span>1</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>2</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>3</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>4</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>5</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>6</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>7</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>8</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>9</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>10</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>11</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>12</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>13</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>14</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>15</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>16</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>17</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
        </ul>
    </div>
    <div class="clear"></div>
</div>
<div class="bj230"></div>


</body>
</html>
