<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?CustomerPortAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function () {
	loadCustomer_z_180705();
})
function fengye_z_160827_2232() {
	//debugger;
	var paras = {
		startDate:ifNull($("#startDate_z_180705_1009").val()),
		endDate:ifNull($("#endDate_z_180705_1010").val()),
		page : ifNull($("#page_z_160827_2232").val()),
		rows : ifNull($("#rows_z_160827_2232").val())
	}
	var dataCount = 0;
	CustomerPortAjax.getCustomerPortCount(paras, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160827_2232"), "page_z_160827_2232", "rows_z_160827_2232", "loadCustomer_z_180705");
	})
}


function loadCustomer_z_180705() {
	var para = {
		startDate:ifNull($("#startDate_z_180705_1009").val()),
		endDate:ifNull($("#endDate_z_180705_1010").val()),
		page : ifNull($("#page_z_160827_2232").val()),
		rows : ifNull($("#rows_z_160827_2232").val())
	}
	//开始时间和结束时间
	var beginDate=$("#startDate_z_180705_1009").val();  
	var endDate=$("#endDate_z_180705_1010").val();  
	var d1 = new Date(beginDate.replace(/\-/g, "\/"));  
	var d2 = new Date(endDate.replace(/\-/g, "\/")); 
	
	if(beginDate =="" && endDate !=""){  
 		$(this).alertmsg('warn', '请选择开始时间！');
 		return;
	}
	if(beginDate !="" && endDate ==""){  
 		$(this).alertmsg('warn', '请选择结束时间！');
 		return;
	}
	if(beginDate !="" && endDate !=""&& d1 > d2 ){  
 		$(this).alertmsg('warn', '开始时间不能大于结束时间！');
 		return;
	}
	$('#tBody_z_1807051008').html("");
	loading();
	//alert(1234);
	
	CustomerPortAjax.getCustomerPort(para, function (data) {
		//alert(data);
		//debugger;
		unloading();
		data = fjson(data);
		if (data.state == 0) {
			var json = data.object[0];
			var asum=data.object[1][0];
			//var sum_rechargeMoney=0;
			//var sum_givingMoney=0;
			if(asum!=null){
				//alert(JSON.stringify(asum));
				$("#reMoneySum_0710_1143").html(asum.sumrechmoney);
			}else{
				$("#reMoneySum_0710_1143").html(0);
			}
			if(asum!=null){
				$("#outMoneySum_0710_1144").html(asum.sumgivingmoney);
			}else{
				$("#outMoneySum_0710_1144").html(0);
			}
			//debugger;
			//加载到表格
			var trs = "";
			//alert(json.length);
			for (var i = 0; i < json.length; i++) {
				var data_id = i + 1;
				var tr = "<tr align=\"center\" data-id='" + data_id + "'>" +
				    "   <td>" + ifNull(json[i].nickname) + "</td>" +
				    "   <td>" + ifNull(json[i].cname) + "</td>" +
					"   <td>" + ifNull(json[i].createTime) + "</td>" +
					"   <td>" + ifNull(json[i].rechargeMoney) + "</td>" +
					"   <td>" + ifNull(json[i].givingMoney) + "</td>" +	
					"   <td>" + ifNull(json[i].sunmoney) + "</td>" +
					"   </tr>";
				trs += tr;
				//sum_rechargeMoney +=  json[i].rechargeMoney;
				//sum_givingMoney += json[i].givingMoney;
			}
			//$("#reMoneySum_0710_1143").html(sum_rechargeMoney);
			//$("#outMoneySum_0710_1144").html(asum.sumgivingmoney);
			//alert(trs);
			$('#tBody_z_1807051008').html(trs);
			$("#tBody_z_1807051008").initui();
			fengye_z_160827_2232();
		} 
	});
	
}

</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar"> &nbsp;&nbsp;
    &nbsp;&nbsp;
    <label>创建日期：</label>
    <input type="text" name="startDate_z_180705_1009" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="开始日期"   id="startDate_z_180705_1009" value="" size="12" >
    &nbsp;&nbsp;
    <label>结束日期：</label>
    <input type="text" name="endDate_z_180705_1010" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="结束日期"   id="endDate_z_180705_1010" value="" size="12" >
    <button type="button" onclick="loadCustomer_z_180705();" class="btn-default" data-icon="search">查询</button>
    &nbsp;&nbsp;
    
    <label>充值收入金额总计：</label> 
    <span id="reMoneySum_0710_1143">0</span>&nbsp;&nbsp;
    <label>赠送金额总计：</label> 
    <span id="outMoneySum_0710_1144">0</span>&nbsp;&nbsp;
    
    <input name="page_z_160827_2232" id="page_z_160827_2232" type="hidden" value="1" />
    <input name="rows_z_160827_2232" id="rows_z_160827_2232" type="hidden" value="20" />
  </div>
</div>
<div class="bjui-pageContent tableContent">
<div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
        <th width="12%" align="center">客户名称</th>
        <th width="20%" align="center">手机号码</th>
        <th width="20%" align="center">创建时间</th>
        <th width="18%" align="center">充值余额</th>
        <th width="18%" align="center">赠送余额</th>
    	<th width="18%" align="center">可用总余额</th>
      </tr>
    </thead>
    <tbody id="tBody_z_1807051008">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160827_2232" class="bjui-pageFooter"> 
</div>

