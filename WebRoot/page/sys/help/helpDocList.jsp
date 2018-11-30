<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?HelpDocAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function(){					
	loadTableData_z_160927_1601();							
})
	
function fengye_z_160927_1601() {
	var para = {
	    query_key:ifNull($("#qkey_z_160927_1601").val()),
	    startDate:ifNull($("#startDate_z_160927_1601").val()),
	    endDate:ifNull($("#endDate_z_160927_1601").val())
	}
	var dataCount = 0;
	HelpDocAjax.getHelpDocListCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160927_1601"), "page_z_160927_1601", "rows_z_160927_1601", "loadTableData_z_160927_1601");
	})
}

function loadTableData_z_160927_1601() {
	//alert($("#typeCode_z_160927_1601").val());
	$('#tBody_z_160927_1601').html("");
	loading();
	var para = {
		query_key : ifNull($("#qkey_z_160927_1601").val()),
		startDate:ifNull($("#startDate_z_160927_1601").val()),
		endDate:ifNull($("#endDate_z_160927_1601").val()),
		page : ifNull($("#page_z_160927_1601").val()),
		rows : ifNull($("#rows_z_160927_1601").val())
	}
	//alert(1234);
	HelpDocAjax.getHelpDocList(para, function (data) {
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
				    "   <td>" + ifNull(json[i].docCode) + "</td>" +
					"   <td>" + ifNull(json[i].docTitle) + "</td>" +
					"   <td>" + ifNull(json[i].docOrder) + "</td>" +
					"   <td>" + stateToStr_z_160927_1601(ifNull(json[i].docState)) + "</td>" +
					"   <td>" + ifNull(json[i].upTime) + "</td>" +
					"   <td>" + ifNull(json[i].userName) + "</td>" +
					"   <td valign=\"middle\" align=\"center\">" + 
					"<a href='page/sys/help/upHelpDoc.jsp?docId=" + ifNull(json[i].docId) + "' class=\"btn btn-green\" data-toggle=\"dialog\" data-width=\"820\" data-height=\"540\" data-icon=\"edit\" data-id=\"e_z_160927_1601\" data-mask=\"true\">编辑</a>&nbsp;"
					+"<a href='javascript:;' class=\"btn btn-green\" onclick=\"delHelpDoc_z_160927_1601('"+ifNull(json[i].docId)+"')\" data-icon=\"trash\">删除</a>&nbsp;"
					+ "</td>" +
					" </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_160927_1601').html(trs);
			$("#tBody_z_160927_1601").initui();
			fengye_z_160927_1601();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}

function stateToStr_z_160927_1601(code){ 
	var codeStr=code;
	if(isNonNull(code)){ 
	  if(code=='0'){
	  	codeStr='正常';
	  }else if(code=='1'){
	  	codeStr='禁用';
	  }else if(code=='2'){
	  	codeStr='删除';
	  }
	}
	return codeStr;
}

function delHelpDoc_z_160927_1601(docId)
{
  $(this).alertmsg('confirm',"确定要删除吗？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){delHelpDocOp_z_160927_1601(docId);}
   });
}

function delHelpDocOp_z_160927_1601(docId){
	loading();
	HelpDocAjax.delHelpDoc("docId="+docId,function(data){
	  unloading();												  
	  data=fjson(data);	
	  if(data.state==0){
		 $(this).alertmsg('info',data.message);
		 $(this).navtab('reload');//重新加载当前标签
	   }else{
		  $(this).alertmsg('info',data.message);
	   }
	});
}
</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar">
    &nbsp;&nbsp;
    <label>标题/编码：</label>
    <input type="text" name="qkey_z_160927_1601" id="qkey_z_160927_1601" value="" placeholder="标题/编码"   data-rule="required" size="20">
    &nbsp;&nbsp;
          <label>开始时间：</label>
    <input type="text" name="startDate_z_160927_1601" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="开始时间"   id="startDate_z_160927_1601" value="" size="12" >
    &nbsp;&nbsp;
    <label>结束时间：</label>
    <input type="text" name="endDate_z_160927_1601" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="结束时间"   id="endDate_z_160927_1601" value="" size="12" >
    &nbsp;&nbsp;
    <button type="button" onclick="loadTableData_z_160927_1601();" class="btn-default" data-icon="search">查询</button>
    <input name="page_z_160927_1601" id="page_z_160927_1601" type="hidden" value="1" />
    <input name="rows_z_160927_1601" id="rows_z_160927_1601" type="hidden" value="20" />
 <div class="pull-right">
<a  href='page/sys/help/addHelpDoc.jsp' class="btn btn-orange" data-icon="plus" data-toggle="dialog" data-width="820" data-height="540" data-id="add_z_160927_1601" data-mask="true">添加帮助文档</a>
</div>  
  </div>
</div>
<div class="bjui-pageContent tableContent">
<div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
        <th width="120" height="30px" align="center">文档编码</th>
        <th align="center" >标题</th>
        <th width="60" align="center">排序</th>
        <th width="90" align="center">状态</th>
        <th width="150"  align="center">更新时间</th>
        <th width="100"  align="center">更新人员</th>
        <th width="160" align="center">操作</th>
      </tr>
    </thead>
    <tbody id="tBody_z_160927_1601">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160927_1601" class="bjui-pageFooter"> 
</div>
