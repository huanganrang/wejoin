<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 16/4/1
  Time: 下午9:09
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
    $("#login").click(WEIQU_BASE_FUN.login);
  });
</script>
  <div class="login_bj"></div>

  <div class="login_center">
    <div class="ct-center">
      <span><img src="images/log_logo.png"></span>
      <form action="${GET}" method="POST">
        <input type="hidden" name="apiType" value="UL001">
        <input type="hidden" name="pageUrl" value="redirect:/weiqu/channel.jsp">
        <ul>
          <li><input type="text" class="p1" onBlur="if(this.value==''){this.value='请输入账号/手机号登录';this.style.color='#ccc'}" onFocus="if(this.value=='请输入账号/手机号登录'){this.value='';this.style.color='#333'}" value="请输入账号/手机号登录" id="username" name="username" style="color:#ccc;"></li>
          <li><input type="password" class="p2" onBlur="if(this.value==''){this.value='请输入密码';this.style.color='#ccc'}" onFocus="if(this.value=='请输入密码'){this.value='';this.style.color='#333'}" value="请输入密码" id="password" name="password" style="color:#ccc;"></li>
          <input name="" type="button" id="login" value="登 录" class="p3">
        </ul>
      </form>
      <ol>还没有账户？您可以在此  <a href="register.jsp">注册</a> <em><a href="findpwd.jsp">忘记密码？</a></em></ol>
    </div>
    <jsp:include page="bottom.jsp"></jsp:include>
  </div>
</body>
</html>
