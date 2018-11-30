<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysRoleAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function(){
	loadTableData_z_171202_2331();							
})

function fengye_z_171202_2331() {
	var para = {
	   qkey: ifNull($("#qkey_z_171202_2331").val())
	}
	var dataCount = 0;
	SysRoleAjax.getRoleListNum(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_171202_2331"), "page_z_171202_2331", "rows_z_171202_2331", "loadTableData_z_171202_2331");
	})
}

function loadTableData_z_171202_2331() {
	//alert($("#typeCode_z_171202_2331").val());
	$('#tBody_z_171202_2331').html("");
	loading();
	var para = {
	    qkey: ifNull($("#qkey_z_171202_2331").val()),
		page : ifNull($("#page_z_171202_2331").val()),
		rows : ifNull($("#rows_z_171202_2331").val())
	}
	//alert(1234);
	SysRoleAjax.getRoleList(para, function (data) {
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
					"   <td>" + ifNull(json[i].roleId) + "</td>" +
					"   <td>" + ifNull(json[i].roleName) + "</td>" +
					"   <td>" + ifNull(json[i].orgeFullName) + "</td>" +
					"   <td>" + ifNull(json[i].upTime) + "</td>" +
					"   <td align=\"left\">" + 
					"<a href='page/sys/role/setRoleFunc.jsp?roleId=" + ifNull(json[i].roleId) + "' class=\"btn btn-green\" data-toggle=\"dialog\" data-icon=\"cog\" data-width=\"350\" data-height=\"500\" data-id=\"e_z_171202_2331\" data-mask=\"true\">功能分配</a>&nbsp;"
					+"<a href='javascript:;' class=\"btn btn-green\" onclick=\"delJiaoSe_z_171203_0010('"+ifNull(json[i].roleId)+"')\" data-icon=\"trash\">删除</a>&nbsp;"
					+ "</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_171202_2331').html(trs);
			fengye_z_171202_2331();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}


function delJiaoSe_z_171203_0010(roleId)
{
  $(this).alertmsg('confirm',"确定要删除吗？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){delJiaoSeOp_z_171203_0010(roleId);}
   });
}

function delJiaoSeOp_z_171203_0010(roleId){
	loading();
	SysRoleAjax.delRole("roleId="+roleId,function(data){
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
    <label>角色名称：</label>
    <input type="text" name="qkey_z_171202_2331" id="qkey_z_171202_2331" value="" placeholder="角色名称"   data-rule="required" size="20">
    &nbsp;&nbsp;
    <button type="button" onclick="loadTableData_z_171202_2331();" class="btn-default" data-icon="search">查询</button>
    <input name="page_z_171202_2331" id="page_z_171202_2331" type="hidden" value="1" />
    <input name="rows_z_171202_2331" id="rows_z_171202_2331" type="hidden" value="20" />
 <div class="pull-right">
<a  href='page/sys/role/addRole.jsp' class="btn btn-orange" data-icon="plus" data-toggle="dialog" data-width="320" data-height="240" data-id="add_z_171202_2331" data-mask="true">添加角色</a>
</div>  
  </div>
</div>
<div class="bjui-pageContent tableContent">
<div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
        <th width="40" align="center">ID</th>
        <th align="center">角色名称</th>
        <th align="center">关联组织/职务</th>
        <th width="180" align="center">更新时间</th>
        <th width="160" align="center">操作</th>
      </tr>
    </thead>
    <tbody id="tBody_z_171202_2331">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_171202_2331" class="bjui-pageFooter"> 
</div>
