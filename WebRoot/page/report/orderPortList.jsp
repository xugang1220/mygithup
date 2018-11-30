<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?OrderPortAjax"></script>
<script type = "text/javascript">
function initSeleType_180706_1727(selectID,selectName){ 
	OrderPortAjax.getTypeCode(null, function (data) {
		//alert(data);
		//debugger;
	  	data = fjson(data);
	  	if (data.state == 0) {
	  		var json = data.object;
	  		var str = JSON.stringify(json);
	  		if (str.indexOf('[') != 0) {
	  			json = JSON.parse('[' + str + ']')
	  		}
	  		//下拿
		//	debugger;
			if(isNonNull(json)){
				selectID.find("option").remove();
				selectID.append("<option value='0000'>"+selectName+"");
				for(var n=0;n<json.length;n++){
					 selectID.append("<option  value='"+json[n].dataCode+"'>"+json[n].dataName);
					}
				    selectID.selectpicker('refresh');
			}else{
			   selectID.append("<option value='0000'>"+selectName+"");
			}
	  	}else{
			$(this).alertmsg('info',data.message);
		}
	  });
	}
jQuery(document).ready(function () {
	Data_z_160827_2232();
	initSeleType_180706_1727(jQuery("#typeCode_z_160828_0135"),"选择小区");	
})
function fengye_z_180615_1449() {
	var para = {
		startDate:ifNull($("#startDate_z_180705_1425").val()),
		endDate:ifNull($("#endDate_z_180705_1426").val()),
		typeCode:ifNull($("#typeCode_z_160828_0135").val()),
		page : ifNull($("#page_z_160827_2232").val()),
		rows : ifNull($("#rows_z_160827_2232").val())
	}
	var dataCount = 0;
	OrderPortAjax.getOrderPortCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160827_2232"), "page_z_160827_2232", "rows_z_160827_2232", "Data_z_160827_2232");
	})
}

function Data_z_160827_2232() {
	var para = {
		startDate:ifNull($("#startDate_z_180705_1425").val()),
		endDate:ifNull($("#endDate_z_180705_1426").val()),
		typeCode:ifNull($("#typeCode_z_160828_0135").val()),
		page : ifNull($("#page_z_160827_2232").val()),
		rows : ifNull($("#rows_z_160827_2232").val())
	}
	//开始时间和结束时间
	var beginDate=$("#startDate_z_180705_1425").val();  
	var endDate=$("#endDate_z_180705_1426").val();  
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
	$('#tBody_z_180705_1431').html("");
	loading();
	OrderPortAjax.getOrderPortList(para, function (data) {
		
		unloading();
		data = fjson(data);
		if (data.state == 0) {
			var json = data.object[0];
			var bsum = data.object[1][0];
			if(bsum!=null){
				//alert(JSON.stringify(asum));
				$("#reMoneySum_0710_1154").html(bsum.ordersumoney);
			}else{
				$("#reMoneySum_0710_1154").html(0);
			}
			if(bsum!=null){
				$("#outMoneySum_0710_1155").html(bsum.backsumoney);
			}else{
				$("#outMoneySum_0710_1155").html(0);
			}
			
			//var sum_ordersumoney =0;
			//var sum_backsumoney=0;
			//加载到表格
			var trs = "";
			var orderMoneys = 0;
			//alert(json.length);
			for (var i = 0; i < json.length; i++) {
				var data_id = i + 1;
				var tr = "<tr align=\"center\" data-id='" + data_id + "'>" +
					"   <td>" + ifNull(json[i].consumerId) + "</td>" +
					"   <td>" + ifNull(json[i].createTimestr) + "</td>" +
					"   <td>" + initToName(ifNull(json[i].communityName)) + "</td>" +
					"   <td>" + ifNull(json[i].carNumber) + "</td>" +
					"   <td>" + initToName(ifNull(json[i].washType)) + "</td>" +
					"   <td>" + ifNull(json[i].phone) + "</td>" +
					"   <td>" + initToName(ifNull(json[i].orderStatus)) + "</td>" +
					"   <td>" + ifNull(json[i].orderMoney) + "</td>" +
					"   <td>" + ifNull(json[i].backMoney) + "</td>" +
					"   <td>" + ifNull(json[i].serviceRate) + "</td>" +
					"   <td>" + ifNull(json[i].acceptUserName) + "</td>" +
					"   <td>" + ifNull(json[i].washUserName) + "</td>" +
					"   <td>" + initToName(ifNull(json[i].payType)) + "</td>" +
					"   </tr>";
				trs += tr;
				//sum_ordersumoney +=json[i].orderMoney;
				//sum_backsumoney +=json[i].backMoney;
			}
			//alert(trs);
			//$("#reMoneySum_0710_1154").html(sum_ordersumoney);
			//$("#outMoneySum_0710_1155").html(sum_backsumoney);
			$('#tBody_z_180705_1431').html(trs);
			$("#tBody_z_180705_1431").initui();
			fengye_z_180615_1449();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}

</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar"> &nbsp;&nbsp;			
    &nbsp;&nbsp;
    <label>订单创建日期：</label>
    <input type="text" name="startDate_z_180705_1425" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="订单开始日期"   id="startDate_z_180705_1425" value="" size="12" >
    &nbsp;&nbsp;
    <label>订单结束日期：</label>
    <input type="text" name="endDate_z_180705_1426" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="订单结束日期"   id="endDate_z_180705_1426" value="" size="12" >
    <label>小区名称：</label>
	    <select name="typeCode_z_160828_0135" id="typeCode_z_160828_0135" data-toggle="selectpicker" >
            <option value='0000'>请选择</option>
       	</select>
    <button type="button" onclick="Data_z_160827_2232();" class="btn-default" data-icon="search">查询</button>
    
    <label>订单收入金额总计：</label> 
    <span id="reMoneySum_0710_1154">0</span>&nbsp;&nbsp;
    <label>订单退回金额总计：</label> 
    <span id="outMoneySum_0710_1155">0</span>&nbsp;&nbsp;
    
    <input name="page_z_160827_2232" id="page_z_160827_2232" type="hidden" value="1" />
    <input name="rows_z_160827_2232" id="rows_z_160827_2232" type="hidden" value="20" />
  </div>
</div>
<div class="bjui-pageContent tableContent">
<div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
        <th width="8%" align="center">单号</th>
        <th width="10%" align="center">订单创建时间</th>
        <th width="10%" align="center">小区名称</th>
        <th width="8%" align="center">车牌号</th>
        <th width="8%" align="center">洗车类型</th>
        <th width="8%" align="center">车主电话</th>
        <th width="8%" align="center">单据状态</th>
        <th width="8%" align="center">单据金额</th>
        <th width="8%" align="center">退回金额</th>
        <th width="5%" align="center">评分</th>
        <th width="5%" align="center">接单员</th>
        <th width="5%" align="center">洗车员</th>
        <th width="10%" align="center">支付方式</th>
      </tr>
    </thead>
    <tbody id="tBody_z_180705_1431">
    </tbody>
    <tbody id="tBody_z_180706_0920">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160827_2232" class="bjui-pageFooter"> 
</div>
