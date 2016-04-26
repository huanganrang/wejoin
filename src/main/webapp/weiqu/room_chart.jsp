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

		<div class="emotions">
			<div class="holder">

			</div>
		</div>
		<div class = "gifts"><div class = "holder">
			<span><span><img src="images/tb/balloon.png" /></span></span>
			<span><span><img src="images/tb/bianping-christmas-2014-05.png" /></span></span>
			<span><span><img src="images/tb/bird-toys.png" /></span></span>
			<span><span><img src="images/tb/bird-white.png" /></span></span>
			<span><span><img src="images/tb/bluefaces_12.png" /></span></span>
			<span><span><img src="images/tb/buel.png" /></span></span>
			<span><span><img src="images/tb/catlover.png" /></span></span>
			<span><span><img src="images/tb/christmas-balls.png" /></span></span>
			<span><span><img src="images/tb/cocktail.png" /></span></span>
			<span><span><img src="images/tb/colour_apple_02.png" /></span></span>
			<span><span><img src="images/tb/confettiicon.png" /></span></span>
			<span><span><img src="images/tb/cyan.png" /></span></span>
			<span><span><img src="images/tb/dahuangmao-04.png" /></span></span>
			<span><span><img src="images/tb/dancing-minion-icon.png" /></span></span>
			<span><span><img src="images/tb/disney_dax_pink_03.png" /></span></span>
			<span><span><img src="images/tb/disney_dax_pink_06.png" /></span></span>
			<span><span><img src="images/tb/dog_04.png" /></span></span>
			<span><span><img src="images/tb/dummy-fish.png" /></span></span>
			<span><span><img src="images/tb/email.png" /></span></span>
			<span><span><img src="images/tb/fileexplorer.png" /></span></span>
			<span><span><img src="images/tb/gm.png" /></span></span>
			<span><span><img src="images/tb/goo.png" /></span></span>
			<span><span><img src="images/tb/hatcon.png" /></span></span>
			<span><span><img src="images/tb/iceage-02.png" /></span></span>
			<span><span><img src="images/tb/iceage-06.png" /></span></span>
			<span><span><img src="images/tb/kook.png" /></span></span>
			<span><span><img src="images/tb/labrador.png" /></span></span>
			<span><span><img src="images/tb/loco_roco_03.png" /></span></span>
			<span><span><img src="images/tb/madagascar_01.png" /></span></span>
			<span><span><img src="images/tb/madagascar_02.png" /></span></span>
			<span><span><img src="images/tb/madagascar_03.png" /></span></span>
			<span><span><img src="images/tb/madagascar_04.png" /></span></span>
			<span><span><img src="images/tb/madagascar_08.png" /></span></span>
			<span><span><img src="images/tb/medusa.png" /></span></span>
			<span><span><img src="images/tb/mime_riendo.png" /></span></span>
			<span><span><img src="images/tb/musicherz.png" /></span></span>
			<span><span><img src="images/tb/pig-green.png" /></span></span>
			<span><span><img src="images/tb/popkart_01.png" /></span></span>
			<span><span><img src="images/tb/poulpo.png" /></span></span>
			<span><span><img src="images/tb/psychotic-penguin.png" /></span></span>
			<span><span><img src="images/tb/puppy_dogs_02.png" /></span></span>
			<span><span><img src="images/tb/puppy_dogs_04.png" /></span></span>
			<span><span><img src="images/tb/purple.png" /></span></span>
			<span><span><img src="images/tb/rtm.png" /></span></span>
			<span><span><img src="images/tb/russel.png" /></span></span>
			<span><span><img src="images/tb/santa.png" /></span></span>
			<span><span><img src="images/tb/shengdanlaoren-2014-10.png" /></span></span>
			<span><span><img src="images/tb/snow_leopard_06.png" /></span></span>
			<span><span><img src="images/tb/social_network.png" /></span></span>
			<span><span><img src="images/tb/thememanager.png" /></span></span>
			<span><span><img src="images/tb/twitter4.png" /></span></span>
			<span><span><img src="images/tb/uncle-dumplin.png" /></span></span>
			<span><span><img src="images/tb/updater.png" /></span></span>
			<span><span><img src="images/tb/wabi.png" /></span></span>
			<span><span><img src="images/tb/weather (1).png" /></span></span>
			<span><span><img src="images/tb/weather.png" /></span></span>
			<span><span><img src="images/tb/wet-dog.png" /></span></span>
			<span><span><img src="images/tb/xmas-wreath.png" /></span></span>
			<div class = "clear-float"> </div>
		</div></div>
	</div>
	<div class = "input"><div><textarea></textarea></div></div>
</div>

