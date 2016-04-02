<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 16/4/2
  Time: 下午3:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="lst_title person_center person_idea">意见反馈（<em>247</em>） </div>

<div class="geet_book person_center person_idea">
		<span>
			<em>请留下您的保贵意见！</em>
			<b>客服电话：021-86458542</b>
		</span>
  <ul>
    <form action="" method="get">
      <li><textarea name="Content" rows="4" class="pute" style="color:#ccc" onFocus="if(this.value=='反馈内容') {this.value='';}this.style.color='#333';" onBlur="if(this.value=='') {this.value='反馈内容';this.style.color='#ccc';}" onKeyUp="checkLength(this);">反馈内容</textarea></li>
      <li>
        <input type="text" class="p1" onBlur="if(this.value==''){this.value='请留下你的联系方式和姓名';this.style.color='#ccc'}" onFocus="if(this.value=='请留下你的联系方式和姓名'){this.value='';this.style.color='#333'}" value="请留下你的联系方式和姓名" id="textfield" name="email" style="color:#ccc;">
        <a href="#">提交内容</a>
      </li>
    </form>
  </ul>
</div>
