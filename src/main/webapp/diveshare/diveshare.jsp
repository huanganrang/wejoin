<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${title}</title>
<style type="text/css">
body {font-family:"微软雅黑";font-size:12px; background-color:#f8f7f5;}
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,blockquote,p{padding:0; margin:0;}
table,td,tr,th{font-size:12px;}
li{list-style-type:none; margin:0; padding:0;}
table{ margin:0 auto;}
img{border:0; line-height:0;}
ol,ul {list-style:none;}   
h1,h2,h3,h4,h5,h6 {font-size:12px; font-weight:normal;}   
a { color: #000; text-decoration: none; outline: none;}
a:visited {text-decoration:none;}
a:hover {text-decoration:none;}
a:active { }
a img { border: none; }
dd,dl,dt{ margin:0 ; padding:0;}

.content{ padding:5px 15px; margin:0 auto;}
.content h1{ display:block; line-height:1.8em; font-size:20px; color:#4c4c4c; font-weight:bold; text-align:left;}
.content h2{ display:block; font-size:12px; color:#999999; text-align:left;}
.content h2 span{ margin-right:4%;}
.content h2 a{ color:#1354b5;}
.content .cont_ft{ overflow:hidden; border-top:2px dashed #ccc; margin-top:15px; padding-top:20px; font-size:26px; color:#4c4c4c; text-align:center; padding-bottom:2em;}
.content .cont_ft h3{ display:block; font-size:14px; line-height:2em;}
.content .cont_ft h3 span{}
.content .cont_ft .gw{ width:61%; overflow:hidden; margin:0 auto;}
.content .cont_ft .gw img{ width:100%;}
.content .cont_ft .ft_ew{ overflow:hidden; margin-top:1.5em;}
.content .cont_ft .ft_ew .ew{ float:left; width:49.5%; text-align:center;}
.content .cont_ft .ft_ew .ew dt{ margin:0 auto; width:70%; overflow:hidden; text-align:center; position:relative;}
.content .cont_ft .ft_ew .ew dt i{ display:block; position:absolute; width:97%; overflow:hidden; top:1px; left:1.5%; font-style:normal;}
.content .cont_ft .ft_ew .ew p{ font-size:14px; line-height:1.5em;}
.content .nr{ margin-top:15px; overflow:hidden;}
.content .nr p{ text-indent:2em; font-size:14px; color:#666; line-height:1.8em; margin:.8em 0;}
.content .nr img{ width:100%;}

.wm { min-width:480px; max-width:740px; overflow:hidden; margin:0 auto; margin-top:30px;}
.wm .top{padding-left:35px;padding-right:35px; padding-bottom:35px; text-align:center; margin-top:6%;}
.wm .down_wm{ overflow:hidden; text-align:center; width:40%; margin:0 auto;}
.wm .down_wm img{ width:100%; margin-bottom:9%;}
.wm .down_wen{ font-size:20px; color:#999; text-align:center; overflow:hidden;}
.wm .bottom{ background-image:url(${pageContext.request.contextPath}/diveshare/bottom.png); height:100px; margin-top:1%;}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>
<body>
	<div class="content">
		 <h1>${title}</h1>
		 <div class="nr">
		 	${content }
		 </div>
		 
		 <div class="cont_ft">
    		<h3>潜伴，全球潜水爱好者集中营 </h3>
        	<div class="gw"><a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/diveshare/xz.png" alt=""></a></div>
        	<h3 style="line-height:1em;">扫码下载</h3>
        	<div class="wm">
        		<div class="down_wm"><a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/diveshare/20150724_down_wm.png"></a></div>
		    	<div class="down_wen">点击或长按二维码下载</div>
		    	<div class="top"><a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/diveshare/logo2.png" width="395" height="72"></a></div>
		    	<div class="bottom"></div>
        	</div>
    	</div>
	</div>
</body>
</html>