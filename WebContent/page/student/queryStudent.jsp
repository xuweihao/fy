<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
(function($){  
    $.fn.serializeJson=function(){  
        var serializeObj={};  
        var array=this.serializeArray();  
        var str=this.serialize();  
        $(array).each(function(){  
            if(serializeObj[this.name]){  
                if($.isArray(serializeObj[this.name])){  
                    serializeObj[this.name].push(this.value);  
                }else{  
                    serializeObj[this.name]=[serializeObj[this.name],this.value];  
                }  
            }else{  
                serializeObj[this.name]=this.value;   
            }  
        });  
        return serializeObj;  
    };  
})(jQuery);


function formatterdate(val, row) {
	if (val != null) {
		var date = new Date(val);
		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
		+ date.getDate();
	}
}

function searchData(){
	var data = $("#searchForm").serializeJson(); 
	$('#stuList').datagrid('options').queryParams = data;  
    $("#stuList").datagrid('reload'); 
}

function formattercz(val, row){
	var edit = "<a href='javascript:void(0);' onclick='editData("+val+")'>修改</a>";
	var shoufei = "<a href='${spath }shoufei.do/toAddOrEditShoufei.do?stuId="+val+"'>收据</a>";
	var del = "<a href='javascript:void(0);' onclick='del("+val+")'>删除</a>";
	return edit+"&nbsp;&nbsp;"+shoufei+"&nbsp;&nbsp;"+del;
}

function del(id){
	if(confirm("确定删除此记录么？")){
		$.ajax({
			url:'${spath }stu.do/delById.do',
			data:{id:id},
			type:'post',
			dataType:'json',
			success:function(data){
				if(data==1){
					alert("删除成功");
					$('#stuList').datagrid('reload');
				}else{
					alert("删除失败");
				}
			}
		});
	}
}


function insertData(){
	$('#DDForm').form('reset');
	$('#insertData').dialog({title:'新增学生',closed:false});
}


function editData(id){
	$('#DDForm').form('reset');
	$('#insertData').dialog({title:'修改学生',closed:false});
	$('#DDForm').form('load','${spath }stu.do/selectStuById.do?id='+id);
}


function saveDD(){
	var id = $('#id').val();
	$('#DDForm').form('submit',{
		success:function(res){
			debugger;
			if(res==1 ){
				if(id==''){
					alert('新增成功');
				}else{
					alert('更新成功');
				}
				$('#insertData').dialog('close');
				$('#stuList').datagrid('reload');
			}else{
				if(res==2){
					alert("已存在，新增失败");
				}else{
					if(id==''){
						alert('新增失败');
					}else{
						alert('更新失败');
					}
				}
			}
		}
	})
}

function resetForm(){
	$('#searchForm').form('reset');
}

function formatterNO(val, row){
	if(row.sf){
		return row.sf.no;
	}else{
		return '';
	}
	
}

function formatterTotal(val, row){
	if(row.sf){
		return row.sf.total;
	}else{
		return '';
	}
}
</script>
</head>
<body>
<div style="display: inline-block;width:90%;">
	<table id="stuList" class="easyui-datagrid" style="width:100%;min-height:400px;"
        data-options="url:'${spath }stu.do/queryList.do',pagination:true,autoRowHeight:true,toolbar:'#toolbar'">
	    <thead>
	        <tr>
	        	<th data-options="field:'sf',width:120,align:'center',hidden:'true'"></th>
	            <th data-options="field:'name',width:120,align:'center'">姓名</th>
	            <th data-options="field:'state',width:50,align:'center'">年级</th>
	            <th data-options="field:'parentName',width:50,align:'center'">父母</th>
	            <th data-options="field:'className',width:50,align:'center'">班级</th>
	            <th data-options="field:'year1',width:50,align:'center'">年度</th>
	            <th data-options="field:'year2',width:50,align:'center'">年度</th>
	            <th data-options="field:'xueqi',width:100,align:'center'">学期</th>
	            <th data-options="field:'no',width:100,align:'center',formatter:formatterNO">收据编号</th>
	            <th data-options="field:'total',width:100,align:'center',formatter:formatterTotal">总额</th>
	            <th data-options="field:'createDate',width:100,align:'center',formatter:formatterdate">创建时间</th>
	            <th data-options="field:'id',width:100,align:'center',formatter:formattercz">操作</th>
	        </tr>
	    </thead>
	</table>
</div>

<div id="toolbar">
<form id="searchForm">
	<table>
		<tr>
			<td>姓名:</td>
			<td><input class="easyui-textbox" type="text" name="name" /></td>
			<td>父母名称:</td>
			<td><input class="easyui-textbox" type="text" name="parentName" /></td>
			<td>年级：</td>
				<td><select name="state" class="easyui-combobox" style="width: 100px;"
				data-options="
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=state',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				panelHeight:'auto'">
				</select></td>
			<td>班级：</td>
				<td><select name="className" class="easyui-combobox" style="width: 100px;"
				data-options="
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=className',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				panelHeight:'auto'">
				</select></td>
		</tr>
		<tr>
			<td>年度:</td>
			<td>20<input class="easyui-numberbox" type="text" name="year1" style="width: 40px;"/>~20<input class="easyui-numberbox" type="text" name="year2" style="width: 40px;"/></td>
			<td>学期:</td>
			<td><input class="easyui-numberbox" type="text" name="xueqi" style="width: 40px;"/></td>
			<td>是否收费：</td>
			<td><input type="checkbox" name="sfsf" value="1">否</td>
			<td>
				<a href="#" class="easyui-linkbutton" onclick="searchData()" style="width:100px">查询</a> 
			</td>
			<td>
				<a href="#" class="easyui-linkbutton" onclick="resetForm()" style="width:100px">重置</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#" class="easyui-linkbutton" onclick="insertData()" style="width:100px">新增</a>
			</td>
		</tr>
	</table>
</form>
</div>


<div class="easyui-dialog" id="insertData" style="width: 500px;height:300px"  data-options="title:'新增字典',closed:true"
		buttons="#dlg-buttonsD">
	<form id="DDForm" method="post" action="${spath }stu.do/insertStu.do">
	<input type="hidden" name="id" id="id">
		<table>
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="name" class="easyui-textbox" data-options="required:true"></td>
			</tr>
			<tr>
				<td>父母：</td>
				<td><input type="text" name="parentName" class="easyui-textbox" data-options="required:true"></td>
			</tr>
			<tr>
				<td>年度1：</td>
				<td><input type="text" name="year1" class="easyui-textbox" data-options="required:true"></td>
			</tr>
			<tr>
				<td>年度2：</td>
				<td><input type="text" name="year2" class="easyui-textbox" data-options="required:true"></td>
			</tr>
			<tr>
				<td>学期：</td>
				<td><select name="xueqi" class="easyui-combobox" style="width: 80px;"
				data-options="
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=xueqi',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto'">
				</select></td>
			</tr>
			<tr>
				<td>年级：</td>
				<td><select name="state" class="easyui-combobox" style="width: 100px;"
				data-options="
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=state',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto'">
				</select></td>
			</tr>
			<tr>
				<td>班级：</td>
				<td><select name="className" class="easyui-combobox" style="width: 80px;"
				data-options="
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=className',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto'">
				</select></td>
			</tr>
		</table>
	</form>		
</div>
<div id="dlg-buttonsD">
	<a href="javascript:void(0)" class="easyui-linkbutton" style="width: 70px;margin:10px;" onClick="saveDD()">保存</a> 
	<a href="javascript:void(0)" class="easyui-linkbutton" style="width: 70px;margin:10px;" onClick="javascript:$('#insertData').dialog('close')">关闭</a> 
</div>


</body>
</html>