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


function searchData(index,row){
	if(row.id!=''){
		$('#dataList').datagrid({
			url:'${spath }data.do/selectData.do?pId='+row.id
		});
		
	}
}


function insertData(pId){
	$('#id').val("");
	$('#DDForm').form('reset');
	var rows = $('#pdataList').datagrid('getSelected');
	if(rows!=null){
		$('#pId').val(rows.id);
		$('#insertData').dialog({title:'新增字典',closed:false});
	}
}


function editData(){
	$('#DDForm').form('reset');
	var rows = $('#dataList').datagrid('getSelected');
	if(rows!=null){
		$('#insertData').dialog({title:'修改字典',closed:false});
		$('#DDForm').form('load','${spath }data.do/selectDataById.do?id='+rows.id);
	}
}

function delData(){
	var rows = $('#dataList').datagrid('getSelected');
	if(rows!=null){
		if(confirm('确定删除此字典')){
			$.ajax({
				url:'${spath }data.do/delById.do',
				data:{id:rows.id},
				type:'post',
				dataType:'json',
				success:function(data){
					if(data==1){
						alert("删除成功");
						$('#dataList').datagrid('reload');
					}else{
						alert("删除失败");
					}
				}
			});
		}
	}
}



function saveDD(){
	var id = $('#id').val();
	$('#DDForm').form('submit',{
		onSubmit: function(){
	        var dataName = $('#dataName').val();
	        var rows = $('#dataList').datagrid('getRows');
	        for(var i = 0;i<rows.length;i++){
	        	if(rows[i].dataName==dataName){
	        		alert("数据字典已重复");
	        		return false;
	        	}
	        }
	        return true;
	    },
		success:function(res){
			if(res==1 ){
				if(id==''){
					alert('新增成功');
				}else{
					alert('更新成功');
				}
				$('#insertData').dialog('close');
				$('#dataList').datagrid('reload');
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
<div style="display: inline-block;width:90%;">
	<table id="pdataList" class="easyui-datagrid" style="width:100%;min-height:300px;"
        data-options="url:'${spath }data.do/selectdata.do',autoRowHeight:true,
        	fitColumns:false,
			singleSelect:true,
			pagination:true,
			checkOnSelect:true,
			selectOnCheck:true,
			idField:'id',
			onClickRow:searchData">
	    <thead>
	        <tr>
	        	<th data-options="field:'id',width:100,align:'center',hidden:'true'">id</th>
	        	<th data-options="field:'dataName',width:200,align:'center'">数据名称</th>
	        	<th data-options="field:'dataCode',width:200,align:'center'">数据编码</th>
	        </tr>
	    </thead>
	</table>
</div>


<div style="display: inline-block;width:90%;">
	<table id="dataList" class="easyui-datagrid" style="width:100%;min-height:300px;"
        data-options="url:'',pagination:true,autoRowHeight:true,toolbar:'#toolbar'">
	    <thead>
	        <tr>
	        	<th data-options="field:'id',width:100,align:'center',hidden:'true'">id</th>
	        	<th data-options="field:'pId',width:100,align:'center',hidden:'true'">pid</th>
	        	<th data-options="field:'dataName',width:200,align:'center'">数据名称</th>
	        	<th data-options="field:'dataCode',width:200,align:'center'">数据编码</th>
	        </tr>
	    </thead>
	</table>
</div>

<div id="toolbar">
<form id="searchForm">
	<table>
		<tr>
			<td><a href="#" class="easyui-linkbutton" onclick="insertData()" style="width:100px">新增</a> </td>
			<td><a href="#" class="easyui-linkbutton" onclick="editData()" style="width:100px">修改</a> </td>
			<td><a href="#" class="easyui-linkbutton" onclick="delData()" style="width:100px">删除</a> </td>
		</tr>
	</table>
</form>
</div>


<div class="easyui-dialog" id="insertData" style="width: 500px;height:200px"  data-options="title:'新增字典',closed:true"
		buttons="#dlg-buttonsD">
	<form id="DDForm" method="post" action="${spath }data.do/insertData.do">
	<input type="hidden" name="pId" id="pId">
	<input type="hidden" name="id" id="id">
		<ul>
			<li><span style="display:inline-block;width:100px;">数据名称:</span><input type="text" name="dataName" id="dataName" class="easyui-textbox" data-options="required:true"></li>
			<li><span style="display:inline-block;width:100px;">数据编码:</span><input type="text" name="dataCode" id="dataCode" class="easyui-textbox" data-options="required:true"></li>
		</ul>
	</form>		
</div>
<div id="dlg-buttonsD">
	<a href="javascript:void(0)" class="easyui-linkbutton" style="width: 70px;margin:10px;" onClick="saveDD()">保存</a> 
	<a href="javascript:void(0)" class="easyui-linkbutton" style="width: 70px;margin:10px;" onClick="javascript:$('#insertData').dialog('close')">关闭</a> 
</div>

</body>
</html>