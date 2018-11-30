<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?CustomerAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function () {
	loadCustomer_z_180615_1629();
})
	
function fengye_z_160827_2232() {
	var para = {
	   qkey : ifNull($("#qkey_z_160827_2232").val()),
	   startDate: ifNull($("#startDate_z_160927_1601").val()),
	   endDate: ifNull($("#endDate_z_160927_1601").val()),
	   type: ifNull($("#type_160830_2330").val())
	}
	var dataCount = 0;
	CustomerAjax.getCustomerStatementListCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160827_2232"), "page_z_160827_2232", "rows_z_160827_2232", "loadCustomer_z_180615_1629");
	})
}

function loadCustomer_z_180615_1629() {
	
	var para = {
		qkey : ifNull($("#qkey_z_160827_2232").val()),
		page : ifNull($("#page_z_160827_2232").val()),
		rows : ifNull($("#rows_z_160827_2232").val()),
		startDate: ifNull($("#startDate_z_160927_1601").val()),
	    endDate: ifNull($("#endDate_z_160927_1601").val()),
	    type: ifNull($("#type_160830_2330").val())
	}
	//开始时间和结束时间
	var beginDate=$("#startDate_z_160927_1601").val();  
	var endDate=$("#endDate_z_160927_1601").val();  
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
	$('#tBody_z_160827_2232').html("");
	loading();
	//alert(1234);
	CustomerAjax.getCustomerStatementList(para, function (data) {
		//alert(data);
		unloading();
		data = fjson(data);
		if (data.state == 0) {
			var json = data.object[0];
			var aSum=data.object[1];
			if(aSum==null || aSum.inMoney==undefined){
				$("#inMoneySum").html(0);
			}else{
				$("#inMoneySum").html(aSum.inMoney);
			}
			if(aSum==null || aSum.outMoney==undefined){
				$("#outMoneySum").html(0);
			}else{
				$("#outMoneySum").html(aSum.outMoney);
			}
			$("#receivableMoneySum").html($("#inMoneySum").text()-$("#outMoneySum").text());
			
			//加载到表格
			var trs = "";
			//alert(json.length);
			for (var i = 0; i < json.length; i++) {
				var data_id = i + 1;
				var tr = "<tr align=\"center\" data-id='" + data_id + "'>" +
				    "   <td>" + ifNull(json[i].createTime) + "</td>" +
				    "   <td>" + ifNull(json[i].billNo) + "</td>" +
					"   <td>" + ifNull(json[i].type) + "</td>" +
					"   <td>" + ifNull(json[i].inMoney) + "</td>" +
					"   <td>" + ifNull(json[i].outMoney) + "</td>" +
					"   <td>" + 
					"	</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_160827_2232').html(trs);
			$("#tBody_z_160827_2232").initui();
			fengye_z_160827_2232();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}

</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar"> &nbsp;&nbsp;
    <label>开始时间：</label>
    <input type="text" name="startDate_z_160927_1601" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="开始时间"   id="startDate_z_160927_1601" value="" size="12" >
    &nbsp;&nbsp;
    <label>结束时间：</label>
    <input type="text" name="endDate_z_160927_1601" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="结束时间"   id="endDate_z_160927_1601" value="" size="12" >
    &nbsp;&nbsp;
    <label>业务类型：</label>
    <select name="type_160830_2330" id="type_160830_2330" data-toggle="selectpicker" data-rule="required">
            <option value='all' selected="selected">请选择</option>
            <option value='洗车下单'>洗车下单</option>
            <option value='套餐充值'>套餐充值</option>
    </select>
    <button type="button" onclick="loadCustomer_z_180615_1629();" class="btn-default" data-icon="search">查询</button>
    &nbsp;&nbsp;
    <label>收入金额总计：</label> <span id="inMoneySum">0</span>&nbsp;&nbsp;
    <label>退款金额总计：</label> <span id="outMoneySum">0</span>&nbsp;&nbsp;
    <label>应收金额总计：</label> <span id="receivableMoneySum">0</span>
    
   <!-- <button type="button" onclick="laadCustomer_z_180615_1633();" class="btn-default" data-icon="search">添加订单</button> -->
   <!--  <a style="margin:5px 0px 5px 10px" href='javascript:;' onclick="customerRole_z_180621_1505()" data-icon="gears"  class="btn btn-orange">客户赋权</a> -->
    <input name="page_z_160827_2232" id="page_z_160827_2232" type="hidden" value="1" />
    <input name="rows_z_160827_2232" id="rows_z_160827_2232" type="hidden" value="20" />
    
  </div>
</div>
<div class="bjui-pageContent tableContent">
<!-- 
<div class="bjui-headBar"><!--顶部工具条-->
<!--

<sys:SysTag>buttonList</sys:SysTag>
<a style="margin:5px 0px 5px 10px" href='page/sys/user/addUser.jsp' data-icon="plus" class="btn btn-blue" data-toggle="dialog" data-width="600" data-height="320" data-id="a_z_160827_2232" data-mask="true">添加账户</a>
<a style="margin:5px 0px 5px 10px" href='javascript:;' onclick="empower_z_160827_2232()" data-icon="gears"  class="btn btn-orange">权限管理</a>
<a style="margin:5px 0px 5px 10px" href='javascript:;' onclick="empowerArea_z_160827_2232()" data-icon="gears"  class="btn btn-orange">地区管理</a>
<a style="margin:5px 0px 5px 10px" href='javascript:;' onclick="customerRole_z_180621_1505()" data-icon="gears"  class="btn btn-orange">角色赋权</a>
</div>

-->
<div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
        <th width="20%" align="center">创建时间</th>
        <th width="20%" align="center">单据号</th>
        <th width="20%" align="center">业务类型</th>
        <th width="20%" align="center">收入金额</th>
        <th width="20%" align="center">退款金额</th>
      </tr>
    </thead>
    <tbody id="tBody_z_160827_2232">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160827_2232" class="bjui-pageFooter"> 
</div>
