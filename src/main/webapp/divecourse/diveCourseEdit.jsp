<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveCourse" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/diveCourseController/edit',
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
				<input type="hidden" name="id" value = "${diveCourse.id}"/>
			<table class="table table-hover table-condensed">
				<tr>	
					<th><%=TdiveCourse.ALIAS_TITLE%></th>	
					<td>
					<input class="span2" name="title" type="text" class="span2"  value="${diveCourse.title}"/>
					</td>							
					<th><%=TdiveCourse.ALIAS_COURSE_TYPE%></th>	
					<td>
					<input class="span2" name="courseType" type="text" class="span2"  value="${diveCourse.courseType}"/>
					</td>							
			</tr>	
				<tr>	
					<th><%=TdiveCourse.ALIAS_ICON%></th>	
					<td>
					<input class="span2" name="icon" type="text" class="span2"  value="${diveCourse.icon}"/>
					</td>							
					<th><%=TdiveCourse.ALIAS_PRICE%></th>	
					<td>
					<input class="span2" name="price" type="text" class="span2"  value="${diveCourse.price}"/>
					</td>							
			</tr>	
				<tr>	
					<th><%=TdiveCourse.ALIAS_CONTENT%></th>	
					<td>
					<input class="span2" name="content" type="text" class="span2"  value="${diveCourse.content}"/>
					</td>							
					<th><%=TdiveCourse.ALIAS_INTRODUCE%></th>	
					<td>
					<input class="span2" name="introduce" type="text" class="span2"  value="${diveCourse.introduce}"/>
					</td>							
			</tr>	
				<tr>	
					<th><%=TdiveCourse.ALIAS_FILE_PATH%></th>	
					<td>
					<input class="span2" name="filePath" type="text" class="span2"  value="${diveCourse.filePath}"/>
					</td>							
					<th><%=TdiveCourse.ALIAS_STATUS%></th>	
					<td>
					<input class="span2" name="status" type="text" class="span2"  value="${diveCourse.status}"/>
					</td>							
			</tr>	
				<tr>	
					<th><%=TdiveCourse.ALIAS_ADDTIME%></th>	
					<td>
					<input class="span2" name="addtime" type="text" onclick="WdatePicker({dateFmt:'<%=TdiveCourse.FORMAT_ADDTIME%>'})"   maxlength="0" value="${diveCourse.addtime}"/>
					</td>							
			</tr>	
			</table>				
		</form>
	</div>
</div>