<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysUserAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function () {
	loadTableData_z_160827_2232();
})
	
function fengye_z_160827_2232() {
	var para = {
	   qkey : ifNull($("#qkey_z_160827_2232").val())
	}
	var dataCount = 0;
	SysUserAjax.getUserListCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_z_160827_2232"), "page_z_160827_2232", "rows_z_160827_2232", "loadTableData_z_160827_2232");
	})
}

function loadTableData_z_160827_2232() {
	$('#tBody_z_160827_2232').html("");
	loading();
	var para = {
		qkey : ifNull($("#qkey_z_160827_2232").val()),
		page : ifNull($("#page_z_160827_2232").val()),
		rows : ifNull($("#rows_z_160827_2232").val())
	}
	//alert(1234);
	SysUserAjax.getUserList(para, function (data) {
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
				    "   <td><input type=\"checkbox\" class=\"yfyue-checkbox\" name=\"seqId\" value='"+ ifNull(json[i].userId) +"'></td>" +
					"   <td>" + ifNull(json[i].loginName) + "</td>" +
					"   <td>" + ifNull(json[i].userName) + "</td>" +
					"   <td>" + ifNull(json[i].mobileNo) + "</td>" +
					"   <td>" + ifNull(json[i].userStatusStr) + "</td>" +
					"   <td>" + ifNull(json[i].openUserName) + "</td>" +
					"   <td>" + ifNull(json[i].orgeName) + "</td>" +
					"   <td>" + initToName(ifNull(json[i].roleCode)) + "</td>" +
					"   <td>" + ifNull(json[i].openTime) + "</td>" +
					"   <td>" + 
					"<a href='page/sys/user/upUser.jsp?userId=" + ifNull(json[i].userId) + "' class=\"btn btn-blue btn-sm\" data-toggle=\"dialog\" data-width=\"600\" data-height=\"240\" data-id=\"e_z_160827_2232\" data-mask=\"true\">编辑</a>&nbsp;"+
					"<a href='javascript:;' onclick=\"initPasswd_z_160827_2232('"+ifNull(json[i].userId)+"')\" class=\"btn btn-green btn-sm\" >密码重置</a>&nbsp;"+	
					"<a href='javascript:;' onclick=\"disabledUser_z_160827_2232('"+ifNull(json[i].userId)+"')\" class=\"btn btn-red btn-sm\" >禁用</a>&nbsp;"+	
					"<a href='javascript:;' onclick=\"enabledUser_z_160827_2232('"+ifNull(json[i].userId)+"')\" class=\"btn btn-orange btn-sm\" >启用</a>";	
					+ "</td>" +
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


function enabledUser_z_160827_2232(userId)
{
    loading();
	SysUserAjax.enabledUser("userId="+userId,function(data){
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

function disabledUserOp_z_160827_2232(userId)
{
	loading();
	SysUserAjax.disabledUser("userId="+userId,function(data){
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

function disabledUser_z_160827_2232(userId)
{
  $(this).alertmsg('confirm',"确定要禁用此账户吗？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){disabledUserOp_z_160827_2232(userId);}
   });
}


function initPasswdOp_z_160827_2232(userId)
{
    loading();
	SysUserAjax.initPasswd("userId="+userId,function(data){
	unloading();												  
	data=fjson(data);	
	if(data.state==0){
	   $(this).alertmsg('info',data.message);
	}else{
	  $(this).alertmsg('info',data.message);
	}
  });
}	

function initPasswd_z_160827_2232(userId)
{
  $(this).alertmsg('confirm',"确定要重置此账户密码吗？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){initPasswdOp_z_160827_2232(userId);}
   });
}	

function empower_z_160827_2232()
{
  var obj_length=checkboxLength("seqId");
  if(obj_length==1){ 
	$(this).dialog({id:'userFunc_z_160827_2232',width:"350",height:"550",mask:"true",url:'page/sys/user/userFunc.jsp?empowerUserId='+checkboxVal("seqId"), title:'权限管理'})
  }else{
     $(this).alertmsg('info',"请选择一行数据");
  }
}
function empowerArea_z_160827_2232()
{
  var obj_length=checkboxLength("seqId");
  if(obj_length==1){ 
	$(this).dialog({id:'userArea_z_160827_2232',width:"350",height:"550",mask:"true",url:'page/sys/user/userArea.jsp?empowerUserId='+checkboxVal("seqId"), title:'地区管理'})
  }else{
     $(this).alertmsg('info',"请选择一行数据");
  }
}
function userRole_z_160827_2232()
{
  var obj_length=checkboxLength("seqId");
  if(obj_length==1){ 
	$(this).dialog({id:'userRole_z_160827_2232',width:"650",height:"450",mask:"true",url:'page/sys/user/userRole.jsp?empowerUserId='+checkboxVal("seqId"), title:'角色管理'})
  }else{
     $(this).alertmsg('info',"请选择一行数据");
  }
}
</script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar"> &nbsp;&nbsp;
    <label>登录名/姓名：</label>
    <input type="text" name="qkey_z_160827_2232" id="qkey_z_160827_2232" value="" placeholder="登录名/姓名"   data-rule="required" size="20">
    &nbsp;&nbsp;
    <button type="button" onclick="loadTableData_z_160827_2232();" class="btn-default" data-icon="search">查询</button>
    <input name="page_z_160827_2232" id="page_z_160827_2232" type="hidden" value="1" />
    <input name="rows_z_160827_2232" id="rows_z_160827_2232" type="hidden" value="20" />
  </div>
</div>
<div class="bjui-pageContent tableContent">
<div class="bjui-headBar"><!--顶部工具条-->
<sys:SysTag>buttonList</sys:SysTag>
<!-- 
<a style="margin:5px 0px 5px 10px" href='page/sys/user/addUser.jsp' data-icon="plus" class="btn btn-blue" data-toggle="dialog" data-width="600" data-height="320" data-id="a_z_160827_2232" data-mask="true">添加账户</a>
<a style="margin:5px 0px 5px 10px" href='javascript:;' onclick="empower_z_160827_2232()" data-icon="gears"  class="btn btn-orange">权限管理</a>
<a style="margin:5px 0px 5px 10px" href='javascript:;' onclick="empowerArea_z_160827_2232()" data-icon="gears"  class="btn btn-orange">地区管理</a>-->
<a style="margin:5px 0px 5px 10px" href='javascript:;' onclick="userRole_z_160827_2232()" data-icon="gears"  class="btn btn-orange">角色赋权</a>
</div>
<div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
        <th height="30px" width="42" align="center">选择</th>
        <th width="84" align="center">登录名</th>
        <th width="76" align="center">姓名</th>
        <th width="96" align="center">联系电话</th>
        <th width="45" align="center">状态</th>
        <th width="75" align="center">开户人</th>
        <th width="89" align="center">组织</th>
        <th width="90" align="center">角色</th>
        <th width="141" align="center">开户时间</th>
        <th width="200" align="center">操作</th>
      </tr>
    </thead>
    <tbody id="tBody_z_160827_2232">
    </tbody>
  </table>
  </div>
</div>
<div id="pagination_z_160827_2232" class="bjui-pageFooter"> 
</div>
