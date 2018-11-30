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
jQuery(document).ready(function(){									
	loadTableData_z_160828_0119();
});
	
function delOp_z_160828_0119(initTypeId)
{
  SysInitAjax.delInitType("initTypeId="+initTypeId,function(data){							 
	data=fjson(data);	
	if(data.state==0){
	   $(this).alertmsg('info',"数据已删除");
       $(this).navtab('reload');//重新加载当前标签
	}else{
	  $(this).alertmsg('info',data.message);
	}
  });
}	

function del_z_160828_0119(initTypeId)
{
  $(this).alertmsg('confirm',"确定要删除此数据吗？删除后不能恢复",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){delOp_z_160828_0119(initTypeId);}
   });
}
	
function fengye_z_160828_0119() {
	var para = {
	   qkey : ifNull($("#qkey_z_160828_0119").val())
	}
	var dataCount = 0;
	SysInitAjax.getInitTypeCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160828_0119"), "page_z_160828_0119", "rows_z_160828_0119", "loadTableData_z_160828_0119");
	})
}

function loadTableData_z_160828_0119() {
	$('#tBody_z_160828_0119').html("");
	loading();
	var para = {
		qkey : ifNull($("#qkey_z_160828_0119").val()),
		page : ifNull($("#page_z_160828_0119").val()),
		rows : ifNull($("#rows_z_160828_0119").val())
	}
	//alert(1234);
	SysInitAjax.getInitTypeList(para, function (data) {
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
					"   <td>" + ifNull(json[i].initTypeId) + "</td>" +
					"   <td>" + ifNull(json[i].typeCode) + "</td>" +
					"   <td>" + ifNull(json[i].typeName) + "</td>" +
					"   <td>" + ifNull(json[i].logTime) + "</td>" +
					"   <td  align=\"left\">" + 
					"<a href='page/sys/init/initTypeMoid.jsp?initTypeId=" + ifNull(json[i].initTypeId) + "' class=\"btn btn-green btn-sm\" data-toggle=\"dialog\" data-width=\"600\" data-height=\"240\" data-id=\"edit_z_160828_0119\" data-mask=\"true\">编辑名称</a>&nbsp;"
					+"<a href='javascript:;' onclick=\"del_z_160828_0119('"+json[i].initTypeId+"')\" class=\"btn btn-red btn-sm\" >删除</a>&nbsp;"
					+ "</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_160828_0119').html(trs);
			fengye_z_160828_0119();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}
</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar"> &nbsp;&nbsp;
    <label>类型名称：</label>
    <input type="text" name="qkey_z_160828_0119" id="qkey_z_160828_0119" value="" placeholder="类型名称"   data-rule="required" size="20">
    &nbsp;&nbsp;
    <button type="button" onclick="loadTableData_z_160828_0119();" class="btn-default" data-icon="search">查询</button>
    <input name="page_z_160828_0119" id="page_z_160828_0119" type="hidden" value="1" />
    <input name="rows_z_160828_0119" id="rows_z_160828_0119" type="hidden" value="20" />
    
      <div class="pull-right">
<a  href='page/sys/init/initTypeAdd.jsp' class="btn btn-orange" data-icon="plus" data-toggle="dialog" data-width="500" data-height="240" data-id="add_z_160828_0119" data-mask="true">添加类型</a>
</div>  
  </div>
</div>
<div class="bjui-pageContent tableContent">
<div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
        <th height="30px" width="60" align="center">ID</th>
        <th width="110" align="center">类型编码</th>
        <th width="140" align="center">类型名称</th>
        <th width="180" align="center">更新时间</th>
        <th align="center">操作</th>
      </tr>
    </thead>
    <tbody id="tBody_z_160828_0119">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160828_0119" class="bjui-pageFooter"> 
</div>
