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
	$('#shoufeiList').datagrid('options').queryParams = data;  
    $("#shoufeiList").datagrid('reload'); 
}

function formattercz(val, row){
	var edit = "<a href='${spath }shoufei.do/toAddOrEditShoufei.do?stuId="+row.stuId+"'>修改</a>";
	var look = "<a href='${spath }shoufei.do/queryById.do?id="+val+"'>查看</a>";
	var del = "<a href='javascript:void(0);' onclick='del("+val+")'>删除</a>";
	return edit+"&nbsp;&nbsp;"+look+"&nbsp;&nbsp;"+del;
}

function del(id){
	if(confirm("确定删除此记录么？")){
		$.ajax({
			url:'${spath }shoufei.do/delById.do',
			data:{id:id},
			type:'post',
			dataType:'json',
			success:function(data){
				if(data==1){
					alert("删除成功");
					$('#shoufeiList').datagrid('reload');
				}else{
					alert("删除失败");
				}
			}
		});
	}
}
</script>
</head>
<body>
<div style="display: inline-block;width:90%;">
	<table id="shoufeiList" class="easyui-datagrid" style="width:100%;min-height:400px;"
        data-options="url:'${spath }shoufei.do/queryList.do',pagination:true,autoRowHeight:true,toolbar:'#toolbar'">
	    <thead>
	        <tr>
	        	<th data-options="field:'no',width:100,align:'center'">单据编号</th> 
	            <th data-options="field:'name',width:120,align:'center'">姓名</th>
	            <th data-options="field:'stuId',width:120,align:'center'">姓名</th>
	            <th data-options="field:'state',width:50,align:'center'">班级</th>
	            <th data-options="field:'year1',width:50,align:'center'">年度</th>
	            <th data-options="field:'year2',width:50,align:'center'">年度</th>
	            <th data-options="field:'xueqi',width:100,align:'center'">学期</th>
	            <th data-options="field:'total',width:100,align:'center'">总额</th>
	            <th data-options="field:'kaipiaoren',width:100,align:'center'">开票人</th>
	            <th data-options="field:'shoukuanren',width:100,align:'center'">收款人</th>
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
			<td>单据编号:</td>
			<td><input class="easyui-textbox" type="text" name="no" /></td>
			<td></td>
		</tr>
		<tr>
			<td>年度:</td>
			<td>20<input class="easyui-numberbox" type="text" name="year1" style="width: 40px;"/>~20<input class="easyui-numberbox" type="text" name="year2" style="width: 40px;"/></td>
			<td>学期:</td>
			<td><input class="easyui-numberbox" type="text" name="xueqi" style="width: 40px;"/></td>
			<td><a href="#" class="easyui-linkbutton" onclick="searchData()" style="width:100px">查询</a> </td>
		</tr>
	</table>
</form>
</div>

</body>
</html>