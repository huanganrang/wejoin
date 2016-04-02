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
<script type="text/javascript">
  $(document).ready(function() {
    $("#register").click(WEIQU_BASE_FUN.register);
    $("#timeEmail").click(WEIQU_BASE_FUN.getValidCode);
  });
</script>
<div class="login_bj"></div>

<div class="login_center" style="margin-top:-290px;">
  <div class="ct-center">
    <span><img src="images/log_logo.png"></span>
    <form action="" method="get">
      <ul>
        <li class="bjno"><em>帐号</em><input type="text" class="p1" onBlur="if(this.value==''){this.value='请输入汉字、字母、数字或组合';this.style.color='#ccc'}" onFocus="if(this.value=='请输入汉字、字母、数字或组合'){this.value='';this.style.color='#333'}" value="请输入汉字、字母、数字或组合" name="username" id="username" style="color:#ccc;"></li>
        <li class="bjno"><em>密码</em><input type="text" class="p1" onBlur="if(this.value==''){this.value='请输入至少六位数的密码';this.style.color='#ccc'}" onFocus="if(this.value=='请输入至少六位数的密码'){this.value='';this.style.color='#333'}" value="请输入至少六位数的密码" name="password" id="password" style="color:#ccc;"></li>
        <li class="bjno"><em>手机</em><input type="text" class="p1" onBlur="if(this.value==''){this.value='请输入手机号';this.style.color='#ccc'}" onFocus="if(this.value=='请输入手机号'){this.value='';this.style.color='#333'}" value="请输入手机号" id="telphone" name="telphone" style="color:#ccc;"></li>
        <li class="bjno1">
          <input type="text" class="p1" onBlur="if(this.value==''){this.value='输入验证码';this.style.color='#ccc'}" onFocus="if(this.value=='输入验证码'){this.value='';this.style.color='#333'}" value="输入验证码" id="validCode" name="validCode" style="color:#ccc;">
          <b><a href="#" id="timeEmail">60秒后重新发送</a></b>
        </li>
        <input name="" type="button" id="register" value="注 册" class="p3">
      </ul>
    </form>
    <ol>已有帐户？点此<a href="login.jsp">登录</a> </ol>
  </div>
  <jsp:include page="bottom.jsp"></jsp:include>
</div>
</body>
</html>
