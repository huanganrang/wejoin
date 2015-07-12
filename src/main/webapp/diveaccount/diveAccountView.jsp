<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveAccount"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');		
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<table class="table table-hover table-condensed">
			<tr>
				<th><%=TdiveAccount.ALIAS_USER_NAME%></th>
				<td>${diveAccount.userName}</td>
				<th><%=TdiveAccount.ALIAS_PASSWORD%></th>
				<td>${diveAccount.password}</td>
			</tr>
			<tr>
				<th><%=TdiveAccount.ALIAS_ICON%></th>
				<td>${diveAccount.icon}</td>
				<th><%=TdiveAccount.ALIAS_NICKNAME%></th>
				<td>${diveAccount.nickname}</td>
			</tr>
			<tr>
				<th><%=TdiveAccount.ALIAS_SEX%></th>
				<td>${diveAccount.sex}</td>
				<th><%=TdiveAccount.ALIAS_CITY%></th>
				<td>${diveAccount.city}</td>
			</tr>
			<tr>
				<th><%=TdiveAccount.ALIAS_PERSONALITY%></th>
				<td>${diveAccount.personality}</td>
				<th><%=TdiveAccount.ALIAS_EMAIL%></th>
				<td>${diveAccount.email}</td>
			</tr>
			<tr>
				<th><%=TdiveAccount.ALIAS_ADDTIME%></th>
				<td>${diveAccount.addtime}</td>
			</tr>
		</table>
	</div>
</div>