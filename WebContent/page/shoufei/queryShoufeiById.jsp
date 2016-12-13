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
function addTab(title, href){  
	debugger;
    var tt = window.parent.$('#mytabs');  
    if (tt.tabs('exists', title)){//如果tab已经存在,则选中并刷新该tab          
        tt.tabs('select', title);  
        refreshTab({tabTitle:title,url:href});  
    } else {  
         var content="";
         var width = tt.width();
         var height = tt.height();
        if (href){  
            content = '<iframe scrolling="yes" frameborder="0" src="'+href+'" style="width:'+width+'px;height:'+height+'px;"></iframe>';  
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
    }  
}
</script>
</head>
<body>
<form id="shoufeiForm" method="post">
	<table class="table">
		<tr>
			<td colspan="4" align="center"><h1>占陇镇占陈幼儿园教育收据   NO.${model.no }</h1></td>
		</tr>
		<tr>
			<td width=100>
				姓名
			</td>
			<td>
				<input class="easyui-textbox" style="width: 140px;" name="name" data-options="required:true" value="${model.name}" readonly="readonly">
				<input type="hidden" name="id" id="id" value="${model.id }">
			</td>
			<td width=100>
				班级
			</td>
			<td>
				<input class="easyui-textbox" style="width: 140px;" name="state" data-options="required:true" value="${model.state}" readonly="readonly"> 
			</td>
		</tr>
		<tr>
			<td width=100 >
				年度
			</td>
			<td>
				20<input class="easyui-numberbox" style="width: 40px;" name="year1" value="${model.year1}" data-options="required:true" readonly="readonly">-
				20<input class="easyui-numberbox" style="width: 40px;" name="year2" value="${model.year2}" data-options="required:true" readonly="readonly">第
				<input class="easyui-numberbox" style="width: 40px;" name="xueqi" value="${model.xueqi}" data-options="required:true" readonly="readonly">学期
			</td>
		</tr>
		<tr>
			<td>
				第一栏目类型
			</td>
			<td>
				<select name="type1" class="easyui-combobox" style="width: 150px;"  readonly="readonly"
				data-options="value:'${model.type1}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=type1',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true">
				</select>
			</td>
			<td>
				第一栏目费用
			</td>
			<td>
				<input class="easyui-numberbox" style="width: 80px;" name="price1" data-options="required:true"  value="${model.price1}" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td>
				第二栏目类型
			</td>
			<td>
				<select name="type2" class="easyui-combobox" style="width: 150px;"  readonly="readonly"
				data-options="value:'${model.type2}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=type2',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true">
				</select>
			</td>
			<td>
				第二栏目费用
			</td>
			<td>
				<input class="easyui-numberbox" style="width: 80px;" name="price2" value="${model.price2}" data-options="required:true" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td>
				备注
			</td>
			<td colspan="3">
				<input class="easyui-textbox" style="width: 200px;" name="remark" value="${model.remark}"  readonly="readonly">
			</td>
		</tr>
		<tr>
			<td>
				电话
			</td>
			<td colspan="3">
				<select name="mobile" class="easyui-combobox" style="width: 150px;" readonly="readonly"
				data-options="value:'${model.mobile}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=mobile',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true">
				</select>
			</td>
		</tr>
		<tr>
			<td>
				开票人
			</td>
			<td>
				<input class="easyui-textbox" style="width: 140px;" name="kaipiaoren" value="${model.kaipiaoren}" data-options="required:true" readonly="readonly">
			</td>
		
			<td>
				收款人
			</td>
			<td colspan="3">
				<input class="easyui-textbox" style="width: 140px;" name="shoukuanren" value="${model.shoukuanren}" data-options="required:true" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td></td>
			<td><a href="javascript:void(0)" class="easyui-linkbutton" style="width: 140px;" onclick="addTab('打印', '${spath }shoufei.do/dayin.do?id=${model.id}')">打印</a>  </td>
			<td><a href="${spath }page/shoufei/queryShoufei.jsp" class="easyui-linkbutton" style="width: 140px;">返回</a> </td>
			<td></td>
		</tr>
	</table>
</form>
</body>
</html>