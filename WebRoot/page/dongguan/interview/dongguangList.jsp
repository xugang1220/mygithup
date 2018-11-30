<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?DongGuangAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function () {
	loadDongGuan_1011_1();
})
	
function fengye_z_181101_1644() {
	var para = {
	   qkey : ifNull($("#qkey_z_181101_1645").val())
	}
	var dataCount = 0;
	DongGuangAjax.getGongGuanList(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160827_2232"), "page_z_181101_1647", "rows_z_181101_1646", "loadDongGuan_1011_1");
	})
}


function fromstartus(status){
	return status==="是" ?  "是" : "否";
}

function loadDongGuan_1011_1() {
	$('#tBody_z_181101_1653').html("");
	loading();
	var para = {
		qkey : ifNull($("#qkey_z_181101_1645").val()),
		page : ifNull($("#page_z_181101_1647").val()),
		rows : ifNull($("#rows_z_181101_1646").val())
	}
	//alert(1234);
	DongGuangAjax.getGongGuanList(para, function (data) {
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
				    "   <td><input type=\"checkbox\" class=\"yfyue-checkbox\" name=\"seqId\" value='"+ ifNull(json[i].mid) +"'></td>" +
				    "   <td>" + ifNull(json[i].mName) + "</td>" +
				    "   <td>" + ifNull(json[i].mAddress) + "</td>" +
					"   <td>" + ifNull(json[i].mType) + "</td>" +
					"   <td>" + ifNull(json[i].mAppointedyime) + "</td>" +
					"   <td>" + ifNull(json[i].mTogono) + "</td>" +
					"   <td>" + ifNull(json[i].mTothetime) + "</td>" +
					"   <td>" + ifNull(json[i].mCompanyTel) + "</td>" +
					"   <td>" + ifNull(json[i].mResult) + "</td>" +	
					"   <td>" + ifNull(json[i].mFeel) + "</td>" +	
					"   <td>" + 
					"	</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_181101_1653').html(trs);
			$("#tBody_z_181101_1653").initui();
			fengye_z_181101_1644();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}

</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar"> &nbsp;&nbsp;
    <label>搜索公司：</label>
    <input type="text" name="qkey_z_181101_1645" id="qkey_z_181101_1645" value="" placeholder="公司名称"   data-rule="required" size="20">
    &nbsp;&nbsp;
    <button type="button" onclick="loadDongGuan_1011_1();" class="btn-default" data-icon="search">查询</button>
   <!--  <a style="margin:5px 0px 5px 10px" href='javascript:;' onclick="customerRole_z_180621_1505()" data-icon="gears"  class="btn btn-orange">客户赋权</a> -->
    <input name="page_z_181101_1647" id="page_z_181101_1647" type="hidden" value="1" />
    <input name="rows_z_181101_1646" id="rows_z_181101_1646" type="hidden" value="20" />
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
        <th height="30%" width="42" align="center">编号</th>
        <th width="15%" align="center">公司名称</th>
        <th width="20%" align="center">面试地址</th>
        <th width="8%" align="center">岗位类型</th>
        <th width="10%" align="center">面试时间</th>
        <th width="8%" align="center">是否查学历</th>
        <th width="8%" align="center">去往距离</th>
        <th width="8%" align="center">公司电话</th>
        <th width="8%" align="center">面试结果</th>
    	<th width="10%" align="center">自我感觉</th>
    <!-- <th width="141" align="center">操作</th> --> 
      </tr>
    </thead>
    <tbody id="tBody_z_181101_1653">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160827_2232" class="bjui-pageFooter"> 
</div>