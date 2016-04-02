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
      <p class="menu_head">视频教育 <em>245.300</em></p>
      <div class="menu_body">
        <a href="#"><span>英语</span>  <ol>45.300</ol></a>
        <a href="#"><span>法语</span>  <ol>5.300</ol></a>
        <a href="#"><span>德语</span>  <ol>45.300</ol></a>
      </div>
      <p class="menu_head">语言培训 <em>245.300</em></p>
      <div class="menu_body">
        <a href="#"><span>英语</span>  <ol>45.300</ol></a>
        <a href="#"><span>法语</span>  <ol>5.300</ol></a>
        <a href="#"><span>德语</span>  <ol>45.300</ol></a>
      </div>
      <p class="menu_head">个人专区 <em>245.300</em></p>
      <div class="menu_body">
        <a href="#"><span>英语</span>  <ol>45.300</ol></a>
        <a href="#"><span>法语</span>  <ol>5.300</ol></a>
        <a href="#"><span>德语</span>  <ol>45.300</ol></a>
      </div>
      <p class="menu_head">视频教育 <em>245.300</em></p>
      <div class="menu_body">
        <a href="#"><span>英语</span>  <ol>45.300</ol></a>
        <a href="#"><span>法语</span>  <ol>5.300</ol></a>
        <a href="#"><span>德语</span>  <ol>45.300</ol></a>
      </div>
      <p class="menu_head">语言培训 <em>245.300</em></p>
      <div class="menu_body">
        <a href="#"><span>英语</span>  <ol>45.300</ol></a>
        <a href="#"><span>法语</span>  <ol>5.300</ol></a>
        <a href="#"><span>德语</span>  <ol>45.300</ol></a>
      </div>
      <p class="menu_head">个人专区 <em>245.300</em></p>
      <div class="menu_body">
        <a href="#"><span>英语</span>  <ol>45.300</ol></a>
        <a href="#"><span>法语</span>  <ol>5.300</ol></a>
        <a href="#"><span>德语</span>  <ol>45.300</ol></a>
      </div>
    </div>

    <div class="left_an">
      <a href="#">+ 创 建</a>
    </div>

    <div class="hd_bottom"><span></span></div>
  </div>


</div>

<div class="header_center">

  <jsp:include page="head_center_inc.jsp"></jsp:include>
  <div class="center_list">
    <ul>
      <li>
        <div class="st_tt"><span><a href="#">专业PC户主</a></span><ol>在线：346<ol></div>
        <div class="st_2"><a href="#"><img src="images/p1.gif" /></a><ol><a href="#">创建者谁离开大家死定了空间死定了空间死定了空间苏打绿可死定了空间私</a></ol></div>
        <div class="clear"></div>
        <div class="st_3">
          <span><a href="#">ID：13818680753</a></span>
          <b><a href="#">+加入频道</a></b>
          <ol><a href="#">关注</a></ol>
        </div>
      </li>
      <li>
        <div class="st_tt"><span><a href="#">专业PC户主</a></span><ol>在线：346<ol></div>
        <div class="st_2"><a href="#"><img src="images/p1.gif" /></a><ol><a href="#">创建者谁离开大家死定了空间死定了空间死定了空间苏打绿可死定了空间私</a></ol></div>
        <div class="clear"></div>
        <div class="st_3">
          <span><a href="#">ID：13818680753</a></span>
          <b><a href="#">+加入频道</a></b>
          <ol><a href="#">关注</a></ol>
        </div>
      </li>
      <li>
        <div class="st_tt"><span><a href="#">专业PC户主</a></span><ol>在线：346<ol></div>
        <div class="st_2"><a href="#"><img src="images/p1.gif" /></a><ol><a href="#">创建者谁离开大家死定了空间死定了空间死定了空间苏打绿可死定了空间私</a></ol></div>
        <div class="clear"></div>
        <div class="st_3">
          <span><a href="#">ID：13818680753</a></span>
          <b><a href="#">+加入频道</a></b>
          <ol><a href="#">关注</a></ol>
        </div>
      </li>
      <li>
        <div class="st_tt"><span><a href="#">专业PC户主</a></span><ol>在线：346<ol></div>
        <div class="st_2"><a href="#"><img src="images/p1.gif" /></a><ol><a href="#">创建者谁离开大家死定了空间死定了空间死定了空间苏打绿可死定了空间私</a></ol></div>
        <div class="clear"></div>
        <div class="st_3">
          <span><a href="#">ID：13818680753</a></span>
          <b><a href="#">+加入频道</a></b>
          <ol><a href="#">关注</a></ol>
        </div>
      </li>
      <li>
        <div class="st_tt"><span><a href="#">专业PC户主</a></span><ol>在线：346<ol></div>
        <div class="st_2"><a href="#"><img src="images/p1.gif" /></a><ol><a href="#">创建者谁离开大家死定了空间死定了空间死定了空间苏打绿可死定了空间私</a></ol></div>
        <div class="clear"></div>
        <div class="st_3">
          <span><a href="#">ID：13818680753</a></span>
          <b><a href="#">+加入频道</a></b>
          <ol><a href="#">关注</a></ol>
        </div>
      </li>
      <li>
        <div class="st_tt"><span><a href="#">专业PC户主</a></span><ol>在线：346<ol></div>
        <div class="st_2"><a href="#"><img src="images/p1.gif" /></a><ol><a href="#">创建者谁离开大家死定了空间死定了空间死定了空间苏打绿可死定了空间私</a></ol></div>
        <div class="clear"></div>
        <div class="st_3">
          <span><a href="#">ID：13818680753</a></span>
          <b><a href="#">+加入频道</a></b>
          <ol><a href="#">关注</a></ol>
        </div>
      </li>
      <li>
        <div class="st_tt"><span><a href="#">专业PC户主</a></span><ol>在线：346<ol></div>
        <div class="st_2"><a href="#"><img src="images/p1.gif" /></a><ol><a href="#">创建者谁离开大家死定了空间死定了空间死定了空间苏打绿可死定了空间私</a></ol></div>
        <div class="clear"></div>
        <div class="st_3">
          <span><a href="#">ID：13818680753</a></span>
          <b><a href="#">+加入频道</a></b>
          <ol><a href="#">关注</a></ol>
        </div>
      </li>
      <li>
        <div class="st_tt"><span><a href="#">专业PC户主</a></span><ol>在线：346<ol></div>
        <div class="st_2"><a href="#"><img src="images/p1.gif" /></a><ol><a href="#">创建者谁离开大家死定了空间死定了空间死定了空间苏打绿可死定了空间私</a></ol></div>
        <div class="clear"></div>
        <div class="st_3">
          <span><a href="#">ID：13818680753</a></span>
          <b><a href="#">+加入频道</a></b>
          <ol><a href="#">关注</a></ol>
        </div>
      </li>
      <li>
        <div class="st_tt"><span><a href="#">专业PC户主</a></span><ol>在线：346<ol></div>
        <div class="st_2"><a href="#"><img src="images/p1.gif" /></a><ol><a href="#">创建者谁离开大家死定了空间死定了空间死定了空间苏打绿可死定了空间私</a></ol></div>
        <div class="clear"></div>
        <div class="st_3">
          <span><a href="#">ID：13818680753</a></span>
          <b><a href="#">+加入频道</a></b>
          <ol><a href="#">关注</a></ol>
        </div>
      </li>
      <li>
        <div class="st_tt"><span><a href="#">专业PC户主</a></span><ol>在线：346<ol></div>
        <div class="st_2"><a href="#"><img src="images/p1.gif" /></a><ol><a href="#">创建者谁离开大家死定了空间死定了空间死定了空间苏打绿可死定了空间私</a></ol></div>
        <div class="clear"></div>
        <div class="st_3">
          <span><a href="#">ID：13818680753</a></span>
          <b><a href="#">+加入频道</a></b>
          <ol><a href="#">关注</a></ol>
        </div>
      </li>
      <li>
        <div class="st_tt"><span><a href="#">专业PC户主</a></span><ol>在线：346<ol></div>
        <div class="st_2"><a href="#"><img src="images/p1.gif" /></a><ol><a href="#">创建者谁离开大家死定了空间死定了空间死定了空间苏打绿可死定了空间私</a></ol></div>
        <div class="clear"></div>
        <div class="st_3">
          <span><a href="#">ID：13818680753</a></span>
          <b><a href="#">+加入频道</a></b>
          <ol><a href="#">关注</a></ol>
        </div>
      </li>
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


<jsp:include page="windows_inc.jsp"></jsp:include>

</body>
</html>
