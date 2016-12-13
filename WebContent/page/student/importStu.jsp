<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../../common/common.jsp" %>
     <%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function importFile(){
	var arr = $('#file1').val().split('.');
	if(arr.length>1){
		if(arr[1]!="xlsx"){
			alert("请用模板上传");
		}else{
			$('#fileForm').submit();
		}
	}else{
		alert("请用模板上传");
	}
}

</script>
</head>
<body>
	<div>
		<table>
			<tr>
				<td width="50" height="40">模板</td>
				<td><a href="${spath }importExcel/xuesheng.xlsx" >学生花名册模板下载</a></td>
			</tr>
			<tr>
				<td>上传</td>
				<td>
				<form action="${spath }stu.do/importFile.do" id="fileForm" method="post" enctype="multipart/form-data" >
					<input type="file" name="file1" id="file1" >
					<a href="#" class="easyui-linkbutton" onclick="importFile()" style="width:100px">上传</a>
				</form>
				</td>
			</tr>
		</table>
	</div>
	<div>
	<c:if test="${state==1 }">
	新增成功
	</c:if>
	<c:if test="${state==0 }">
	新增失败
	</c:if>
	${msg }
	</div>
</body>
</html>