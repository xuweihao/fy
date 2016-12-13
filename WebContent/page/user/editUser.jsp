<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table td {
 height:40px;
 padding-left:10px;
}
</style>
<script type="text/javascript">
function save(){
	var url="${spath }user.do/edit.do";
	$('#userForm').form('submit',{
		url:url,
		onSubmit:function(){
			flag = $(this).form('validate');
			return flag;
		},		
		success:function(data){
			if(data!=0){
				alert("修改成功");
				window.parent.location.href="${spath }user.do/logout.do";
			}else{
				alert("修改失败");
			}
		}
	})
}
</script>
</head>
<body>
<form id="userForm" method="post">
	<table class="table">
		<tr>
			<td width=100>
				姓名
			</td>
			<td>
				<input class="easyui-textbox" style="width: 140px;" name="name" data-options="required:true" value="${model.name}">
				<input type="hidden" name="id" id="id" value="${model.id }">
			</td>
		</tr>
		<tr>
			<td width=100>
				用户名
			</td>
			<td>
				<input class="easyui-textbox" style="width: 140px;" name="userCode" data-options="required:true" value="${model.userCode}"> 
			</td>
		</tr>
		<tr>
			<td width=100>
				密码
			</td>
			<td>
				<input class="easyui-textbox" type="password" style="width: 140px;" name="pwd" data-options="required:true" value="${model.pwd}"> 
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<a href="#" class="easyui-linkbutton" style="width: 140px;" onclick="save()">修改</a>  
			</td>
		</tr>
	</table>
</form>
</body>
</html>