<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath();
	String spath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setAttribute("spath", spath);
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=spath %>js/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=spath %>js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=spath %>js/jquery-easyui-1.4.3/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=spath %>js/jquery-easyui-1.4.3/demo/demo.css">
<script type="text/javascript" src="<%=spath%>js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=spath%>js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script> 
<script type="text/javascript" src="<%=spath %>js/jquery-easyui-1.4.3/easyloader.js"></script> 
<script type="text/javascript" src="<%=spath %>js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=spath %>css/common.css">
<script type="text/javascript">
var basePath ='<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"%>';
</script>
</head>
<body>

</body>
</html>