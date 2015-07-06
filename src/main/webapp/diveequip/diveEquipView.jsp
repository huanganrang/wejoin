<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveEquip" %>
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
					<th><%=TdiveEquip.ALIAS_EQUIP_ICON%></th>	
					<td>
						${diveEquip.equipIcon}							
					</td>							
					<th><%=TdiveEquip.ALIAS_EQUIP_SUMARY%></th>	
					<td>
						${diveEquip.equipSumary}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TdiveEquip.ALIAS_EQUIP_NAME%></th>	
					<td>
						${diveEquip.equipName}							
					</td>							
					<th><%=TdiveEquip.ALIAS_STATUS%></th>	
					<td>
						${diveEquip.status}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TdiveEquip.ALIAS_EQUIP_BRAND%></th>	
					<td>
						${diveEquip.equipBrand}							
					</td>							
					<th><%=TdiveEquip.ALIAS_EQUIP_DES%></th>	
					<td>
						${diveEquip.equipDes}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TdiveEquip.ALIAS_ADDTIME%></th>	
					<td>
						${diveEquip.addtime}							
					</td>							
				</tr>		
		</table>
	</div>
</div>