<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%
		String houseId = request.getParameter("houseId");
		String channelId = request.getParameter("channelId");
	%>
<title>simplest_as3_rtmp_streamer</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css" media="screen">
		html, body  { height:100%; }
		body { margin:0; padding:0; overflow:auto; text-align:center;
			background-color: #ffffff; }
		object:focus { outline:none; }
		#flashContent { display:none; }
	</style>

	<!-- Enable Browser History by replacing useBrowserHistory tokens with two hyphens -->
	<!-- BEGIN Browser History required section -->
	<link rel="stylesheet" type="text/css" href="history/history.css" />
	<script type="text/javascript" src="history/history.js"></script>
	<!-- END Browser History required section -->

	<script type="text/javascript" src="swfobject.js"></script>
	<script type="text/javascript">
		// For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection.
		var swfVersionStr = "11.0.0";
		// To use express install, set to playerProductInstall.swf, otherwise the empty string.
		var xiSwfUrlStr = "playerProductInstall.swf";
		var flashvars = {channel:<%=channelId%>,room:<%=houseId%>};
		var params = {};
		params.quality = "high";
		params.bgcolor = "#ffffff";
		params.allowscriptaccess = "sameDomain";
		params.allowfullscreen = "true";
		var attributes = {};
		attributes.id = "simplest_as3_rtmp_player";
		attributes.name = "simplest_as3_rtmp_player";
		attributes.align = "middle";
		swfobject.embedSWF(
				"simplest_as3_rtmp_player.swf", "flashContent",
				"400", "300",
				swfVersionStr, xiSwfUrlStr,
				flashvars, params, attributes);
		// JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
		swfobject.createCSS("#flashContent", "display:block;text-align:left;");
	</script>
</head>
<body>

	<script type="text/javascript">
		document.ondblclick= function(){
			//openDialog();
		};
		function openDialog(num){
			parent.changeCamaraLocation("cameraPull");
		}
		function setVoiceNumber(voice){
			if(parent){
				parent.setVoiceNumber(voice);
			}
		}

		function setObjectSize(width,height){
			var object = document.getElementsByTagName("object")[0];
			object.width = width;
			object.height = height;
		}
		window.changeVoiceNumber = function(voice){
			document.getElementById("simplest_as3_rtmp_player").jsCallback(voice);
		}
	</script>

	<!-- SWFObject's dynamic embed method replaces this alternative HTML content with Flash content when enough
                 JavaScript and Flash plug-in support is available. The div is initially hidden so that it doesn't show
                 when JavaScript is disabled.
            -->
	<div id="flashContent">
		<p>
			To view this page ensure that Adobe Flash Player version
			19.0.0 or greater is installed.
		</p>
		<script type="text/javascript">
			var pageHost = ((document.location.protocol == "https:") ? "https://" : "http://");
			document.write("<a href='http://www.adobe.com/go/getflashplayer'><img src='"
					+ pageHost + "www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a>" );
		</script>
	</div>

	<noscript>
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%" id="simplest_as3_rtmp_player">
			<param name="movie" value="simplest_as3_rtmp_player.swf" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#ffffff" />
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="allowFullScreen" value="true" />
			<param name="flashVars"
				   value="channel=<%=channelId%>&room=<%=houseId%>" />
			<!--[if !IE]>-->
			<object type="application/x-shockwave-flash" data="simplest_as3_rtmp_player.swf" width="100%" height="100%">
				<param name="quality" value="high" />
				<param name="bgcolor" value="#ffffff" />
				<param name="allowScriptAccess" value="sameDomain" />
				<param name="allowFullScreen" value="true" />
				<param name="flashVars"
					   value="channel=<%=channelId%>&room=<%=houseId%>" />
				<!--<![endif]-->
				<!--[if gte IE 6]>-->
				<p>
					Either scripts and active content are not permitted to run or Adobe Flash Player version
					19.0.0 or greater is not installed.
				</p>
				<!--<![endif]-->
				<a href="http://www.adobe.com/go/getflashplayer">
					<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash Player" />
				</a>
				<!--[if !IE]>-->
			</object>
			<!--<![endif]-->
		</object>
	</noscript>
</body>
</html>