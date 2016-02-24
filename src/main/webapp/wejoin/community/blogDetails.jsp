<%@ page import="jb.listener.Application" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String staticVersion = Application.version;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>I吧帖子</title>
<link href="${pageContext.request.contextPath}/wejoin/css/style.css?v=<%=staticVersion%>" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/login.css?v=<%=staticVersion%>" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.style.css?v=<%=staticVersion%>" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.mCustomScrollbar.css?v=<%=staticVersion%>" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.3/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/My97DatePicker/WdatePicker.js"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/tab.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/jquery.mCustomScrollbar.concat.min.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/jquery.cookie.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/community/blogDetails.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
//=点击展开关闭效果=
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
</script>
<style>
body{ height:100%;}
html{ height:100%;}
</style>
</head>

<body>
<div class="top_100">
	<div class="top_center">尊敬的游客您好，请 <a href="#">登录</a> 或 <a href="#">注册</a> 微区</div>
</div>

<div class="hd_100">
	<div class="hd_center">
    	<div class="hd_logo"><a href="#"><img src="${pageContext.request.contextPath}/wejoin/images/pnglogo3.png" /></a></div>
        <div class="lb_menu">
            <a href="#" class="pd_1" onclick="showchaBox()">免费创建频道</a>
            <a href="#" class="pd_2">免费创建社群</a>
            <a href="#" class="pd_3">微币充值</a>
            <a href="#" class="pd_4">使用帮助</a>
    	</div>
        <div class="aa">
        <div class="hed_1"><a href="#">下载APP</a></div>
        <div class="hed_2"><a href="#">下载PC客户端</a></div>
        <div class="tel"></div>
        <div class="clear"></div>
        </div>
    </div>
</div>
<div class="ib_wz"><span>您好,您现在所在的位置：首页-电商发展之路-<a href="#">课程列表</a></span></div>


<div class="ib_center">
	<div class="ib_menu">
    	<ul>
        	<strong>频道分类</strong>
        	<li><a href="#"><ol>视频教育</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>语言培训</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>个人专区</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>艺术文体</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>娱乐模块</ol> <em>245.300</em></a></li>
            <li><a href="#"><ol>行业培训</ol> <em>245.300</em></a></li>
        </ul>
        
        <ul>
        	<strong>频道分类</strong>
        	<li><a href="#"><ol>基础社群</ol> <em>245.300</em></a></li>
        </ul>
    </div>
    
	
    <div class="ib_right">
    	<div class="ib_gao"></div>
        <div class="ib_rtitle">
        	<em>电商运营之路I吧</em>
            <b><a href="#">回复</a></b>  
        </div>
        <div class="ib_tzlist">
        	<dl>
            	<dt>
                	<a href="#">
                    	<img src="images/img.gif" />
                        <span>我是会飞的鱼</span>
                        <em></em>                    
                    </a>                    
                </dt>
               <dd>
               		<div class="dd_center">
                    要求：寒假期间能够有充足的时间处理贴吧事务。<br />
                    没有充足时间，不愿花费精力，三分钟热度总是半途而废的，请勿申请，以免浪费你我的时间。<br />
                    实习期4周，每周删贴量最后一名淘汰。<br />
                    9级以上可申请。<br />
                    <br />
                    <br />
                    申请格式：<br />
                    ID：<br />
                    级别：<br />
                    日均在线时长：<br /><br />
                    <img src="images/dimg.gif" />
                    </div>
                    <em>1楼 &nbsp;&nbsp;   2015-12-29 15:30 &nbsp;&nbsp;  <a onclick="openShutManager(this,'box1',false,'收起回复','回复')">回复</a></em>
                    <div class="d_colk" id="box1" style="display:none;">
                    	<span>我也说一句</span>
                        <form action="" method="get">
                        	<textarea name="" cols="" rows="" class="i_p1"></textarea>
                            <input name="" type="submit" value="发表" class="tzam"/>
                            <div class="clear"></div>
                        </form>
                        <ol></ol>
                    </div>
               </dd>
               <div class="clear"></div>
            </dl>
            
            <dl>
            	<dt>
                	<a href="#">
                    	<img src="images/img.gif" />
                        <span>我是会飞的鱼</span>                 
                    </a>                    
                </dt>
               <dd>
               		<div class="dd_center">
                    要求：寒假期间能够有充足的时间处理贴吧事务。<br />
                    没有充足时间，不愿花费精力，三分钟热度总是半途而废的，请勿申请，以免浪费你我的时间。<br />
                    实习期4周，每周删贴量最后一名淘汰。<br />
                    9级以上可申请。<br />
                    <br />
                    <br />
                    申请格式：<br />
                    ID：<br />
                    级别：<br />
                    日均在线时长：<br /><br />
                    </div>
                    <em>1楼 &nbsp;&nbsp;   2015-12-29 15:30 &nbsp;&nbsp;  <a onclick="openShutManager(this,'box2',false,'收起回复','回复')">回复</a></em>
                    <div class="d_colk" id="box2" style="display:none;">
                    	<span>我也说一句</span>
                        <form action="" method="get">
                        	<textarea name="" cols="" rows="" class="i_p1"></textarea>
                            <input name="" type="submit" value="发表" class="tzam"/>
                            <div class="clear"></div>
                        </form>
                        <ol></ol>
                    </div>
               </dd>
               <div class="clear"></div>
            </dl>
            
            <dl>
            	<dt>
                	<a href="#">
                    	<img src="images/img.gif" />
                        <span>我是会飞的鱼</span>                 
                    </a>                    
                </dt>
               <dd>
               		<div class="dd_center">
                    要求：寒假期间能够有充足的时间处理贴吧事务。<br />
                    没有充足时间，不愿花费精力，三分钟热度总是半途而废的，请勿申请，以免浪费你我的时间。<br />
                    实习期4周，每周删贴量最后一名淘汰。<br />
                    9级以上可申请。<br />
                    <br />
                    <br />
                    申请格式：<br />
                    ID：<br />
                    级别：<br />
                    日均在线时长：<br /><br />
                    </div>
                    <em>1楼 &nbsp;&nbsp;   2015-12-29 15:30 &nbsp;&nbsp;  <a onclick="openShutManager(this,'box3',false,'收起回复','回复')">回复</a></em>
                    <div class="d_colk" id="box3" style="display:none;">
                    	<span>我也说一句</span>
                        <form action="" method="get">
                        	<textarea name="" cols="" rows="" class="i_p1"></textarea>
                            <input name="" type="submit" value="发表" class="tzam"/>
                            <div class="clear"></div>
                        </form>
                        <ol></ol>
                    </div>
               </dd>
               <div class="clear"></div>
            </dl>
        </div>
        
        <div class="fre_list" style="text-align:left;">
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#" class="on">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#" class="ona">上一页</a>
            <a href="#" class="onb">下一页</a>
        </div>
        
        <div class="ib_pl">
        	<span>我要回复</span>
            <div class="ib_plk">
            	<div class="ib_pltitle">
                	<div class="b_pro">
                    	<ol>图片</ol>
                    	<input type="file" class="up_n" name="_f">
                    </div>
                    <div class="ib_bc">
                    	<ol>表情</ol>
                        <div class="v_bc">
                            <a href="#">表情图片aaa</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <a href="#">表情图片</a>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                
                <form action="" method="get">
                	<textarea name="" cols="" rows="" class="ib_p2"></textarea>
                    <input name="" type="submit" value="发 表" class="ib_an"/>
                </form>
            </div>
        </div>
        
    </div>
    <div class="clear"></div>
</div>
</body>
</html>
