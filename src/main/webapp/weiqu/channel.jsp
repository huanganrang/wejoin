<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 16/4/1
  Time: 下午11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <jsp:include page="channel_inc.jsp"></jsp:include>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.3/jquery.easyui.min.js" charset="utf-8"></script>
  <script src="js/channel.js?v=${staticVersion}"></script>
  <script type="text/javascript">
    $(document).ready(function()
    {
      $("#secondpane p.menu_head").click(function()
      {
        $(this).css({backgroundImage:"url(images/hov.gif)" , color:"#70b615"}).next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
        $(this).siblings().css({backgroundImage:"" , color:"#666666"});
      });
    });
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
</head>
<body>
<div class="header_left">
  <jsp:include page="head_left_inc.jsp"></jsp:include>

  <div class="left_tt">频道分类</div>
  <div>

    <div class="menu_list" id="secondpane">

    </div>


    <c:choose>
      <c:when test="${userToken.loginMark}">
        <div class="left_an">
          <a href="#">+ 创 建</a>
        </div>
      </c:when>
    </c:choose>

    <div class="hd_bottom"><span></span></div>
  </div>


</div>

<div class="header_center">

  <jsp:include page="head_center_inc.jsp"></jsp:include>
  <div class="center_list">
    <ul>

      <div class="clear"></div>
    </ul>
  </div>

  <div style="height:60px;"></div>
  <div class="center_firex">
		<span>
			<a href="#"> < </a>
			<a href="#"> <strong>8</strong> </a>
			<a href="#"> > </a>
		</span>
  </div>
</div>



<div class="header_right">
  <jsp:include page="head_right_inc.jsp"></jsp:include>
</div>
<jsp:include page="channel_template.jsp"></jsp:include>


<jsp:include page="windows_inc.jsp"></jsp:include>

</body>
</html>
