<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveActivity" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	$(function() {
	 parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/diveActivityController/add',
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
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">	
		<form id="form" method="post">		
				<input type="hidden" name="id"/>
			<table class="table table-hover table-condensed">
				<tr>	
					<th><%=TdiveActivity.ALIAS_NAME%></th>	
					<td>
					<input class="span2" name="name" type="text" class="span2"/>
					</td>							
					<th><%=TdiveActivity.ALIAS_START_DATE%></th>	
					<td>
					<input class="span2" name="startDate" type="text" onclick="WdatePicker({dateFmt:'<%=TdiveActivity.FORMAT_START_DATE%>'})"  maxlength="0" class="" />
					</td>							
				</tr>	
				<tr>	
					<th><%=TdiveActivity.ALIAS_END_DATE%></th>	
					<td>
					<input class="span2" name="endDate" type="text" onclick="WdatePicker({dateFmt:'<%=TdiveActivity.FORMAT_END_DATE%>'})"  maxlength="0" class="" />
					</td>							
					<th><%=TdiveActivity.ALIAS_START_ADDR%></th>	
					<td>
					<input class="span2" name="startAddr" type="text" class="span2"/>
					</td>							
				</tr>	
				<tr>	
					<th><%=TdiveActivity.ALIAS_ADDR_ID%></th>	
					<td>
					<input class="span2" name="addrId" type="text" class="span2"/>
					</td>							
					<th><%=TdiveActivity.ALIAS_END_ADDR%></th>	
					<td>
					<input class="span2" name="endAddr" type="text" class="span2"/>
					</td>							
				</tr>	
				<tr>	
					<th><%=TdiveActivity.ALIAS_DESCRIPTION%></th>	
					<td>
					<input class="span2" name="description" type="text" class="span2"/>
					</td>							
					<th><%=TdiveActivity.ALIAS_STATUS%></th>	
					<td>
					<input class="span2" name="status" type="text" class="span2"/>
					</td>							
				</tr>	
				<tr>	
					<th><%=TdiveActivity.ALIAS_STAMP%></th>	
					<td>
					<input class="span2" name="stamp" type="text" class="span2"/>
					</td>							
					<th><%=TdiveActivity.ALIAS_ADDTIME%></th>	
					<td>
					<input class="span2" name="addtime" type="text" onclick="WdatePicker({dateFmt:'<%=TdiveActivity.FORMAT_ADDTIME%>'})"  maxlength="0" class="" />
					</td>							
				</tr>	
			</table>		
		</form>
	</div>
</div>