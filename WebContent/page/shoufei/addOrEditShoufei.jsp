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
	var url="${spath }shoufei.do/addOrEditShoufei.do";
	$('#shoufeiForm').form('submit',{
		url:url,
		onSubmit:function(){
			flag = $(this).form('validate');
			return flag;
		},		
		success:function(data){
			if(data!=0){
				if($('#id').val()!=""){
					alert("修改成功");
				}else{
					alert("新增成功");
				}
				window.location.href="${spath }shoufei.do/queryById.do?id="+data;
			}else{
				if($('#id').val()!=""){
					alert("修改失败");
				}else{
					alert("新增失败");
				}
			}
		}
	})
}
</script>
</head>
<body>
<form id="shoufeiForm" method="post">
	<table class="table">
		<tr>
			<td colspan="4" align="center"><h1>占陇镇占陈幼儿园教育收据</h1> NO.${model.no}</td>
		</tr>
		<tr>
			<td width=100>
				姓名
			</td>
			<td>
				<input class="easyui-textbox" style="width: 140px;" name="name" data-options="required:true" readonly="readonly" value="${model.name}">
				<input type="hidden" name="no" value="${model.no }">
				<input type="hidden" name="id" id="id" value="${model.id }">
				<input type="hidden" name="stuId" id="stuId" value="${model.stuId }">
			</td>
			<td width=100>
				班级
			</td>
			<td>
				<select name="state" class="easyui-combobox" style="width: 100px;" readonly="readonly"
				data-options="value:'${model.state}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=state',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto'">
				</select>
				<select name="className" class="easyui-combobox" style="width: 40px;" readonly="readonly"
				data-options="value:'${model.className}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=className',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto'">
				</select>
				班
			</td>
		</tr>
		<tr>
			<td width=100 >
				年度
			</td>
			<td>
				20<input class="easyui-numberbox" style="width: 40px;" name="year1" value="${model.year1}" data-options="required:true" readonly="readonly">-
				20<input class="easyui-numberbox" style="width: 40px;" name="year2" value="${model.year2}" data-options="required:true" readonly="readonly">第
				<select name="xueqi" class="easyui-combobox" style="width: 40px;" readonly="readonly"
				data-options="value:'${model.xueqi}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=xueqi',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto'">
				</select>学期
			</td>
		</tr>
		<tr>
			<td>
				第一栏目类型
			</td>
			<td>
				<select name="type1" class="easyui-combobox" style="width: 150px;"
				data-options="value:'${model.type1}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=type1',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto'">
				</select>
			</td>
			<td>
				第一栏目费用
			</td>
			<td>
				<input class="easyui-numberbox" style="width: 80px;" name="price1" data-options="required:true"  value="${model.price1}">
			</td>
		</tr>
		<tr>
			<td>
				第二栏目类型
			</td>
			<td>
				<select name="type2" class="easyui-combobox" style="width: 150px;"
				data-options="value:'${model.type2}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=type2',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto'">
				</select>
			</td>
			<td>
				第二栏目费用
			</td>
			<td>
				<input class="easyui-numberbox" style="width: 80px;" name="price2" value="${model.price2}" data-options="required:true">
			</td>
		</tr>
		<tr>
			<td>
				备注
			</td>
			<td colspan="3">
				<input class="easyui-textbox" style="width: 200px;" name="remark" value="${model.remark}" >
			</td>
		</tr>
		<tr>
			<td>
				电话
			</td>
			<td colspan="3">
				<select name="mobile" class="easyui-combobox" style="width: 150px;"
				data-options="value:'${model.mobile}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=mobile',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto'">
				</select>
			</td>
		</tr>
		<tr>
			<td>
				开票人
			</td>
			<td>
				<input class="easyui-textbox" style="width: 140px;" name="kaipiaoren" value="${model.kaipiaoren}" data-options="required:true"/>
				<%-- <select name="kaipiaoren" class="easyui-combobox" style="width: 140px;"
				data-options="value:'${model.kaipiaoren}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=kaipiaoren',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto'">
				</select> --%>
			</td>
		
			<td>
				收款人
			</td>
			<td>
				<input class="easyui-textbox" style="width: 140px;" name="shoukuanren" value="${model.shoukuanren}" data-options="required:true"/>
				<%-- <select name="shoukuanren" class="easyui-combobox" style="width: 140px;"
				data-options="value:'${model.shoukuanren}',
				url:'${spath }data.do/selectdataByDataCode.do?dataCode=shoukuanren',
				valueField:'dataName',
				textField:'dataName',
				editable:false,
				required:true,
				panelHeight:'auto'"> --%>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><a href="#" class="easyui-linkbutton" style="width: 140px;" onclick="save()">${button}</a>  </td>
			<td></td>
			<td></td>
		</tr>
	</table>
</form>
</body>
</html>