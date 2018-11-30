<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysInitAjax"></script>
<script type = "text/javascript">
function initTypeSelect_z_160828_0135(selectID,selectName){ 
	
   SysInitAjax.getInitTypeAllList(null, function (data) {
	//alert(data);
  	data = fjson(data);
  	if (data.state == 0) {
  		var json = data.object;
  		var str = JSON.stringify(json);
  		if (str.indexOf('[') != 0) {
  			json = JSON.parse('[' + str + ']')
  		}
  		//下拿
		//debugger;
		if(isNonNull(json)){
			selectID.find("option").remove();
			selectID.append("<option value='0000'>"+selectName+"");
			for(var n=0;n<json.length;n++){
				 selectID.append("<option  value='"+json[n].typeCode+"'>"+json[n].typeName);
				 //selectID.selectpicker(json[n].typeCode,json[n].typeName);
				}
			    selectID.selectpicker('refresh');
			 // mySelect.find('option:disabled').prop('disabled', false);
			 // mySelect.find('option:selected').prop('disabled', true);
		}else{
		   selectID.append("<option value='0000'>"+selectName+"");
		}
  	}else{
		$(this).alertmsg('info',data.message);
	}
  });
}
jQuery(document).ready(function(){					
	loadTableData_z_160828_0135();							
	initTypeSelect_z_160828_0135(jQuery("#typeCode_z_160828_0135"),"数据类型");	
	
})
	
function fengye_z_160828_0135() {
	var para = {
	   qkey : ifNull($("#qkey_z_160828_0135").val()),
	   typeCode: ifNull($("#typeCode_z_160828_0135").val())
	}
	var dataCount = 0;
	SysInitAjax.getInitDataCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160828_0135"), "page_z_160828_0135", "rows_z_160828_0135", "loadTableData_z_160828_0135");
	})
}

function loadTableData_z_160828_0135() {
	//alert($("#typeCode_z_160828_0135").val());
	$('#tBody_z_160828_0135').html("");
	loading();
	var para = {
	    typeCode: ifNull($("#typeCode_z_160828_0135").val()),
		qkey : ifNull($("#qkey_z_160828_0135").val()),
		page : ifNull($("#page_z_160828_0135").val()),
		rows : ifNull($("#rows_z_160828_0135").val())
	}
	//alert(1234);
	SysInitAjax.getInitDataList(para, function (data) {
		//alert(data);
		unloading();
		data = fjson(data);
		if (data.state == 0) {
			var json = data.object;
			//加载到表格
			var trs = "";
			//alert(json.length);
			for (var i = 0; i < json.length; i++) {
				var data_id = i + 1;
				var tr = "<tr align=\"center\" data-id='" + data_id + "'>" +
					"   <td>" + ifNull(json[i].initDataId) + "</td>" +
					"   <td>" + ifNull(json[i].dataCode) + "</td>" +
					"   <td>" + ifNull(json[i].dataName) + "</td>" +
					"   <td>" + ifNull(json[i].typeName) + "</td>" +
					"   <td>" + ifNull(json[i].logTime) + "</td>" +
					"   <td align=\"left\">" + 
					"<a href='page/sys/init/initDataModi.jsp?initDataId=" + ifNull(json[i].initDataId) + "' class=\"btn btn-green btn-sm\" data-toggle=\"dialog\" data-width=\"600\" data-height=\"240\" data-id=\"e_z_160828_0135\" data-mask=\"true\">编辑名称</a>&nbsp;"
					+ "</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_160828_0135').html(trs);
			fengye_z_160828_0135();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}
</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar"> &nbsp;&nbsp;&nbsp;&nbsp;<label>数据类型：</label>
    <select data-toggle="selectpicker" id="typeCode_z_160828_0135" name="typeCode_z_160828_0135">
       <option value='0000'>数据类型</option>
    </select>
    &nbsp;&nbsp;
    <label>名称：</label>
    <input type="text" name="qkey_z_160828_0135" id="qkey_z_160828_0135" value="" placeholder="名称"   data-rule="required" size="20">
    &nbsp;&nbsp;
    <button type="button" onclick="loadTableData_z_160828_0135();" class="btn-default" data-icon="search">查询</button>
    <input name="page_z_160828_0135" id="page_z_160828_0135" type="hidden" value="1" />
    <input name="rows_z_160828_0135" id="rows_z_160828_0135" type="hidden" value="20" />
    
      <div class="pull-right">
<a  href='page/sys/init/initDataAdd.jsp' class="btn btn-orange" data-icon="plus" data-toggle="dialog" data-width="500" data-height="240" data-id="add_z_160828_0135" data-mask="true">添加数据</a>
</div>  
  </div>
</div>
<div class="bjui-pageContent tableContent">
<div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
        <th height="30px" width="80" align="center">ID</th>
        <th width="120" align="center">字典编码</th>
        <th width="140" align="center">字典名称</th>
        <th width="140" align="center">类型名称</th>
        <th width="180" align="center">更新时间</th>
        <th align="center">操作</th>
      </tr>
    </thead>
    <tbody id="tBody_z_160828_0135">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160828_0135" class="bjui-pageFooter"> 
</div>
