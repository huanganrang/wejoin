<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>simplest_as3_rtmp_streamer</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<style type="text/css" media="screen">
		html, body { height:100%; background-color: #006600;}
		body { margin:0; padding:0; overflow:hidden; }
		#flashContent { width:100%; height:100%; }
		</style>
	</head>
	<body>
	<%
	String houseId = request.getParameter("houseId");
	String channelId = request.getParameter("channelId");
%>
		<div id="flashContent">
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="215" height="140" id="simplest_as3_rtmp_streamer" align="middle">
				<param name="movie" value="simplest_as3_rtmp_streamer.swf" />
				<param name="quality" value="high" />
				<param name="bgcolor" value="#006600" />
				<param name="play" value="true" />
				<param name="loop" value="true" />
				<param name="wmode" value="window" />
				<param name="scale" value="showall" />
				<param name="menu" value="true" />
				<param name="devicefont" value="false" />
				<param name="salign" value="" />
				<param name="allowScriptAccess" value="sameDomain" />
				<param name="flashVars" value="channel=<%=channelId %>&room=<%=houseId %>" />
				<!--[if !IE]>-->
				<object type="application/x-shockwave-flash" data="simplest_as3_rtmp_streamer.swf" width="215" height="140">
					<param name="movie" value="simplest_as3_rtmp_streamer.swf" />
					<param name="quality" value="high" />
					<param name="bgcolor" value="#006600" />
					<param name="play" value="true" />
					<param name="loop" value="true" />
					<param name="wmode" value="window" />
					<param name="scale" value="showall" />
					<param name="menu" value="true" />
					<param name="devicefont" value="false" />
					<param name="salign" value="" />
					<param name="allowScriptAccess" value="sameDomain" />
					<param name="flashVars" value="channel=<%=channelId %>&room=<%=houseId %>" />
				<!--<![endif]-->
					<a href="http://www.adobe.com/go/getflash">
						<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获得 Adobe Flash Player" />
					</a>
				<!--[if !IE]>-->
				</object>
				<!--<![endif]-->
			</object>
		</div>
	</body>
</html>