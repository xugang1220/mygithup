<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?DiscountAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function () {
	loadTableData_z_160827();
})
	
function fengye_z_180615_1449() {
	var para = {
	   qkey : ifNull($("#qkey_z_180615_1450").val())
	}
	var dataCount = 0;
	DiscountAjax.getDiscountListCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160827"), "page_z_180615_1454", "rows_z_180614_1455", "loadTableData_z_160827");
	})
}

function loadTableData_z_160827() {
	$('#tBody_z_180622_0904').html("");
	loading();
	var para = {
		qkey : ifNull($("#qkey_z_180615_1450").val()),
		page : ifNull($("#page_z_180615_1454").val()),
		rows : ifNull($("#rows_z_180614_1455").val())
	}
	//alert(1234);
	DiscountAjax.getDiscountList(para, function (data) {
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
					"   <td>" + ifNull(json[i].dname) + "</td>" +
					"   <td>" + ifNull(json[i].removestr) + "</td>" +
					"   <td>" + ifNull(json[i].createTime) + "</td>" +
			<!--	"   <td>" + ifNull(json[i].updateTime) + "</td>" +		-->
					"   <td>" + ifNull(json[i].rechargeMoney) + "</td>" +
					"   <td>" + ifNull(json[i].givingMoney) + "</td>" +
					"   <td>" + ifNull(json[i].note) + "</td>" +
			<!--	"   <td>" + ifNull(json[i].packgeDiscountStart) + "</td>" +	-->
			<!--	"   <td>" + ifNull(json[i].packgeDiscountEnd) + "</td>" +	-->
			<!--	"   <td>" + ifNull(json[i].packageUseStart) + "</td>" +		-->
			<!--	"   <td>" + ifNull(json[i].packageUseEnd) + "</td>" +		-->
					"   <td>" + 
					"<a href='page/lxc/discount/upDiscount.jsp?id=" + ifNull(json[i].id) + "' class=\"btn btn-blue btn-sm\" data-toggle=\"dialog\" data-width=\"700\" data-height=\"300\" data-id=\"a_z_160826_0856\" data-mask=\"true\">编辑</a>&nbsp;"+
					"	</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_180622_0904').html(trs);
			$("#tBody_z_180622_0904").initui();
			fengye_z_180615_1449();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}

function discount_XG_180620_1608(id)
{
	loading();
	DiscountAjax.discountmanage("id="+id,function(data){
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
function discount_806201606(id)
{
  $(this).alertmsg('confirm',"确定要禁用此套餐吗？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){discount_XG_180620_1608(id);}
   });
}
function enddiscount180620_1607(id)
{
    loading();
    DiscountAjax.startDisount("id="+id,function(data){
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
  <div class="bjui-searchBar"> &nbsp;&nbsp;			
    <label>搜索套餐：</label>
    <input type="text" name="qkey_z_180615_1450" id="qkey_z_180615_1450" value="" placeholder="套餐名称"   data-rule="required" size="20">
    &nbsp;&nbsp;
    <button type="button" onclick="loadTableData_z_160827();" class="btn-default" data-icon="search">查询</button>
    <a href='page/lxc/discount/addDiscount.jsp' class="btn btn-orange btn-nm" data-icon="plus" data-toggle="dialog" data-width="700" data-height="300" data-id="a_z_160826_0856" data-mask="true">添加套餐</a>
    <input name="page_z_180615_1454" id="page_z_180615_1454" type="hidden" value="1" />
    <input name="rows_z_180614_1455" id="rows_z_180614_1455" type="hidden" value="20" />
  </div>
</div>
<div class="bjui-pageContent tableContent">
<div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
        <th height="10%" width="42" align="center">选择</th>
        <th width="10%" align="center">套餐名称</th>
        <th width="10%" align="center">套餐状态</th>
        <th width="10%" align="center">创建时间</th>
    <!--<th width="75" align="center">更新时间</th>-->
        <th width="10%" align="center">充值金额</th>
        <th width="10%" align="center">优惠金额</th>
        <th width="40%" align="center">服务说明</th>
    <!--<th width="141" align="center">套餐优惠开始时间</th>
        <th width="141" align="center">套餐优惠结束时间</th>
    	<th width="141" align="center">使用有效期开始时间</th>
        <th width="141" align="center">使用有效期结束时间</th>-->
        <th width="200" align="center">操作</th>
      </tr>
    </thead>
    <tbody id="tBody_z_180622_0904">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160827" class="bjui-pageFooter"> 
</div>
