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
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/common.css">
<script type="text/javascript">
$(function(){
	using("tabs", function () {
		$("#mytabs").tabs({ 
			width:$("#mytabs").parent().width(), 
			height:$("#mytabs").parent().height() 
		});
    });
	ajaxGetMenus();
	getTree(1);	
})


function getTree(id){
	if(id==undefined){
		alert('无效链接');
		return false;
	}else{
		$("#tree").tree({
			url:'<%=basePath %>menu.do/selectHmenusList.do?vId='+id,
			animate: true,
			checkbox: false,
			lines:false,
			onClick:function(node){
				if(node.url!=undefined){
					addTab(node.text,node.url);
				}
			}
		})
	}
}


function ajaxGetMenus(){
	$.ajax({
		url:'<%=basePath %>menu.do/selectMenusList.do',
		type:'get',
		data:{type:'v'},
		dataType:'json',
		success:function(data){
			var html='';
			if(data!=null){
				$.each(data,function(i,n){
					html=html+"<a href='#' class='easyui-linkbutton' data-options='width:100' onclick='getTree("+n.id+")'>"+n.name+"</a>";
				})
			}
			$('#vMenus').append(html);
			//debugger;
			$('#vMenus a').linkbutton({});
		}
	})
}

function addTab(title, href){  
    var tt = $('#mytabs');  
    //if (tt.tabs('exists', title)){//如果tab已经存在,则选中并刷新该tab          
    //    tt.tabs('select', title);  
    //    refreshTab({tabTitle:title,url:href});  
    //} else {  
         var content="";
         var width = $("#mytabs").width()-5;
         var height = $("#mytabs").height()-35;
        if (href){  
            content = '<iframe scrolling="yes" frameborder="0" src="<%=basePath%>'+href+'" style="width:'+width+'px;height:'+height+'px;"></iframe>';  
        } else {  
            content = '未实现';  
        }  
        tt.tabs('add',{  
            title:title,  
            closable:true,  
            content:content,  
            /* iconCls:'icon-default', */
            width: width,
            height: "auto"  
        });  
    //}  
}

function refreshTab(cfg){  
    var refresh_tab = cfg.tabTitle?$('#mytabs').tabs('getTab',cfg.tabTitle):$('#mytabs').tabs('getSelected');  
    if(refresh_tab && refresh_tab.find('iframe').length > 0){  
    var _refresh_ifram = refresh_tab.find('iframe')[0];  
    var refresh_url = cfg.url?cfg.url:_refresh_ifram.src;  
    //_refresh_ifram.src = refresh_url;  
    _refresh_ifram.contentWindow.location.href="<%=basePath%>"+refresh_url;  
    }  
}  

</script>
</head>
<body>
	<div class="easyui-layout"  data-options="fit:true">
	    <div data-options="region:'north',collapsible:false" style="height:13%;">
	    	<div class="easyui-panel" style="position:absolute;bottom:0;padding:5px;padding-left:20px;" id="vMenus">
		        <a href="#" class="easyui-linkbutton" data-options="width:100" onclick="">首页</a>
		        <a href="#" class="easyui-linkbutton" data-options="width:100" onclick="addTab('数据字典维护','data.do/toData.do')">基础数据管理</a> 
		        <a href="#" class="easyui-linkbutton" data-options="width:100" onclick="addTab('中转英','fanyi.do/toCNtoEn.do')">中转英</a>
		        <a href="#" class="easyui-linkbutton" data-options="width:100" onclick="addTab('英转中','fanyi.do/toEntoCN.do')">英转中</a>
		    </div>
	    </div>
	    <div id="cc" data-options="region:'center'" style="background:#eee;width:100%;">
	    	<div id="mytabs" class="easyui-tabs"></div>
	    </div>
	</div>
</body>


</html>