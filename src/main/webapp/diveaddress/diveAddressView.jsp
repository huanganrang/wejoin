<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveAddress" %>
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
					<th><%=TdiveAddress.ALIAS_NAME%></th>	
					<td>
						${diveAddress.name}							
					</td>							
					<th><%=TdiveAddress.ALIAS_SUMARY%></th>	
					<td>
						${diveAddress.sumary}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TdiveAddress.ALIAS_ICON%></th>	
					<td>
						${diveAddress.icon}							
					</td>							
					<th><%=TdiveAddress.ALIAS_DESCRIPTION%></th>	
					<td>
						${diveAddress.description}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TdiveAddress.ALIAS_AREA%></th>	
					<td>
						${diveAddress.area}							
					</td>							
					<th><%=TdiveAddress.ALIAS_FEATURE%></th>	
					<td>
						${diveAddress.feature}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TdiveAddress.ALIAS_STATUS%></th>	
					<td>
						${diveAddress.status}							
					</td>							
					<th><%=TdiveAddress.ALIAS_ADDTIME%></th>	
					<td>
						${diveAddress.addtime}							
					</td>							
				</tr>		
		</table>
	</div>
</div>