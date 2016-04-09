<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 16/4/2
  Time: 下午2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="head_log">
  <c:choose>
    <c:when test="${!userToken.loginMark}">
      <a href="login.jsp" class="a2">登录</a>
      <a href="register.jsp">注册</a>
    </c:when>
    <c:otherwise>
      <div class="log_you">
        <a href="person.jsp">
          <img src="images/yktx.png" />
          <span>游客：${userToken.nickName}</span>
        </a>
      </div>
    </c:otherwise>
  </c:choose>
</div>
<div class="rt_title">房间人气排行榜</div>
<div class="right_list">
  <ul>
    <li><a href="#"><em style="background:#cb0000;">1</em><span>视频教是是 </span><ol>245.300</ol></a></li>
    <li><a href="#"><em style="background:#e37000;">2</em><span>语言言培训  </span><ol>245.300</ol></a></li>
    <li><a href="#"><em style="background:#70b615;">3</em><span>个人专言言区 </span><ol>245.300</ol></a></li>
    <li><a href="#"><em>4</em><span>艺术文言言体  </span><ol>245.300</ol></a></li>
    <li><a href="#"><em>5</em><span>娱乐模言块       </span><ol>245.300</ol></a></li>
    <li><a href="#"><em>6</em><span>行业言言培训  </span><ol>245.300</ol></a></li>
    <li><a href="#"><em>7</em><span>视频教是是 </span><ol>245.300</ol></a></li>
    <li><a href="#"><em>8</em><span>视频教是是 </span><ol>245.300</ol></a></li>
    <li><a href="#"><em>9</em><span>个人专言言区 </span><ol>245.300</ol></a></li>
    <li><a href="#"><em>10</em><span>视频教是是 </span><ol>245.300</ol></a></li>
  </ul>
</div>
