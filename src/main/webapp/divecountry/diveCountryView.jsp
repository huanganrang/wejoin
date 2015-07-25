<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveCountry" %>
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
					<th><%=TdiveCountry.ALIAS_NAME%></th>	
					<td>
						${diveCountry.name}							
					</td>							
					<th><%=TdiveCountry.ALIAS_CODE%></th>	
					<td>
						${diveCountry.code}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TdiveCountry.ALIAS_AD_CODE%></th>	
					<td colspan="3">
						${diveCountry.adCodeZh}							
					</td>							
				</tr>		
		</table>
	</div>
</div>