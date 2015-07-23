<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveArea" %>
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
					<th><%=TdiveArea.ALIAS_CODE%></th>	
					<td>
						${diveArea.code}							
					</td>							
					<th><%=TdiveArea.ALIAS_NAME%></th>	
					<td>
						${diveArea.name}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TdiveArea.ALIAS_PARENT_CODE%></th>	
					<td>
						${diveArea.parentCode}							
					</td>							
					<th><%=TdiveArea.ALIAS_COUNTRY_CODE%></th>	
					<td>
						${diveArea.countryCode}							
					</td>							
				</tr>		
		</table>
	</div>
</div>