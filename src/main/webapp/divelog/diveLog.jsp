<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.model.TdiveLog"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>DiveLog管理</title>
<jsp:include page="../inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceList, '/diveLogController/editPage')}">
	<script type="text/javascript">
		$.canEdit = true;
	</script>
</c:if>
<c:if
	test="${fn:contains(sessionInfo.resourceList, '/diveLogController/delete')}">
	<script type="text/javascript">
		$.canDelete = true;
	</script>
</c:if>
<c:if
	test="${fn:contains(sessionInfo.resourceList, '/diveLogController/view')}">
	<script type="text/javascript">
		$.canView = true;
	</script>
</c:if>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${pageContext.request.contextPath}/diveLogController/dataGrid',
			fit : true,
			fitColumns : true,
			border : false,
			pagination : true,
			idField : 'id',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50 ],
			sortName : 'id',
			sortOrder : 'desc',
			checkOnSelect : false,
			selectOnCheck : false,
			nowrap : false,
			striped : true,
			rownumbers : true,
			singleSelect : true,
			columns : [ [ {
				field : 'id',
				title : '编号',
				width : 150,
				hidden : true
				}, {
				field : 'logType',
				title : '<%=TdiveLog.ALIAS_LOG_TYPE%>',
				width : 50		
				}, {
				field : 'fileSrc',
				title : '<%=TdiveLog.ALIAS_FILE_SRC%>',
				width : 50		
				}, {
				field : 'userId',
				title : '<%=TdiveLog.ALIAS_USER_ID%>',
				width : 50		
				}, {
				field : 'diveType',
				title : '<%=TdiveLog.ALIAS_DIVE_TYPE%>',
				width : 50		
				}, {
				field : 'diveDate',
				title : '<%=TdiveLog.ALIAS_DIVE_DATE%>',
				width : 50		
				}, {
				field : 'weather',
				title : '<%=TdiveLog.ALIAS_WEATHER%>',
				width : 50		
				}, {
				field : 'waterTemperature',
				title : '<%=TdiveLog.ALIAS_WATER_TEMPERATURE%>',
				width : 50		
				}, {
				field : 'seeing',
				title : '<%=TdiveLog.ALIAS_SEEING%>',
				width : 50		
				}, {
				field : 'inTime',
				title : '<%=TdiveLog.ALIAS_IN_TIME%>',
				width : 50		
				}, {
				field : 'outTime',
				title : '<%=TdiveLog.ALIAS_OUT_TIME%>',
				width : 50		
				}, {
				field : 'diveHeight',
				title : '<%=TdiveLog.ALIAS_DIVE_HEIGHT%>',
				width : 50		
				}, {
				field : 'diveWeith',
				title : '<%=TdiveLog.ALIAS_DIVE_WEITH%>',
				width : 50		
				}, {
				field : 'weatherTemperature',
				title : '<%=TdiveLog.ALIAS_WEATHER_TEMPERATURE%>',
				width : 50		
				}, {
				field : 'windPower',
				title : '<%=TdiveLog.ALIAS_WIND_POWER%>',
				width : 50		
				}, {
				field : 'gasStart',
				title : '<%=TdiveLog.ALIAS_GAS_START%>',
				width : 50		
				}, {
				field : 'gasEnd',
				title : '<%=TdiveLog.ALIAS_GAS_END%>',
				width : 50		
				}, {
				field : 'addtime',
				title : '<%=TdiveLog.ALIAS_ADDTIME%>',
				width : 50		
			}, {
				field : 'action',
				title : '操作',
				width : 100,
				formatter : function(value, row, index) {
					var str = '';
					if ($.canEdit) {
						str += $.formatString('<img onclick="editFun(\'{0}\');" src="{1}" title="编辑"/>', row.id, '${pageContext.request.contextPath}/style/images/extjs_icons/bug/bug_edit.png');
					}
					str += '&nbsp;';
					if ($.canDelete) {
						str += $.formatString('<img onclick="deleteFun(\'{0}\');" src="{1}" title="删除"/>', row.id, '${pageContext.request.contextPath}/style/images/extjs_icons/bug/bug_delete.png');
					}
					str += '&nbsp;';
					if ($.canView) {
						str += $.formatString('<img onclick="viewFun(\'{0}\');" src="{1}" title="查看"/>', row.id, '${pageContext.request.contextPath}/style/images/extjs_icons/bug/bug_link.png');
					}
					return str;
				}
			} ] ],
			toolbar : '#toolbar',
			onLoadSuccess : function() {
				$('#searchForm table').show();
				parent.$.messager.progress('close');

				$(this).datagrid('tooltip');
			}
		});
	});

	function deleteFun(id) {
		if (id == undefined) {
			var rows = dataGrid.datagrid('getSelections');
			id = rows[0].id;
		}
		parent.$.messager.confirm('询问', '您是否要删除当前数据？', function(b) {
			if (b) {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				$.post('${pageContext.request.contextPath}/diveLogController/delete', {
					id : id
				}, function(result) {
					if (result.success) {
						parent.$.messager.alert('提示', result.msg, 'info');
						dataGrid.datagrid('reload');
					}
					parent.$.messager.progress('close');
				}, 'JSON');
			}
		});
	}

	function editFun(id) {
		if (id == undefined) {
			var rows = dataGrid.datagrid('getSelections');
			id = rows[0].id;
		}
		parent.$.modalDialog({
			title : '编辑数据',
			width : 780,
			height : 500,
			href : '${pageContext.request.contextPath}/diveLogController/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#form');
					f.submit();
				}
			} ]
		});
	}

	function viewFun(id) {
		if (id == undefined) {
			var rows = dataGrid.datagrid('getSelections');
			id = rows[0].id;
		}
		parent.$.modalDialog({
			title : '查看数据',
			width : 780,
			height : 500,
			href : '${pageContext.request.contextPath}/diveLogController/view?id=' + id
		});
	}

	function addFun() {
		parent.$.modalDialog({
			title : '添加数据',
			width : 780,
			height : 500,
			href : '${pageContext.request.contextPath}/diveLogController/addPage',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#form');
					f.submit();
				}
			} ]
		});
	}
	function downloadTable(){
		var options = dataGrid.datagrid("options");
		var $colums = [];		
		$.merge($colums, options.columns); 
		$.merge($colums, options.frozenColumns);
		var columsStr = JSON.stringify($colums);
	    $('#downloadTable').form('submit', {
	        url:'${pageContext.request.contextPath}/diveLogController/download',
	        onSubmit: function(param){
	        	$.extend(param, $.serializeObject($('#searchForm')));
	        	param.downloadFields = columsStr;
	        	param.page = options.pageNumber;
	        	param.rows = options.pageSize;
	        	
       	 }
        }); 
	}
	function searchFun() {
		dataGrid.datagrid('load', $.serializeObject($('#searchForm')));
	}
	function cleanFun() {
		$('#searchForm input').val('');
		dataGrid.datagrid('load', {});
	}
</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
		<div data-options="region:'north',title:'查询条件',border:false"
			style="height: 160px; overflow: hidden;">
			<form id="searchForm">
				<table class="table table-hover table-condensed"
					style="display: none;">
					<tr>
						<th><%=TdiveLog.ALIAS_LOG_TYPE%></th>
						<td><input type="text" name="logType" maxlength="4"
							class="span2" /></td>
						<th><%=TdiveLog.ALIAS_FILE_SRC%></th>
						<td><input type="text" name="fileSrc" maxlength="256"
							class="span2" /></td>
						<th><%=TdiveLog.ALIAS_USER_ID%></th>
						<td><input type="text" name="userId" maxlength="36"
							class="span2" /></td>
						<th><%=TdiveLog.ALIAS_DIVE_TYPE%></th>
						<td><input type="text" name="diveType" maxlength="4"
							class="span2" /></td>
					</tr>
					<tr>
						<th><%=TdiveLog.ALIAS_DIVE_DATE%></th>
						<td><input type="text" class="span2"
							onclick="WdatePicker({dateFmt:'<%=TdiveLog.FORMAT_DIVE_DATE%>'})"
							id="diveDateBegin" name="diveDateBegin" /> <input type="text"
							class="span2"
							onclick="WdatePicker({dateFmt:'<%=TdiveLog.FORMAT_DIVE_DATE%>'})"
							id="diveDateEnd" name="diveDateEnd" /></td>
						<th><%=TdiveLog.ALIAS_WEATHER%></th>
						<td><input type="text" name="weather" maxlength="4"
							class="span2" /></td>
						<th><%=TdiveLog.ALIAS_WATER_TEMPERATURE%></th>
						<td><input type="text" name="waterTemperature" maxlength="12"
							class="span2" /></td>
						<th><%=TdiveLog.ALIAS_SEEING%></th>
						<td><input type="text" name="seeing" maxlength="12"
							class="span2" /></td>
					</tr>
					<tr>
						<th><%=TdiveLog.ALIAS_IN_TIME%></th>
						<td><input type="text" class="span2"
							onclick="WdatePicker({dateFmt:'<%=TdiveLog.FORMAT_IN_TIME%>'})"
							id="inTimeBegin" name="inTimeBegin" /> <input type="text"
							class="span2"
							onclick="WdatePicker({dateFmt:'<%=TdiveLog.FORMAT_IN_TIME%>'})"
							id="inTimeEnd" name="inTimeEnd" /></td>
						<th><%=TdiveLog.ALIAS_OUT_TIME%></th>
						<td><input type="text" class="span2"
							onclick="WdatePicker({dateFmt:'<%=TdiveLog.FORMAT_OUT_TIME%>'})"
							id="outTimeBegin" name="outTimeBegin" /> <input type="text"
							class="span2"
							onclick="WdatePicker({dateFmt:'<%=TdiveLog.FORMAT_OUT_TIME%>'})"
							id="outTimeEnd" name="outTimeEnd" /></td>
						<th><%=TdiveLog.ALIAS_DIVE_HEIGHT%></th>
						<td><input type="text" name="diveHeight" maxlength="12"
							class="span2" /></td>
						<th><%=TdiveLog.ALIAS_DIVE_WEITH%></th>
						<td><input type="text" name="diveWeith" maxlength="12"
							class="span2" /></td>
					</tr>
					<tr>
						<th><%=TdiveLog.ALIAS_WEATHER_TEMPERATURE%></th>
						<td><input type="text" name="weatherTemperature"
							maxlength="12" class="span2" /></td>
						<th><%=TdiveLog.ALIAS_WIND_POWER%></th>
						<td><input type="text" name="windPower" maxlength="12"
							class="span2" /></td>
						<th><%=TdiveLog.ALIAS_GAS_START%></th>
						<td><input type="text" name="gasStart" maxlength="12"
							class="span2" /></td>
						<th><%=TdiveLog.ALIAS_GAS_END%></th>
						<td><input type="text" name="gasEnd" maxlength="12"
							class="span2" /></td>
					</tr>
					<tr>
						<th><%=TdiveLog.ALIAS_ADDTIME%></th>
						<td><input type="text" class="span2"
							onclick="WdatePicker({dateFmt:'<%=TdiveLog.FORMAT_ADDTIME%>'})"
							id="addtimeBegin" name="addtimeBegin" /> <input type="text"
							class="span2"
							onclick="WdatePicker({dateFmt:'<%=TdiveLog.FORMAT_ADDTIME%>'})"
							id="addtimeEnd" name="addtimeEnd" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<table id="dataGrid"></table>
		</div>
	</div>
	<div id="toolbar" style="display: none;">
		<c:if
			test="${fn:contains(sessionInfo.resourceList, '/diveLogController/addPage')}">
			<a onclick="addFun();" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'bug_add'">添加</a>
		</c:if>
		<a href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'brick_add',plain:true" onclick="searchFun();">过滤条件</a><a
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'brick_delete',plain:true"
			onclick="cleanFun();">清空条件</a>
		<c:if
			test="${fn:contains(sessionInfo.resourceList, '/diveLogController/download')}">
			<a href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'server_go',plain:true"
				onclick="downloadTable();">导出</a>
			<form id="downloadTable" target="downloadIframe" method="post"
				style="display: none;"></form>
			<iframe id="downloadIframe" name="downloadIframe"
				style="display: none;"></iframe>
		</c:if>
	</div>
</body>
</html>