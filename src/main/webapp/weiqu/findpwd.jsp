<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 16/4/1
  Time: 下午10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="inc.jsp"></jsp:include>
</head>
<body>
<div class="login_bj"></div>

<div class="login_center" style="margin-top:-230px;">
  <div class="ct-center">
    <span><img src="images/log_logo.png"></span>
    <form action="" method="get">
      <ul>
        <li class="bjno"><em>手机</em><input type="text" class="p1" onBlur="if(this.value==''){this.value='请输入手机号';this.style.color='#ccc'}" onFocus="if(this.value=='请输入手机号'){this.value='';this.style.color='#333'}" value="请输入手机号" id="textfield" name="email" style="color:#ccc;"></li>
        <li class="bjno1">
          <input type="text" class="p1" onBlur="if(this.value==''){this.value='输入验证码';this.style.color='#ccc'}" onFocus="if(this.value=='输入验证码'){this.value='';this.style.color='#333'}" value="输入验证码" id="textfield" name="email" style="color:#ccc;">
          <b><a href="#">60秒后重新发送</a></b>
        </li>
        <input name="" type="submit" value="下一步" class="p3">
      </ul>
    </form>
    <ol>记得密码？点此<a href="login.jsp">登录</a> </ol>
  </div>
  <jsp:include page="bottom.jsp"></jsp:include>
</div>
</body>
</html>
