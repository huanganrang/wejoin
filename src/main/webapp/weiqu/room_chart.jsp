<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 16/4/2
  Time: 下午3:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class = "aside right">
	<div class = "conversation-visibility">
		<span class = "public selected">公聊</span>
		<span class = "private">私聊</span>
		<div class = "clear-float"> </div>
	</div>
	<div class = "conversation">
		<div class = "datetime">2016/01/25 16:42</div>
		<div class = "msg received">
			<img class = "user-img" src = "img/room/user1.png"/>
			<div class = "nickname">我是会飞的鱼</div>
			<div class = "content">
				<div>我们的《刀塔传奇》这款游戏目前有新手礼包哦，亲如果在玩的话可以去看看，里边送的东西不少呢！</div>
			</div>
			<div class = "clear-float"> </div>
		</div>
		<div class = "msg sent">
			<img class = "user-img" src = "img/room/user1.png"/>
			<div class = "nickname">我是会飞的鱼</div>
			<div class = "content">
				<div>哈嘿哈嘿使用双截棍</div>
			</div>
			<div class = "clear-float"> </div>
		</div>
		<div class = "msg system">
			<img class = "user-img" src = "img/room/user1.png"/>
			<div class = "nickname">我是会飞的鱼</div>
			<div class = "content">
				<div>您已申请举手发言，请等待管理员批准</div>
			</div>
			<div class = "clear-float"> </div>
		</div>
		<div class = "msg received">
			<img class = "user-img" src = "img/room/user1.png"/>
			<div class = "nickname">我是会飞的鱼</div>
			<div class = "content">
				<div>我们的《刀塔传奇》这款游戏目前有新手礼包哦，亲如果在玩的话可以去看看，里边送的东西不少呢！</div>
			</div>
			<div class = "clear-float"> </div>
		</div>
		<div class = "msg sent">
			<img class = "user-img" src = "img/room/user1.png"/>
			<div class = "nickname">我是会飞的鱼</div>
			<div class = "content">
				<div>哈嘿哈嘿使用双截棍</div>
			</div>
			<div class = "clear-float"> </div>
		</div>
	</div>
	<div class = "input-toolbar">
		<span class = "tool emotion"></span>
		<span class = "tool gift"></span>
		<span class = "tool palm"></span>
		<span class = "send">发送</span>

		<div class = "emotions"><div class = "holder">
			<span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span>
			<span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span>
			<span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span>
			<div class = "clear-float"> </div>
		</div></div>
		<div class = "gifts"><div class = "holder">
			<span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span>
			<span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span>
			<span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span><span><span></span></span>
			<div class = "clear-float"> </div>
		</div></div>
	</div>
	<div class = "input"><div><textarea></textarea></div></div>
</div>

