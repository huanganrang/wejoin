<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 15/12/6
  Time: 下午2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String videoUrl = request.getParameter("videoUrl");
%>
<html>
<head>
  <title>Video.js | HTML5 Video Player</title>

  <!-- Chang URLs to wherever Video.js files will be hosted -->
  <link href="video-js.css" rel="stylesheet" type="text/css">
  <!-- video.js must be in the <head> for older IEs to work. -->
  <script src="video.js"></script>

  <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
  <script>
    videojs.options.flash.swf = "video-js.swf";
  </script>


</head>
<body>

<%--<video id="example_video_1" class="video-js vjs-default-skin" class="video-js vjs-default-skin" controls preload="auto" width="640" height="268"
       poster="http://video-js.zencoder.com/oceans-clip.png"
       data-setup="{}">
  <source src="<%=videoUrl%>" type="rtmp/mp4"/>
  <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
</video>--%>
<video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="100%" height="100%"
       poster="http://video-js.zencoder.com/oceans-clip.png"
       data-setup="{}">
  <source src="<%=videoUrl%>" type="video/mp4"/>
  <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
  <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
  <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
</video>
</body>
</html>
