<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-1.4.3/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-1.4.3/demo/demo.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script> 
<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.4.3/easyloader.js"></script> 
<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
function login(){
	$('#loginForm').form('submit',{
		onSubmit:function(){
			flag = $(this).form('validate');
			return flag;
		},
		success:function(data){
			if(data==1){
				alert("登录成功");
				window.location.href="<%=basePath %>common/index.jsp";
			}else{
				alert("登录失败");
			}
		}
	})
}
</script>
</head>
<body>
	<form id="loginForm" action="<%=basePath %>user.do/login.do" method="post">
		<div style="position:fixed;top:50%;left:50%;margin-top:-140px;margin-left:-140px;padding:20px;border:1px solid #000;border-radius:8px;width:240px;height:140px;">
			<div style="margin-bottom:15px;">
				<label>员工编号:</label>
				<input class="easyui-textbox" name="userCode" data-options="required:true">
			</div>
			<div style="margin-bottom:25px;">
				<label>员工密码:</label>
				<input class="easyui-textbox" type="password" name="pwd" data-options="required:true">
			</div>
			<div style="text-align:center;">
				<a style="width:120px;" href="#" class="easyui-linkbutton"  onclick="login()">登录</a>
			</div>
		</div>
	</form>
</body>
</html>