<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?RechargePortAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function () {
	loadTableData_z_1807091401();
})
function fengye_z_180709_1400() {
	var para = {
			startDate:ifNull($("#startDate_z_180709_1357").val()),
			endDate:ifNull($("#endDate_z_180709_1358").val()),
			page : ifNull($("#page_z_180622_1003").val()),
			rows : ifNull($("#rows_z_180614_0622").val())
	}
	var dataCount = 0;
	RechargePortAjax.getRechargeListCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_180709_1344"), "page_z_180622_1003", "rows_z_180614_0622", "loadTableData_z_1807091401");
	})
}
function loadTableData_z_1807091401() {
	var para = {
		startDate:ifNull($("#startDate_z_180709_1357").val()),
		endDate:ifNull($("#endDate_z_180709_1358").val()),
		page : ifNull($("#page_z_180622_1003").val()),
		rows : ifNull($("#rows_z_180614_0622").val())
	}
	//开始时间和结束时间
	var beginDate=$("#startDate_z_180709_1357").val();  
	var endDate=$("#endDate_z_180709_1358").val();  
	var d1 = new Date(beginDate.replace(/\-/g, "\/"));  
	var d2 = new Date(endDate.replace(/\-/g, "\/")); 
	
	if(beginDate !="" && endDate ==""){  
 		$(this).alertmsg('warn', '请选择结束时间！');
 		return;
	}
	if(beginDate =="" && endDate !=""){  
 		$(this).alertmsg('warn', '请选择开始时间！');
 		return;
	}
	if(beginDate !="" && endDate !=""&& d1 > d2 ){  
 		$(this).alertmsg('warn', '开始时间不能大于结束时间！');
 		return;
	}
	
	$('#tBody_z_180709_1359').html("");
	loading();
	//alert(1234);
	RechargePortAjax.getRechargePortList(para, function (data) {
		//alert(data);
		unloading();
		data = fjson(data);
		if (data.state == 0) {
			var json = data.object[0];
			var csum=data.object[1][0];
			if(csum!=null){
				//alert(JSON.stringify(asum));
				$("#reMoneySum_0710_1200").html(csum.sumrechareMoney);
			}else{
				$("#reMoneySum_0710_1200").html(0);
			}
			if(csum!=null){
				$("#outMoneySum_0710_1201").html(csum.sumgivingMoney);
			}else{
				$("#outMoneySum_0710_1201").html(0);
			}
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
					
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_180709_1359').html(trs);
			$("#tBody_z_180709_1359").initui();
			fengye_z_180709_1400();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}
</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar"> &nbsp;&nbsp;			
    &nbsp;&nbsp;
    <label>创建日期：</label>
    <input type="text" name="startDate_z_180709_1357" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="开始日期"   id="startDate_z_180709_1357" value="" size="12" >
    &nbsp;&nbsp;
    <label>结束日期：</label>
    <input type="text" name="endDate_z_180709_1358" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="结束日期"   id="endDate_z_180709_1358" value="" size="12" >
    
    <button type="button" onclick="loadTableData_z_1807091401();" class="btn-default" data-icon="search">查询</button>
    
    <label>充值收入金额总计：</label> 
    <span id="reMoneySum_0710_1200">0</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <label>充值赠送金额总计：</label> 
    <span id="outMoneySum_0710_1201">0</span>&nbsp;&nbsp;
    
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
      </tr>
    </thead>
    <tbody id="tBody_z_180709_1359">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_180709_1344" class="bjui-pageFooter"> 
</div>
