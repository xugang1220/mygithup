<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?LogAjax"></script>
<script type = "text/javascript">
	$(document).ready(function () {
		loadTableData_z_160821_2309();
	})
	
function fengye_z_160821_2309() {
	var para = {
		query_key : ifNull($("#query_key_z_160821_2309").val()),
		log_type : ifNull($("#log_type_z_160821_2309").val()),
		b_time : ifNull($("#startDate_z_160821_2309").val()),
		e_time : ifNull($("#endDate_z_160821_2309").val())
	}
	var dataCount = 0;
	LogAjax.logListCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160821_2309"), "page_z_160821_2309", "rows_z_160821_2309", "loadTableData_z_160821_2309");
	})
}

function loadTableData_z_160821_2309() {
	$('#tBody_z_160821_2309').html("");
	loading();
	var para = {
		query_key : ifNull($("#query_key_z_160821_2309").val()),
		log_type : ifNull($("#log_type_z_160821_2309").val()),
		b_time : ifNull($("#startDate_z_160821_2309").val()),
		e_time : ifNull($("#endDate_z_160821_2309").val()),
		page : ifNull($("#page_z_160821_2309").val()),
		rows : ifNull($("#rows_z_160821_2309").val())
	}

	//alert(1234);
	LogAjax.logList(para, function (data) {
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
				    "   <td>" + ifNull(data_id) + "</td>" +
					"   <td>" + ifNull(json[i].loginName) + "</td>" +
					"   <td>" + ifNull(json[i].userName) + "</td>" +
					"   <td>" + ifNull(json[i].opIp) + "</td>" +
					"   <td>" + ifNull(json[i].opTitle) + "</td>" +
					"   <td>" + ifNull(json[i].opFlag) + "</td>" +
					"   <td>" + ifNull(json[i].logTime) + "</td>" +
					"   <td>" + ifNull(json[i].userEnvi) + "</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_160821_2309').html(trs);
			fengye_z_160821_2309();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}
</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar"> &nbsp;&nbsp;
    <label>操作内容</label>
    <input type="text" name="query_key_z_160821_2309" id="query_key_z_160821_2309" value="" placeholder="操作内容"   data-rule="required" size="20">
    &nbsp;&nbsp;
    <select id="log_type_z_160821_2309" name="log_type_z_160821_2309" data-toggle="selectpicker">
      <option value="0000" selected="selected">全部</option>
      <option value="1">登录注销</option>
      <option value="0">操作日志</option>
    </select>
    &nbsp;&nbsp;
    <button type="button" onclick="loadTableData_z_160821_2309();" class="btn-default" data-icon="search">查询</button>
    &nbsp;
    <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2"><i class="fa fa-angle-double-down"></i></button>
    <input name="page_z_160821_2309" id="page_z_160821_2309" type="hidden" value="1" />
    <input name="rows_z_160821_2309" id="rows_z_160821_2309" type="hidden" value="20" />
  </div>
  <div class="bjui-moreSearch">
    <label>开始时间：</label>
    <input type="text" name="startDate_z_160821_2309" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="开始时间"   id="startDate_z_160821_2309" value="" size="12" >
    &nbsp;&nbsp;
    <label>结束时间：</label>
    <input type="text" name="endDate_z_160821_2309" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="结束时间"   id="endDate_z_160821_2309" value="" size="12" >
  </div>
</div>
<div class="bjui-pageContent tableContent">
  <table width="99%" class="table table-bordered table-hover table-striped table-top" data-selected-multi="false">
    <thead>
      <tr>
        <th width="40" align="center">ID</th>
        <th width="83" align="center">登录名</th>
        <th width="88" align="center">姓名</th>
        <th width="94" align="center">IP</th>
        <th width="110" align="center">操作内容</th>
        <th width="120" align="center">操作结果</th>
        <th width="142" align="center">操作时间</th>
        <th width="290" align="center">环境</th>
      </tr>
    </thead>
    <tbody id="tBody_z_160821_2309">
    </tbody>
  </table>
</div>
<div id="pagination_z_160821_2309" class="bjui-pageFooter"> 
</div>
