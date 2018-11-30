<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?RechargeAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function () {
	loadTableData_z_180619_1630();
})
	
function fengye_z_180615_1449() {
	var para = {
	   qkey : ifNull($("#qkey_z_180619_1342").val())
	}
	var dataCount = 0;
	RechargeAjax.getRechargeListCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160827_2232"), "page_z_180622_1003", "rows_z_180614_0622", "loadTableData_z_180619_1630");
	})
}

function loadTableData_z_180619_1630() {
	$('#tBody_z_180615_1452').html("");
	loading();
	var para = {
		qkey : ifNull($("#qkey_z_180619_1342").val()),
		page : ifNull($("#page_z_180622_1003").val()),
		rows : ifNull($("#rows_z_180614_0622").val())
	}
	//alert(1234);
	RechargeAjax.getRechargeList(para, function (data) {
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
				    "   <td><input type=\"checkbox\" class=\"yfyue-checkbox\" name=\"seqId\" value='"+ ifNull(json[i].id) +"'></td>" +
					"   <td>" + ifNull(json[i].nickname) + "</td>" +
					"   <td>" + ifNull(json[i].createTime) + "</td>" +
					"   <td>" + ifNull(json[i].rechareMoney) + "</td>" +
					"   <td>" + ifNull(json[i].givingMoney) + "</td>" +
					"   <td>" + ifNull(json[i].orderStatusStr) + "</td>" +
					/*
					"   <td>" + 
					"<a href='javascript:;' onclick=\"delRechargeById_18619_1200('"+ifNull(json[i].id)+"')\" class=\"btn btn-orange btn-sm\" >删除</a>&nbsp;"+
					"	</td>" +
					*/
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_180615_1452').html(trs);
			$("#tBody_z_180615_1452").initui();
			fengye_z_180615_1449();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}
/*
function del180619_1200(id){
	loading();
	RechargeAjax.delRechargeById("id="+id,function(data){
	unloading();												  
	data=fjson(data);	
	if(data.state==0){
	   $(this).alertmsg('info',"删除充值记录成功");
	   $(this).navtab('reload');
	}else{
	  $(this).alertmsg('info',data.message);
	}
  });
	
}
function delRechargeById_18619_1200(id)
{
  $(this).alertmsg('confirm',"确定要删除这条充值记录吗？删除后不能恢复",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){del180619_1200(id);
	}
   });
}
*/
</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar"> &nbsp;&nbsp;			
    <label>搜索：</label>
    <input type="text" name="qkey_z_180619_1342" id="qkey_z_180619_1342" value="" placeholder="客户名称"   data-rule="required" size="20">
    &nbsp;&nbsp;
    <button type="button" onclick="loadTableData_z_180619_1630();" class="btn-default" data-icon="search">查询</button>
    <a class="btn btn-default" href="javascript:;" onclick="F5_z_180619_1620();" data-clear-query="true" data-icon="undo">刷新</a>
    <input name="page_z_180622_1003" id="page_z_180622_1003" type="hidden" value="1" />
    <input name="rows_z_180614_0622" id="rows_z_180614_0622" type="hidden" value="20" /> 
  </div>
</div>
<div class="bjui-pageContent tableContent">	
<div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
        <th height="30px" width="42" align="center">选择</th>
        <th width="200" align="center">客户名称</th>
        <th width="200" align="center">创建时间</th>  
        <th width="200" align="center">充值金额</th>
        <th width="200" align="center">赠送金额</th>
        <th width="200" align="center">充值状态</th>
      <!--<th width="200" align="center">操作</th>-->
      </tr>
    </thead>
    <tbody id="tBody_z_180615_1452">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160827_2232" class="bjui-pageFooter"> 
</div>
