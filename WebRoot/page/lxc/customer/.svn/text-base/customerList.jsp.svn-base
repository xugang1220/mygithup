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
	   qkey : ifNull($("#qkey_z_160827_2232").val())
	}
	var dataCount = 0;
	CustomerAjax.getCustomerListCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160827_2232"), "page_z_160827_2232", "rows_z_160827_2232", "loadCustomer_z_180615_1629");
	})
}
function CustomerRole_180621_1510(id,admin)
{
	$(this).alertmsg('confirm',"确定要设置洗车员吗？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){Customer_180621_1521(id);
	}
  });
		
}
function Customer_180621_1521(id,admin){
	//alert(123);
	loading();
	CustomerAjax.upCustomerById("id="+id +"&admin=false",function(data){
	unloading();									  
	data=fjson(data);
	if(data.state==0){
		   $(this).alertmsg('info',"设置成功");
		   
		   $(this).navtab('reload');
		}else{
		  $(this).alertmsg('info',data.message);
		}
	});
}
function CustCancel_180621_1704(id,admin)
{
	$(this).alertmsg('confirm',"确定取消洗车员吗？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){CustCancel_180621_1521(id);
	}
  });
		
}
function CustCancel_180621_1521(id){
	//alert(123);
	loading();
	CustomerAjax.CancleCustomerById("id="+id +"&admin=true",function(data){
	unloading();									  
	data=fjson(data);
	if(data.state==0){
		   $(this).alertmsg('info',"取消成功");
		   $(this).navtab('reload');
		}else{
		  $(this).alertmsg('info',data.message);
		}
	});
}
function fromstartus(status){
	return status==="是" ?  "是" : "否";
}

function loadCustomer_z_180615_1629() {
	$('#tBody_z_160827_2232').html("");
	loading();
	var para = {
		qkey : ifNull($("#qkey_z_160827_2232").val()),
		page : ifNull($("#page_z_160827_2232").val()),
		rows : ifNull($("#rows_z_160827_2232").val())
	}
	//alert(1234);
	CustomerAjax.getCustomerList(para, function (data) {
		//alert(data);
		unloading();
		data = fjson(data);
		if (data.state == 0) {
			var json = data.object;
			//加载到表格
			var trs = "";
			//debugger;
			//alert(json.length);
			for (var i = 0; i < json.length; i++) {
				var data_id = i + 1;
				var tr = "<tr align=\"center\" data-id='" + data_id + "'>" +
				    "   <td><input type=\"checkbox\" class=\"yfyue-checkbox\" name=\"seqId\" value='"+ ifNull(json[i].id) +"'></td>" +
				    "   <td>" + ifNull(json[i].nickname) + "</td>" +
				    "   <td>" + ifNull(json[i].cname) + "</td>" +
					"   <td>" + ifNull(json[i].createTime) + "</td>" +
					"   <td>" + ifNull(json[i].updateTime) + "</td>" +
					"   <td>" + ifNull(json[i].wechatId) + "</td>" +
					"   <td>" + fromstartus(json[i].removeadmin) + "</td>" +
					"   <td>" + ifNull(json[i].rechargeMoney) + "</td>" +
					"   <td>" + ifNull(json[i].givingMoney) + "</td>" +	
					"   <td>" + ifNull(json[i].sunmoney) + "</td>" +	
					"   <td>" + 
					"<a href='javascript:;' onclick=\"CustomerRole_180621_1510('"+ifNull(json[i].id)+"')\" class=\"btn btn-orange btn-sm\" >设置洗车员</a>&nbsp;"+
					"<a href='javascript:;' onclick=\"CustCancel_180621_1704('"+ifNull(json[i].id)+"')\" class=\"btn btn-orange btn-sm\" >取消洗车员</a>&nbsp;"+
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
    <label>搜索客户：</label>
    <input type="text" name="qkey_z_160827_2232" id="qkey_z_160827_2232" value="" placeholder="客户昵称"   data-rule="required" size="20">
    &nbsp;&nbsp;
    <button type="button" onclick="loadCustomer_z_180615_1629();" class="btn-default" data-icon="search">查询</button>
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
        <th height="30px" width="42" align="center">选择</th>
        <th width="76" align="center">昵称</th>
        <th width="76" align="center">手机号码</th>
        <th width="96" align="center">创建时间</th>
        <th width="45" align="center">更新时间</th>
        <th width="75" align="center">微信标识</th>
        <th width="89" align="center">是否洗车员</th>
        <th width="90" align="center">充值余额</th>
        <th width="141" align="center">赠送余额</th>
    	<th width="141" align="center">可用总余额</th>
 <!--   <th width="89" align="center">是否是会员</th>
        <th width="89" align="center">是否关注</th>	待优化字段-->
        <th width="141" align="center">操作</th>
      </tr>
    </thead>
    <tbody id="tBody_z_160827_2232">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160827_2232" class="bjui-pageFooter"> 
</div>
