<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveCourse"%>
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
				<th><%=TdiveCourse.ALIAS_TITLE%></th>
				<td>${diveCourse.title}</td>
				<th><%=TdiveCourse.ALIAS_COURSE_TYPE%></th>
				<td>${diveCourse.courseType}</td>
			</tr>
			<tr>
				<th><%=TdiveCourse.ALIAS_ICON%></th>
				<td>${diveCourse.icon}</td>
				<th><%=TdiveCourse.ALIAS_PRICE%></th>
				<td>${diveCourse.price}</td>
			</tr>
			<tr>
				<th><%=TdiveCourse.ALIAS_CONTENT%></th>
				<td>${diveCourse.content}</td>
				<th><%=TdiveCourse.ALIAS_INTRODUCE%></th>
				<td>${diveCourse.introduce}</td>
			</tr>
			<tr>
				<th><%=TdiveCourse.ALIAS_FILE_PATH%></th>
				<td>${diveCourse.filePath}</td>
				<th><%=TdiveCourse.ALIAS_STATUS%></th>
				<td>${diveCourse.status}</td>
			</tr>
			<tr>
				<th><%=TdiveCourse.ALIAS_ADDTIME%></th>
				<td>${diveCourse.addtime}</td>
			</tr>
		</table>
	</div>
</div>