<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 16/4/2
  Time: 下午3:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class = "msg sent" id="chartMessage" style="display: none;">
	<img class = "user-img" src = "img/room/user1.png" name="icon"/>
	<div class = "nickname" name="nickName">我是会飞的鱼</div>
	<div class = "content">
		<div name="message">哈嘿哈嘿使用双截棍</div>
	</div>
	<div class = "clear-float"> </div>
</div>

<div class = "msg received" id="receivedMessage" style="display: none;">
	<img class = "user-img" src = "img/room/user1.png" name="icon"/>
	<div class = "nickname" name="nickName">我是会飞的鱼</div>
	<div class = "content">
		<div name="message">我们的《刀塔传奇》这款游戏目前有新手礼包哦，亲如果在玩的话可以去看看，里边送的东西不少呢！</div>
	</div>
	<div class = "clear-float"> </div>
</div>

<div class = "member" id="userMember" style="display: none;">
	<img src = "img/room/user1.png" name="icon"/>
	<div class = "top">
		<span class = "nickname" name="nickName">会飞的企鹅会飞的企鹅</span>
	</div>
	<div class = "bottom">
		<span class = "sign camera"></span>
		<span class = "sign palm"></span>
		<div class = "clear-float"> </div>
	</div>
</div>

<div style="display:none;">
	<form method="POST" target="uploadFrame" id="uploadForm" action="http://139.196.34.76:8080/upload" enctype="multipart/form-data">
		<!--<form method="POST" action="http://localhost:8080/upload" enctype="multipart/form-data" >-->
		File:
		<input type="file" name="file" id="file" /> <br/>

		houseToken:
		<input type="text" value="" name="houseToken"/>
		userToken:
		<input type="text" value="" name="userToken"/>
		type:
		<input type="text" value="3" name="type"/>

		</br>
	</form>
	<form method="POST" target="uploadFrame" id="uploadformMovie" action="http://139.196.34.76:8080/upload" enctype="multipart/form-data">
		<input type="file" name="file" id="moviefile" /> <br/>
	</form>
	<iframe name="uploadFrame" id="uploadFrame"></iframe>
</div>