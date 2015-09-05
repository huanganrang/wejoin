﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
.content .nr{ margin-top:15px; overflow:hidden;}
.content .nr p{ font-size:14px; color:#666; line-height:1.8em; margin:.8em 0;}
.content .nr img{ width:100%;}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script type="text/javascript">
	function download() {
		if(isWeiXin()) {   
// 	        alert('微信扫描无法下载，请点击右上角切换其他浏览器打开.') 
			 window.location.href="http://www.goodiver.com/Download/download"; 
	    } else {  
	        switch(getDevice()) {  
	            case 'Android':  
	                window.location.href="http://www.goodiver.com/Download/download";  
	                break;  
	            case 'iOS':  
	                window.location.href="http://www.goodiver.com/Download/download";  
	                break;  
	            default:  
	                break;  
	        }  
	    }  
	}
	
	function isWeiXin() {   
	    var ua = window.navigator.userAgent.toLowerCase();  
	    if(ua.match(/MicroMessenger/i) == 'micromessenger') {   
	        return true;  
	    } else {   
	        return false;  
	    }   
	}  
	  
	function getDevice() {  
	    var u = navigator.userAgent;  
	    if (u.indexOf('Android') > -1 || u.indexOf('Linux') > -1) {  
	        return 'Android';  
	    } else if (u.indexOf('iPhone') > -1) {  
	        return 'iOS';  
	    } else {  
	        return 'none';  
	    }  
	}  
</script>
</head>
<body>
	<div class="content">
		 <h1>${title}</h1>
		 <div class="nr">
		 	${content }
		 </div>
		 
		 <jsp:include page="bottom.jsp"></jsp:include>
	</div>
</body>
</html>