<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveTravel"%>
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
				<th><%=TdiveTravel.ALIAS_NAME%></th>
				<td>${diveTravel.name}</td>
				<th><%=TdiveTravel.ALIAS_SUMARY%></th>
				<td>${diveTravel.sumary}</td>
			</tr>
			<tr>
				<th><%=TdiveTravel.ALIAS_PRICE%></th>
				<td>${diveTravel.price}</td>
				<th><%=TdiveTravel.ALIAS_ICON%></th>
				<td>${diveTravel.icon}</td>
			</tr>
			<tr>
				<th><%=TdiveTravel.ALIAS_DESCRIPTION%></th>
				<td>${diveTravel.description}</td>
				<th><%=TdiveTravel.ALIAS_AREA%></th>
				<td>${diveTravel.area}</td>
			</tr>
			<tr>
				<th><%=TdiveTravel.ALIAS_FEATURE%></th>
				<td>${diveTravel.feature}</td>
				<th><%=TdiveTravel.ALIAS_STATUS%></th>
				<td>${diveTravel.status}</td>
			</tr>
			<tr>
				<th><%=TdiveTravel.ALIAS_ADDTIME%></th>
				<td>${diveTravel.addtime}</td>
			</tr>
		</table>
	</div>
</div>