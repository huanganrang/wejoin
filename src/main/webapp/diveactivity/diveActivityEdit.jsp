<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveActivity" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/diveActivityController/edit',
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				}
				return isValid;
			},
			success : function(result) {
				parent.$.messager.progress('close');
				result = $.parseJSON(result);
				if (result.success) {
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: auto;">
		<form id="form" method="post">
				<input type="hidden" name="id" value = "${diveActivity.id}"/>
			<table class="table table-hover table-condensed">
				<tr>	
					<th width="8%"><%=TdiveActivity.ALIAS_NAME%></th>	
					<td width="42%">
					<input class="span2" name="name" type="text" value="${diveActivity.name}"/>
					</td>	
					<th width="8%"><%=TdiveActivity.ALIAS_ADDR_ID%></th>	
					<td width="42%">
						<jb:selectSql dataType="SL002" name="addrId" value="${diveActivity.addrId}"></jb:selectSql>
					</td>													
				</tr>	
				<tr>	
					<th><%=TdiveActivity.ALIAS_START_DATE%></th>	
					<td>
					<input class="span2" name="startDateStr" type="text" onclick="WdatePicker({dateFmt:'<%=TdiveActivity.FORMAT_START_DATE%>'})"  
							maxlength="0" class="" value="${diveActivity.startDate}"/>
					</td>	
					<th><%=TdiveActivity.ALIAS_END_DATE%></th>	
					<td>
					<input class="span2" name="endDateStr" type="text" onclick="WdatePicker({dateFmt:'<%=TdiveActivity.FORMAT_END_DATE%>'})"  
							maxlength="0" class=""  value="${diveActivity.endDate}"/>
					</td>							
											
				</tr>	
				<tr>	
					<th><%=TdiveActivity.ALIAS_START_ADDR%></th>	
					<td colspan="3">
						<input class="span2" name="startAddr" type="text" style="width: 500px;" value="${diveActivity.startAddr}"/>
					</td>	
				</tr>	
				<tr>	
					<th><%=TdiveActivity.ALIAS_END_ADDR%></th>	
					<td colspan="3">
						<input class="span2" name="endAddr" type="text"  style="width: 500px;" value="${diveActivity.endAddr}"/>
					</td>								
				</tr>	
				<tr>	
					<th><%=TdiveActivity.ALIAS_DESCRIPTION%></th>	
					<td colspan="3">
						<textarea style="width: 500px;" name="description">${diveActivity.description}</textarea>
					</td>							
				</tr>
			</table>				
		</form>
	</div>
</div>