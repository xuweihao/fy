<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="../../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=spath%>js/autocomplete.min.js"></script>
<script type="text/javascript">
function searchData(value,name){  
    $('#pdataList').datagrid('load', { "type": name, "english": value });  
    //${spath }data.do/selectdata.do
}

function insertFy(){
	$('#id').val("");
	$('#fyForm').form('reset');
	$('#insertFy').dialog({title:'新增翻译词典',closed:false});
}

function editFy(){
	//$('#id').val("");
	$('#fyForm').form('reset');
	var rows = $('#pdataList').datagrid('getSelected');
	if(rows!=null){
		$('#insertFy').dialog({title:'修改字典',closed:false});
		$('#fyForm').form('load','${spath }fanyi.do/selectfanyiById.do?id='+rows.id);
	}
}

function savefy(){
	var id = $('#id').val();
	$('#fyForm').form('submit',{
		success:function(res){
			if(res==1 ){
				if(id==''){
					alert('新增成功');
				}else{
					alert('更新成功');
				}
				$('#insertFy').dialog('close');
				$('#pdataList').datagrid('reload');
			}else{
				if(id==''){
					alert('新增失败');
				}else{
					alert('更新失败');
				}
			}
		}
	})
}


</script>
</head>
<body>
<div>

	<table id="pdataList" class="easyui-datagrid" style="width:100%;min-height:400px;"
        data-options="url:'${spath }fanyi.do/toSeachEntoCn.do',autoRowHeight:true,
        	fitColumns:false,
			singleSelect:true,
			checkOnSelect:true,
			selectOnCheck:true,
			idField:'id',
			toolbar:'#toolbar'">
	    <thead>
	        <tr>
	        	<th data-options="field:'id',width:100,align:'center',hidden:'true'">id</th>
	        	<th data-options="field:'english',width:200,align:'center'">英文</th>
	        	<th data-options="field:'chinese',width:200,align:'center'">中文</th>
	        	<th data-options="field:'example',width:400,align:'center'">例子</th>
	        	<th data-options="field:'type',width:100,align:'center'">类型</th>
	        </tr>
	    </thead>
	 </table>
</div>
<div id="toolbar" >
<form id="searchForm">
	<table>
		<tr>
			<td style="padding:10px 0px;"><a href="#" class="easyui-linkbutton" onclick="insertFy()" style="width:100px">新增</a> </td>
			<td><a href="#" class="easyui-linkbutton" onclick="editFy()" style="width:100px">修改</a> </td>
			<td><a href="#" class="easyui-linkbutton" onclick="delData()" style="width:100px">删除</a> </td>
		</tr>
		<tr>
			<td colspan="3"  style="padding:10px 0px;" class="ss">
				<input id="searchBox" class="easyui-searchbox" searcher="searchData"  data-options="menu:'#mm'"  
            			prompt="请输入查询内容" style="width:350px"/>
            </td>
            
		</tr>
	</table>
</form>
</div>
<div id="mm" style="width:100px">
	<c:forEach items="${list }" var="item" varStatus="index">
		<c:if test="${index.index+1==1 }">
			<div data-options="name:'${item.dataName }',selected:true">${item.dataName }</div>
		</c:if>
		<c:if test="${index.index+1!=1 }">
			<div data-options="name:'${item.dataName }'">${item.dataName }</div>
		</c:if>
	</c:forEach>
</div>

<div class="easyui-dialog" id="insertFy" style="width: 400px;height:230px"  data-options="title:'新增字典',closed:true"
		buttons="#dlg-buttonsD">
	<form id="fyForm" method="post" action="${spath }fanyi.do/insertWord.do">
	<input  type="hidden" name="id" id="id">
	<table style="margin-top:10px;">
		<tr>
			<td>英文:</td>
			<td><input type="text" name="english" id="english" class="easyui-textbox" data-options="required:true"></td>
		</tr>
		<tr>
			<td>中文:</td>
			<td><input type="text" name="chinese" id="chinese" class="easyui-textbox" data-options="required:true"></td>
		</tr>
		<tr>
			<td>类型:</td>
			<td>
				<select name="type" class="easyui-combobox" 
				data-options="value:'${model.state}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=type',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto',
				width:150">
				</select>
			</td>
		</tr>
		<tr>
			<td>例子:</td>
			<td>
				<input type="text" name="example" id="example" class="easyui-textbox" data-options="required:true" style="width: 200px;">
			</td>
		</tr>
	</table>
	</form>		
</div>
<div id="dlg-buttonsD">
	<a href="javascript:void(0)" class="easyui-linkbutton" style="width: 70px;margin:10px;" onClick="savefy()">保存</a> 
	<a href="javascript:void(0)" class="easyui-linkbutton" style="width: 70px;margin:10px;" onClick="javascript:$('#insertFy').dialog('close')">关闭</a> 
</div>
</body>
</html>