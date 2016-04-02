<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 16/4/2
  Time: 下午2:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="channel_inc.jsp"></jsp:include>
  <link href="css/person.css?v=${staticVersion}" rel="stylesheet" type="text/css" />
  <script src="js/person.js?v=${staticVersion}"></script>

</head>
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
</script>
</head>
<body>
<div class="header_left">
  <jsp:include page="head_left_inc.jsp"></jsp:include>
  <div class="left_tt">个人中心</div>
  <div>

    <div class="menu_list">
      <p class="menu_head" id="person_create"><a href="#" class="a1">我的创建 <em>247</em></a></p>
      <p class="menu_head on" id="person_attention"><a href="#" class="a2">我的关注 <em>245.300</em></a></p>
      <p class="menu_head" id="person_space"><a href="#" class="a3">我的空间 <em>327MB/1gb</em></a></p>
      <p class="menu_head" id="person_message"><a href="#" class="a4">我的消息 <em>245.300</em></a></p>
      <p class="menu_head" id="person_idea"><a href="#" class="a5">意见反馈 <em>245.300</em></a></p>
    </div>
    <div class="hd_bottom"><span></span></div>
  </div>


</div>

<div class="header_center">

  <jsp:include page="head_center_inc.jsp"></jsp:include>

  <div class="personal">
    <div class="per_left">
      <div class="per_img">
        <a href="#"onclick="showportraitBox()">
          <img src="images/tb5.gif" />
          <span>编辑</span>
        </a>
      </div>
      <div class="per_txt">
        <span><em>账号：251145454</em>   <em>昵称：我就是我啊</em>    <a href="#"onclick="shownickBox()">编辑</a></span>
        <ol>账号安全：<strong>未保护</strong>    <a href="#"onclick="showphoneBox()">绑定</a></ol>
      </div>
    </div>
    <div class="per_right"><a href="#">退出当前账号</a></div>
    <div class="clear"></div>
  </div>
  <jsp:include page="person_attention.jsp"></jsp:include>
  <jsp:include page="person_create.jsp"></jsp:include>
  <jsp:include page="person_idea.jsp"></jsp:include>
  <jsp:include page="person_message.jsp"></jsp:include>
  <jsp:include page="person_space.jsp"></jsp:include>


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


<!--编辑头像 开始-->
<div class="windows portraitBox" id="portraitBox" style="display:none;" >
  <div class="windowsBg"></div>
  <div class="windows_box">
    <div class="uplodBox_con">
      <div class="up_yy">
        <span class="tb2">上传新的头像图片</span>
        <input type="file" name="uploadFile" size="3" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M" class="filePrew">
      </div>
      <div class="up_an">
        <a href="#" class="a2">确定创建</a>
      </div>
    </div>
    <div class="close_btn"><a href="#">取消返回</a></div>
  </div>
</div>
<!--编辑头像 结束-->

<!--编辑昵称 开始-->
<div class="windows nickBox" id="nickBox" style="display:none;" >
  <div class="windowsBg"></div>
  <div class="windows_box">
    <div class="uplodBox_con">
      <div class="nick"><input type="text" class="p1" onBlur="if(this.value==''){this.value='请输入新的昵称';this.style.color='#ccc'}" onFocus="if(this.value=='请输入新的昵称'){this.value='';this.style.color='#333'}" value="请输入新的昵称" id="textfield" name="email" style="color:#ccc;"></div>
      <div class="up_an">
        <a href="#" class="a2">确定修改</a>
      </div>
    </div>
    <div class="close_btn"><a href="#">取消返回</a></div>
  </div>
</div>
<!--编辑昵称 结束-->

<!--验证手机 开始-->
<div class="windows phoneBox" id="phoneBox" style="display:none;" >
  <div class="windowsBg"></div>
  <div class="windows_box">
    <div class="uplodBox_con">
      <div class="nick">
        <input type="text" class="p1" onBlur="if(this.value==''){this.value='请输入新的昵称';this.style.color='#ccc'}" onFocus="if(this.value=='请输入新的昵称'){this.value='';this.style.color='#333'}" value="请输入新的昵称" id="textfield" name="email" style="color:#ccc; margin:17px 15px 13px 15px;">
        <input type="text" class="p2" onBlur="if(this.value==''){this.value='请输入收到的验证码';this.style.color='#ccc'}" onFocus="if(this.value=='请输入收到的验证码'){this.value='';this.style.color='#333'}" value="请输入收到的验证码" id="textfield" name="email" style="color:#ccc; margin:0px 15px;">
        <a href="#">点击发送验证码</a>
        <div class="clear"></div>
      </div>
      <div class="up_an">
        <a href="#" class="a2">确定修改</a>
      </div>
    </div>
    <div class="close_btn"><a href="#">取消返回</a></div>
  </div>
</div>
<!--验证手机 结束-->
</body>
</html>
