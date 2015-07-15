<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body >
	<div id="index_people_center_tabs" class="easyui-tabs" data-options="fit:true">
		<div title="注册" data-options="href:'api_register.jsp'"
			style="padding: 1px"></div>
		<div title="登录" data-options="href:'api_login.jsp'"
			style="padding: 1px"></div>
		<div title="修改密码" data-options="href:'api_updatePass.jsp'"
			style="padding: 1px"></div>
		<div title="个人主页" data-options="href:'api_people_center_personHome.jsp'"
			style="padding: 1px"></div>
		<div title="个人信息（查）" data-options="href:'api_people_center_personInfo.jsp'"
			style="padding: 1px"></div>
		<div title="个人信息（改）" data-options="href:'api_people_center_personInfoUpdate.jsp'"
			style="padding: 1px"></div>
		<div title="头像上传" data-options="href:'api_people_center_headImageUpload.jsp'"
			style="padding: 1px"></div>
	</div>
</body>
</html>