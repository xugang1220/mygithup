<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?OrderAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function () {
	Data_z_160827_2232();
})
	
function fengye_z_180615_1449() {
	var para = {
	   qkey : ifNull($("#qkey_180623_1440")
			   .val())
	}
	var dataCount = 0;
	OrderAjax.getOrderListCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160827_2232"), "page_z_180615_1454", "rows_z_180614_1455", "Data_z_160827_2232");
	})
}

function Data_z_160827_2232() {
	$('#tBody_z_18006220958').html("");
	loading();
	var para = {
		qkey : ifNull($("#qkey_180623_1440").val()),
		page : ifNull($("#page_z_180615_1454").val()),
		rows : ifNull($("#rows_z_180614_1455").val())
	}
	//alert(1234);
	OrderAjax.getOrderList(para, function (data) {
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
			<!--    "   <td><input type=\"checkbox\" class=\"yfyue-checkbox\" name=\"seqId\" value='"+ ifNull(json[i].id) +"'></td>" +		-->
					"   <td>" + ifNull(json[i].consumerId) + "</td>" +
					"   <td>" + ifNull(json[i].createTimestr) + "</td>" +
					"   <td>" + initToName(ifNull(json[i].communityName)) + "</td>" +
					"   <td>" + ifNull(json[i].carNumber) + "</td>" +
					"   <td>" + initToName(ifNull(json[i].washType)) + "</td>" +
					"   <td>" + ifNull(json[i].phone) + "</td>" +
					"   <td>" + ifNull(json[i].useCarTime) + "</td>" +
			 		"   <td>" + ifNull(json[i].note) + "</td>" +		
					"   <td>" + ifNull(json[i].acceptTime) + "</td>" +
					"   <td>" + ifNull(json[i].finishTime) + "</td>" +  
					"   <td>" + ifNull(json[i].acceptNote) + "</td>" +
					"   <td>" + initToName(ifNull(json[i].orderStatus)) + "</td>" +
					"   <td>" + ifNull(json[i].orderMoney) + "</td>" +
					"   <td>" + ifNull(json[i].backMoney) + "</td>" +
			<!--	"   <td>" + ifNull(json[i].serviceRate) + "</td>" +		-->
					"   <td>" + ifNull(json[i].serviceNote) + "</td>" +
			<!--	"   <td>" + ifNull(json[i].acceptUserName) + "</td>" +	-->
			<!--	"   <td>" + ifNull(json[i].washUserName) + "</td>" +	-->
					"   <td>" + initToName(ifNull(json[i].payType)) + "</td>" +
					"   <td>" + 
			  <!-- "<a href='javascript:;' onclick=\"deleOrder_18615_1711('"+ifNull(json[i].id)+"')\" class=\"btn btn-orange btn-sm\" >删除</a>&nbsp;"+ -->
					"	</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_18006220958').html(trs);
			$("#tBody_z_18006220958").initui();
			fengye_z_180615_1449();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}
function del180615_1713(id){
	loading();
	OrderAjax.delOrderById("id="+id,function(data){
	unloading();												  
	data=fjson(data);	
	if(data.state==0){
	   $(this).alertmsg('info',"删除记录成功");
	   $(this).navtab('reload');//重新加载当前标签
	}else{
	  $(this).alertmsg('info',data.message);
	}
  });
	
}
function deleOrder_18615_1711(id)
{
  $(this).alertmsg('confirm',"确定要删除吗？删除后不能恢复",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){del180615_1713(id);}
   });
}
/*
function stateIN(d){
	if(d =='1'){
	return "wancd"
	}
}
*/


</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar"> &nbsp;&nbsp;			
    <label>搜索订单：</label>
    <input type="text" name="qkey_180623_1440" id="qkey_180623_1440" value="" placeholder="单号"   data-rule="required" size="20">
    &nbsp;&nbsp;
    <button type="button" onclick="Data_z_160827_2232();" class="btn-default" data-icon="search">查询</button>
    <input name="page_z_180615_1454" id="page_z_180615_1454" type="hidden" value="1" />
    <input name="rows_z_180614_1455" id="rows_z_180614_1455" type="hidden" value="20" />
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
<a style="margin:5px 0px 5px 10px" href='javascript:;' onclick="userRole_z_160827_2232()" data-icon="gears"  class="btn btn-orange">角色赋权</a>
</div>
-->
<div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
<!--    <th height="30px" width="42" align="center">选择</th> -->
        <th width="5%" align="center">单号</th>
        <th width="8%" align="center">订单创建时间</th>
        <th width="6%" align="center">小区名称</th>
        <th width="8%" align="center">车牌号</th>
        <th width="8%" align="center">洗车类型</th>
        <th width="89" align="center">车主电话</th>
        <th width="150" align="center">用车时间</th>
    	<th width="120" align="center">备注留言</th>	
        <th width="150" align="center">接单开始时间</th>
    	<th width="150" align="center">接单结束时间</th> 
        <th width="6%" align="center">接单备注</th>
        <th width="6%" align="center">单据状态</th>
        <th width="6%" align="center">单据金额</th>
        <th width="6%" align="center">退回金额</th>
   <!-- <th width="50" align="center">评分</th>-->
        <th width="6%" align="center">评语</th>
  <!--  <th width="50" align="center">接单员</th>-->
   <!-- <th width="50" align="center">洗车员</th>-->
        <th width="7%" align="center">支付方式</th>
   <!-- <th width="200" align="center">操作</th> -->
      </tr>
    </thead>
    <tbody id="tBody_z_18006220958">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160827_2232" class="bjui-pageFooter"> 
</div>
