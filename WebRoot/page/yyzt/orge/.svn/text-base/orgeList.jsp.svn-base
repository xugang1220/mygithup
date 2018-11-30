<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href = "<%=basePath%>">
<script type = "text/javascript" src = "jajax/jquery.js?OpOrgeAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function () {
	loadTableData_my_171208_1228();
})
function fengye_my_171208_1228() {
	var para = {
		qkey : ifNull($("#qkey_my_171208_1228").val())
	}
	var dataCount = 0;
	OpOrgeAjax.getOrgeListCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_my_171208_1228"), "page_my_171208_1228", "rows_my_171208_1228", "loadTableData_my_171208_1228");
	})
}
function loadTableData_my_171208_1228() {
	$('#tBody_my_171208_1228').html("");
	loading();
	var para = {
		qkey : ifNull($("#qkey_my_171208_1228").val()),
		page : ifNull($("#page_my_171208_1228").val()),
		rows : ifNull($("#rows_my_171208_1228").val())
	}
	OpOrgeAjax.getOrgeList(para, function (data) {
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
					"   <td>" + ifNull(json[i].orgeId) + "</td>" +
					"   <td>" + ifNull(json[i].orgeName) + "</td>" +
					"   <td>" + ifNull(json[i].orgeFullName) + "</td>" +
					"   <td>" + initToName(ifNull(json[i].orgeType)) + "</td>" +
					"   <td>" + ifNull(json[i].orgeTel) + "</td>" +
					"   <td>" + ifNull(json[i].linkMan) + "</td>" +
					"   <td>" + ifNull(json[i].upTime) + "</td>" +
					"   <td>" +
					"<a href='page/yyzt/orge/qOrge.jsp?orgeId=" + ifNull(json[i].orgeId) + "' class=\"btn btn-blue\" data-toggle=\"dialog\" data-width=\"650\" data-height=\"360\" data-icon=\"eye\" data-id=\"q_my_171201_1356\" data-mask=\"true\">详情</a>&nbsp;"+ 
					"<a href='page/yyzt/user/mdUserList.jsp?orgeId=" + ifNull(json[i].orgeId) + "' class=\"btn btn-green\" data-toggle=\"navtab\" data-id=\"q_my_171208_1228\" data-reload-warn=\"本页已有打开的内容，确定将刷新本页内容，是否继续？\" data-icon=\"eye\" data-title=\'"+ifNull(json[i].orgeName)+"-账户\'>账户</a>&nbsp;"+ 
					"<a href='page/yyzt/orge/upOrge.jsp?orgeId=" + ifNull(json[i].orgeId) + "' class=\"btn btn-blue\" data-toggle=\"dialog\" data-width=\"600\" data-height=\"300\" data-id=\"u_my_171208_1228\" data-icon=\"edit\" data-mask=\"true\">编辑</a>&nbsp;"+
					"<a href='javascript:;' onclick=\"del_my_171208_1228('"+ifNull(json[i].orgeId)+"')\" data-icon=\"trash\" class=\"btn btn-red\" >删除</a>"+
					"	</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_my_171208_1228').html(trs);
			$("#tBody_my_171208_1228").initui();
			fengye_my_171208_1228();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}
function delOp_my_171208_1228(orgeId){
	loading();
	OpOrgeAjax.delOrge("orgeId="+orgeId,function(data){
		unloading();												  
		data=fjson(data);	
		if(data.state==0){
	   		$(this).alertmsg('info',"数据已删除");
       		$(this).navtab('reload');//重新加载当前标签
		}else{
	  		$(this).alertmsg('info',data.message);
		}
  	});
}	
function del_my_171208_1228(orgeId){
	$(this).alertmsg('confirm',"确定要删除此数据吗？删除后不能恢复",{displayMode:'slide', 
		displayPosition:'topcenter', 
		okName:'确定', 
		cancelName:'取消',
		okCall:function(){delOp_my_171208_1228(orgeId);}
   	});
}	
</script>
<div class="bjui-pageHeader">
  	<div class="bjui-searchBar">
		&nbsp;&nbsp;
	    <label>主体名称/主体全称/联系电话：</label>
	    <input type="text" name="qkey_my_171208_1228" id="qkey_my_171208_1228" placeholder="主体名称/主体全称/联系电话" data-rule="required" size="20">
	    &nbsp;&nbsp;
	    <button type="button" onclick="loadTableData_my_171208_1228();" class="btn-default" data-icon="search">查询</button>
	    <input name="page_my_171208_1228" id="page_my_171208_1228" type="hidden" value="1" />
	    <input name="rows_my_171208_1228" id="rows_my_171208_1228" type="hidden" value="20" />
		<div class="pull-right">
			<a href='page/yyzt/user/addOrgeUser.jsp' data-icon="plus" class="btn btn-red" data-toggle="dialog" data-width="700" data-height="470" data-id="a_my_171208_1228" data-mask="true">运营主体开户</a>
		</div>
  	</div>
</div>
<div class="bjui-pageContent tableContent">
<div data-layout-h="0">
	<table data-width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
    	<tr>
	        <th width="40" align="center">ID</th>
	        <th align="center">主体名称</th>
	        <th align="center">主体全称</th>
	        <th align="center">主体类型</th>
	        <th align="center">联系电话</th>
	        <th align="center">联系人</th>
	        <th align="center">更新时间</th>
	        <th width="300" align="center">操作</th>
    	</tr>
    </thead>
    <tbody id="tBody_my_171208_1228">
    </tbody>
  	</table>
</div>
</div>
<div id="pagination_my_171208_1228" class="bjui-pageFooter"> 
</div>