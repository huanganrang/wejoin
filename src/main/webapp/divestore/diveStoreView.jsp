<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveStore"%>
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
				<th><%=TdiveStore.ALIAS_NAME%></th>
				<td>${diveStore.name}</td>
				<th><%=TdiveStore.ALIAS_ICON%></th>
				<td>${diveStore.icon}</td>
			</tr>
			<tr>
				<th><%=TdiveStore.ALIAS_SUMARY%></th>
				<td>${diveStore.sumary}</td>
				<th><%=TdiveStore.ALIAS_SERVER_SCOPE%></th>
				<td>${diveStore.serverScope}</td>
			</tr>
			<tr>
				<th><%=TdiveStore.ALIAS_AREA%></th>
				<td>${diveStore.area}</td>
				<th><%=TdiveStore.ALIAS_STATUS%></th>
				<td>${diveStore.status}</td>
			</tr>
			<tr>
				<th><%=TdiveStore.ALIAS_ADDTIME%></th>
				<td>${diveStore.addtime}</td>
			</tr>
		</table>
	</div>
</div>