<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveTravel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%>  
<script type="text/javascript">
	var editor;
	$(function() {
		window.setTimeout(function() {
			editor = KindEditor.create('#description', {
				width : '580px',
				height : '300px',
				items : [ 'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste', 'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript', 'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/', 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak', 'anchor', 'link', 'unlink' ],
				uploadJson : '${pageContext.request.contextPath}/fileController/upload',
				fileManagerJson : '${pageContext.request.contextPath}/fileController/fileManage',
				allowFileManager : true
			});
		}, 1);
		parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/diveTravelController/add',
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				}
				editor.sync();
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
	<div data-options="region:'center',border:false" title=""
		style="overflow: auto;">
		<form id="form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" />
			<table class="table table-hover table-condensed">
				<tr>
					<th><%=TdiveTravel.ALIAS_NAME%></th>
					<td><input class="span2" name="name" type="text" />
					</td>
					<th><%=TdiveTravel.ALIAS_ICON%></th>
					<td><input class="span2" name="iconFile" type="file" />
					</td>
				</tr>
				<tr>
					<th><%=TdiveTravel.ALIAS_AREA%></th>
					<td>
						<jb:select dataType="AR" name="area"></jb:select>
					</td>
					<th><%=TdiveTravel.ALIAS_FEATURE%></th>
					<td>
						<jb:select dataType="FT" name="feature"></jb:select>
					</td>
				</tr>
				<tr>
					<th><%=TdiveTravel.ALIAS_PRICE%></th>
					<td><input class="span2" name="price" type="text"
						class="span2" /></td>
					<th><%=TdiveTravel.ALIAS_STATUS%></th>
					<td><input class="span2" name="status" type="text"
						class="span2" /></td>
				</tr>
				<tr>
					<th><%=TdiveTravel.ALIAS_ADDTIME%></th>
					<td colspan="3"><input class="span2" name="addtime" type="text"
						onclick="WdatePicker({dateFmt:'<%=TdiveTravel.FORMAT_ADDTIME%>'})"
						maxlength="0" class="" /></td>
				</tr>
				<tr>
					<th><%=TdiveTravel.ALIAS_SUMARY%></th>
					<td colspan="3">
						<textarea style="width: 500px;" name="sumary"></textarea>
					</td>
				</tr>
				<tr>
					<th><%=TdiveTravel.ALIAS_DESCRIPTION%></th>
					<td colspan="3">
						<textarea  name="description" id="description" style="height:180px;visibility:hidden;"></textarea>
					</td>	
				</tr>
			</table>
		</form>
	</div>
</div>