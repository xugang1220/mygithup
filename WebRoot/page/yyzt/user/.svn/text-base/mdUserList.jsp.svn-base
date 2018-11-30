<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href = "<%=basePath%>">
<script type = "text/javascript" src = "jajax/jquery.js?OpUserAjax"></script>
<script type = "text/javascript">
jQuery(document).ready(function () {
	var orgeId='${param.orgeId}';
	$("#orgeId_my_171205_1721").val(orgeId);
	loadTableData_my_171205_1721();
})
function fengye_my_171205_1721() {
	var para = {
		orgeId : ifNull($("#orgeId_my_171205_1721").val()),
		qkey : ifNull($("#qkey_my_171205_1721").val())
	}
	var dataCount = 0;
	OpUserAjax.getMdUserListCount(para, function (data) {
		//alert(data);
		data = fjson(data);
		if (data.state == 0) {
			dataCount = data.object;
		}
		yfyue_bjui_pagin(dataCount, jQuery("#pagination_my_171205_1721"), "page_my_171205_1721", "rows_my_171205_1721", "loadTableData_my_171205_1721");
	})
}
function loadTableData_my_171205_1721() {
	$('#tBody_my_171205_1721').html("");
	loading();
	var para = {
		orgeId : ifNull($("#orgeId_my_171205_1721").val()),
		qkey : ifNull($("#qkey_my_171205_1721").val()),
		page : ifNull($("#page_my_171205_1721").val()),
		rows : ifNull($("#rows_my_171205_1721").val())
	}
	OpUserAjax.getMdUserList(para, function (data) {
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
					"   <td>" + ifNull(json[i].loginName) + "</td>" +
					"   <td>" + ifNull(json[i].userName) + "</td>" +
					"   <td>" + ifNull(json[i].mobileNo) + "</td>" +
					"   <td>" + ifNull(json[i].userStatusStr) + "</td>" +
					"   <td>" + adminLevelToStr_my_171205_1721(ifNull(json[i].adminLevel)) + "</td>" +
					"   <td>" + ifNull(json[i].orgeName) + "</td>" +
					"   <td>" + ifNull(json[i].openTime) + "</td>" +
					"   <td>" + 
					"<a href='page/yyzt/user/upMdUser.jsp?userId=" + ifNull(json[i].userId) + "' class=\"btn btn-blue\" data-icon=\"edit\" data-toggle=\"dialog\" data-width=\"450\" data-height=\"250\" data-id=\"e_my_171205_1721\" data-mask=\"true\">编辑</a>&nbsp;"+
					"<a href='javascript:;' onclick=\"initPasswd_my_171205_1721('"+ifNull(json[i].userId)+"')\" class=\"btn btn-green\" data-icon=\"refresh\">密码重置</a>&nbsp;"+	
					"<a href='javascript:;' onclick=\"disabledUser_my_171205_1721('"+ifNull(json[i].userId)+"')\" class=\"btn btn-red\" data-icon=\"lock\">禁用</a>&nbsp;"+	
					"<a href='javascript:;' onclick=\"enabledUser_my_171205_1721('"+ifNull(json[i].userId)+"')\" class=\"btn btn-orange\" data-icon=\"unlock\">启用</a>";	
					+ "</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_my_171205_1721').html(trs);
			$("#tBody_my_171205_1721").initui();
			fengye_my_171205_1721();
		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}
function adminLevelToStr_my_171205_1721(code){
	var codeStr = code;
	if(isNonNull(code)){ 
		if(code=='3'){
			codeStr = '普通';
		}else if(code=='2'){
			codeStr = '管理员';
		}
	}
	return codeStr;
}
function enabledUser_my_171205_1721(userId)
{
    loading();
	OpUserAjax.enabledUser("userId="+userId,function(data){
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

function disabledUserOp_my_171205_1721(userId)
{
	loading();
	OpUserAjax.disabledUser("userId="+userId,function(data){
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

function disabledUser_my_171205_1721(userId)
{
  $(this).alertmsg('confirm',"确定要禁用此账户吗？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){disabledUserOp_my_171205_1721(userId);}
   });
}

function initPasswdOp_my_171205_1721(userId)
{
    loading();
	OpUserAjax.initPasswd("userId="+userId,function(data){
	unloading();												  
	data=fjson(data);	
	if(data.state==0){
	   $(this).alertmsg('info',data.message);
	}else{
	  $(this).alertmsg('info',data.message);
	}
  });
}	

function initPasswd_my_171205_1721(userId)
{
  $(this).alertmsg('confirm',"确定要重置此账户密码吗？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){initPasswdOp_my_171205_1721(userId);}
   });
}	
</script>
<div class="bjui-pageHeader">
  	<div class="bjui-searchBar">
		&nbsp;&nbsp;
	    <label>登录名/姓名：</label>
	    <input type="text" name="qkey_my_171205_1721" id="qkey_my_171205_1721" value="" placeholder="登录名/姓名" data-rule="required" size="20">
	    &nbsp;&nbsp;
	    <button type="button" onclick="loadTableData_my_171205_1721();" class="btn-default" data-icon="search">查询</button>
	    <input name="page_my_171205_1721" id="page_my_171205_1721" type="hidden" value="1" />
	    <input name="rows_my_171205_1721" id="rows_my_171205_1721" type="hidden" value="20" />
	    <input name="orgeId_my_171205_1721" id="orgeId_my_171205_1721" type="hidden" />
  	</div>
</div>
<div class="bjui-pageContent tableContent">
<div data-layout-h="0">
	<table data-width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
    	<tr>
	        <th align="center">登录名</th>
	        <th align="center">姓名</th>
	        <th align="center">联系电话</th>
	        <th align="center">状态</th>
	        <th align="center">账户类型</th>
	        <th align="center">主体名称</th>
	        <th align="center">开户时间</th>
	        <th width="320" align="center">操作</th>
    	</tr>
    </thead>
    <tbody id="tBody_my_171205_1721">
    </tbody>
  	</table>
</div>
</div>
<div id="pagination_my_171205_1721" class="bjui-pageFooter"> 
</div>