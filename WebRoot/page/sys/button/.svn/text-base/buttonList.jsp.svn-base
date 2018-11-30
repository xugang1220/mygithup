<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<base href ="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysButtonAjax"></script>
<script type = "text/javascript">
$(document).ready(function () {
	var p_funcId='${param.funcId}';		
	$("#funcId_z_160901_1656").val(p_funcId);
	$("#addButton_z_160901_1656").attr("href","page/sys/button/addButton.jsp?funcId="+p_funcId);
	loadTableData_z_160901_1656();
})

function loadTableData_z_160901_1656() {
  if(isNull($("#funcId_z_160901_1656").val())){
	$(this).alertmsg('info',"获取功能ID失败");
	return false;
  }
	loading();
	var para = {
		funcId : ifNull($("#funcId_z_160901_1656").val())
	}
	//alert(1234);
	SysButtonAjax.getButtonList(para, function (data) {
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
				    "   <td>" + ifNull(data_id) + "</td>" +
					"   <td>" + ifNull(json[i].buttonName) + "</td>" +
					"   <td>" + 
					"<a href='page/sys/button/upButton.jsp?buttonId=" + json[i].buttonId + "' class=\"btn btn-blue btn-sm\" data-toggle=\"dialog\" data-width=\"700\" data-height=\"300\" data-id=\"a_z_160826_0856\" data-mask=\"true\">编辑</a>&nbsp;"+
"&nbsp;<a href='javascript:;' onclick=\"del_z_160901_1656('"+ json[i].buttonId+"')\" class=\"btn btn-red btn-sm\" >删除</a>"
					+ "</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_160901_1656').html(trs);

		} else {
			$(this).alertmsg('info', data.message);
		}
	});
}


function delOp_z_160901_1656(buttonId){
    loading();
	SysButtonAjax.delButton("buttonId="+buttonId,function(data){
	unloading();												  
	data=fjson(data);	
	if(data.state==0){
	   $(this).alertmsg('info',data.message);
	   //$(this).refresh('a_z_160826_0856');//重新加载当前标签
	   $(this).dialog('reload');
	}else{
	  $(this).alertmsg('info',data.message);
	}
  });
}	

function del_z_160901_1656(buttonId)
{
  $(this).alertmsg('confirm',"确定要删除按钮吗？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){delOp_z_160901_1656(buttonId);}
   });
}

</script>
<div class="bjui-pageHeader">
<div class="pull-right">
<a class="btn btn-default" href="javascript:;" onclick="loadTableData_z_160901_1656();" data-clear-query="true" data-icon="undo">刷新</a>
<a id="addButton_z_160901_1656" class="btn btn-orange btn-nm" data-icon="plus" data-toggle="dialog" data-width="600" data-height="240" data-id="addButton_z_160901_1656" data-mask="true">添加按钮</a>
</div>
<input type="hidden" name="funcId_z_160901_1656" id="funcId_z_160901_1656" />
</div>
<div class="bjui-pageContent tableContent">
  <table width="99%" class="table table-bordered table-hover table-striped table-top" data-selected-multi="false">
    <thead>
      <tr>
        <th width="40" align="center">ID</th>
        <th  align="center">按钮名称</th>
        <th  width="120" align="center">操作</th>
      </tr>
    </thead>
    <tbody id="tBody_z_160901_1656">
    </tbody>
  </table>
</div>

