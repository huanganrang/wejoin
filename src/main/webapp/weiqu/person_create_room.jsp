<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 16/4/9
  Time: 上午8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="lst_title person_create_room">这里调用频道名称-房间列表（<em>247</em>）   <ol><a href="#">+返回</a></ol> <span><a href="#">+添加房间</a></span></div>

<div class="fj_list person_create_room">
  <ul>
  </ul>
</div>
<div class="currl person_create_room_create">
  <div class="currl_left">
    <form action="" method="get">
      <ul>
        <li><input type="text" class="p1" onBlur="if(this.value==''){this.value='请填写房间名称';this.style.color='#ccc'}" onFocus="if(this.value=='请填写房间名称'){this.value='';this.style.color='#333'}" value="请填写房间名称" name="title"  style="color:#ccc;"></li>
        <div class="clear"></div>
        <li>
          <span>是否开启房间密码：</span>
          <label><input name="Fruit" type="radio" value="" />否 </label>
          <label><input name="Fruit" type="radio" value="" />是 </label>
          <input type="text" name="password" class="p2"/>
          <div class="clear"></div>
        </li>
        <li>
          <ol>讲师介绍（<em>非必填</em>）</ol>
          <textarea name="desc" cols="" rows="" class="p3"></textarea>
        </li>
        <li>
          <ol>课程介绍（<em>非必填</em>）</ol>
          <textarea name="lessonDesc" cols="" rows="" class="p3"></textarea>
        </li>
      </ul>
    </form>
  </div>


  <div class="currl_right">
    <ol>时间安排（<em>非必填</em>）</ol>
    <form action="" method="get">

    <div class="date_left">
      <span>开始时间：</span>
      <input type="text" class="p1" onBlur="if(this.value==''){this.value='2015/08/28';this.style.color='#ccc'}" onFocus="if(this.value=='2015/08/28'){this.value='';this.style.color='#333'}" value="2015/08/28"  name="startDate" style="color:#ccc;">
      <input type="text" class="p1" onBlur="if(this.value==''){this.value='12:30';this.style.color='#ccc'}" onFocus="if(this.value=='12:30'){this.value='';this.style.color='#333'}" value="12:30"  name="startTime" style="color:#ccc; width:65px;">
      <div class="clear"></div>
    </div>
    <div class="date_left">
      <span>结束时间：</span>
      <input type="text" class="p1" onBlur="if(this.value==''){this.value='2015/08/28';this.style.color='#ccc'}" onFocus="if(this.value=='2015/08/28'){this.value='';this.style.color='#333'}" value="2015/08/28"  name="endDate" style="color:#ccc;">
      <input type="text" class="p1" onBlur="if(this.value==''){this.value='12:30';this.style.color='#ccc'}" onFocus="if(this.value=='12:30'){this.value='';this.style.color='#333'}" value="12:30"  name="endTime" style="color:#ccc; width:65px;">
    </div>
    <div class="jia_date" id="box10" style="display:none;">
				<span>
					<input type="text" class="p1" onBlur="if(this.value==''){this.value='2015/08/28';this.style.color='#ccc'}" onFocus="if(this.value=='2015/08/28'){this.value='';this.style.color='#333'}" value="2015/08/28"  name="startDate" style="color:#ccc;">
					<input type="text" class="p1" onBlur="if(this.value==''){this.value='12:30';this.style.color='#ccc'}" onFocus="if(this.value=='12:30'){this.value='';this.style.color='#333'}" value="12:30"  name="startTime" style="color:#ccc; width:65px;">
				</span>
				<span>
					<input type="text" class="p1" onBlur="if(this.value==''){this.value='2015/08/28';this.style.color='#ccc'}" onFocus="if(this.value=='2015/08/28'){this.value='';this.style.color='#333'}" value="2015/08/28"  name="endDate" style="color:#ccc;">
					<input type="text" class="p1" onBlur="if(this.value==''){this.value='12:30';this.style.color='#ccc'}" onFocus="if(this.value=='12:30'){this.value='';this.style.color='#333'}" value="12:30"  name="endTime" style="color:#ccc; width:65px;">
				</span>
    </div>
      </form>
    <div class="clear"></div>
    <div class="ja_an">
      <a onClick="openShutManager(this,'box10')">+增加时间</a>
      <a onClick="openShutManager(this,'box10')">-删除时间</a>
      <div class="clear"></div>
    </div>
    <div class="currl_an"><span><a href="#">确定添加房间</a></span></div>
  </div>
</div>
<div class="clear person_create_room_create"></div>


<script src="js/person_create_room.js?v=${staticVersion}"></script>

