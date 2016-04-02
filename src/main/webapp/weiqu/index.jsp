<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 16/4/1
  Time: 下午8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="inc.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="css/slide.css"/>
  <script type="text/javascript" src="js/slide.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $(".slideInner").slide({
        slideContainer: $('.slideInner a'),
        effect: 'easeOutCirc',
        autoRunTime: 5000,
        slideSpeed: 1000,
        nav: true,
        autoRun: true,
        prevBtn: $('a.prev'),
        nextBtn: $('a.next')
      });
      //立即进入按钮
      $(".moveElem ol").click(function(){
        window.location.href="/weiqu/channel.jsp";
      });
    });
  </script>
</head>
<body>
  <div class="slides">
    <div class="slideInner">
      <a href="#" style="background: url(images/in_bj3.jpg) no-repeat; background-size:cover;">
        <div class="moveElem img1" rel="150,easeInOutExpo"> <img src="images/web.png" /> </div>
        <div class="moveElem img2" rel="300,easeInOutExpo">
          <span>结识更多朋友</span>
          <em>微区有很多的专业人士、外国友人，在这里，您可以发现更多您感兴趣的人，他们也许会是您的老师或朋友。</em>
          <ol>立即进入</ol>
        </div>
      </a>
      <a href="#" style="background: url(images/in_bj2.jpg) no-repeat; background-size:cover;">
        <div class="moveElem img3" rel="150,easeInOutExpo"> <img src="images/iphone.png" /> </div>
        <div class="moveElem img4" rel="300,easeInOutExpo">
          <span>发现更多知识</span>
          <em>微区的频道、点播和社区都来自于公众的创建，汇集各行各业，在这也许您会发现您一直想要的资源。</em>
          <ol>立即进入</ol>
        </div>
      </a>
      <a href="#" style="background: url(images/in_bj1.jpg) no-repeat; background-size:cover;">
        <div class="moveElem img5" rel="150,easeInOutExpo"> <img src="images/mac.png" /> </div>
        <div class="moveElem img6" rel="300,easeInOutExpo">
          <span>免费创建专属频道</span>
          <em>我们致力于开发最好的音视频沟通学习平台，使其操作简单便捷，让学习变的有趣，让会议变的轻松。</em>
          <ol>立即进入</ol>
        </div>
      </a>
    </div>
    <div class="nav">
      <a class="prev" href="javascript:;"></a>
      <a class="next" href="javascript:;"></a>
    </div>
  </div>

  <div class="in_bottom100">
    <div class="in_bottom">
      <div class="bot_left">
        <span><img src="images/bt_logo.png" /></span>
        <a href="#">沪ICP备13036802号</a>
        <a href="#">关于我们</a>
      </div>
      <div class="bot_right">
        <a href="login.jsp" class="a1">登录</a>
        <a href="register.jsp" class="a2">注册</a>
        <a href="#" class="a3">APP下载</a>
        <a href="#" class="a4">PC客户端</a>
      </div>
    </div>
  </div>
</body>
</html>
