<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/yfyueSysTag.tld" prefix="sys"%>
<sys:SysTag>isPage</sys:SysTag>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysOrgeAjax"></script>
<script src="js/TreeGrid.js" type="text/javascript"></script>
<script type="text/javascript">
  function F5_z_160826_1705() {
	  $('#dataDiv_z_160826_1705').html('');
	  loadData_z_160826_1705();
  }
</script>
<div class="bjui-pageHeader">
<div class="pull-right">
<a class="btn btn-default" href="javascript:;" onclick="F5_z_160826_1705();" data-clear-query="true" data-icon="undo">刷新</a>
<a  href='page/sys/orge/addOrgeOne.jsp' class="btn btn-orange btn-nm" data-icon="plus" data-toggle="dialog" data-width="600" data-height="300" data-id="a_z_160826_1705" data-mask="true">添加一级组织</a>
</div>
</div>
<div class="bjui-pageContent tableContent">
  <div id="dataDiv_z_160826_1705"></div>
</div>
<script type="text/javascript">
$(document).ready(function(){
  loadData_z_160826_1705();
})
function loadData_z_160826_1705() {
  loading();
  SysOrgeAjax.getOrgeList(null, function (data) {
   										 
   data = fjson(data);
   if (data.state == 0) {
	 var json = data.object;
	 var str = JSON.stringify(json);
	 if (str.indexOf('[') != 0) {
		 json = JSON.parse('[' + str + ']')
	 }
	 //配置树
	 var config = {
		id : "tg_z_160826_1705",
		width : "600px",
		renderTo : "dataDiv_z_160826_1705",
		headerAlign : "center",
		headerHeight : "30",
		dataAlign : "left",
		indentation : "20",
		folderOpenIcon : "images/folderOpen.gif",
		folderCloseIcon : "images/folderClose.gif",
		defaultLeafIcon : "images/defaultLeaf.gif",
		folderColumnIndex : "0",
		expandLayer : 1,
		columns : [{headerText : "",dataField : "orgeLevel",width : "120px"}, 
				   {headerText : "ID",dataField : "orgeId",dataAlign : "center",width : "50"}, 
				   {headerText : "组织简称",dataField : "orgeName",dataAlign : "center",width : "120px"},
				   {headerText : "组织级别",dataField : "orgeLevel",dataAlign : "center",width : "120px"},
				   {headerText : "组织类型",dataField : "orgeType",dataAlign : "center",width : "120px"},
				   {headerText : "组织全称",dataField : "orgeFullName",dataAlign : "center"},
				   {headerText : "操作",headerAlign : "center",dataAlign : "center",handler : "op_z_160826_1705",width : "200px"}
				],
				data : json
			};
			//创建一个组件对象
			treeGrid = new TreeGrid(config);
			treeGrid.show();
		} else {
			$(this).alertmsg('info', data.message);
		}	
  });
  unloading();	 
}

	function op_z_160826_1705(row, col) {
		var opt = "<a href='page/sys/orge/addOrge.jsp?superiorOrgeId=" + row.orgeId + "' class=\"btn btn-orange btn-sm\" data-toggle=\"dialog\" data-width=\"600\" data-height=\"300\" data-id=\"a_z_160826_1705\" data-mask=\"true\">添加下级</a>&nbsp;"+
		"<a href='page/sys/orge/upOrge.jsp?orgeId=" + row.orgeId + "' class=\"btn btn-blue btn-sm\" data-toggle=\"dialog\" data-width=\"600\" data-height=\"300\" data-id=\"u_z_160826_1705\" data-mask=\"true\">编辑</a>&nbsp;"+
  "<a href='javascript:;' onclick=\"del_z_160826_1705('"+row.orgeId+"')\" class=\"btn btn-red btn-sm\" >删除</a>&nbsp;";		
			return opt;
	}
	
function delOp_z_160826_1705(orgeId)
{
    loading();
	SysOrgeAjax.delOrge("orgeId="+orgeId,function(data){
	unloading();												  
	data=fjson(data);	
	if(data.state==0){
	   $(this).alertmsg('info',"数据已删除");
       $(this).navtab('reload');//重新加载当前标签
	}else{
	  $(this).alertmsg('info',data.message);
	}
  });
}	

function del_z_160826_1705(orgeId)
{
  $(this).alertmsg('confirm',"确定要删除此数据吗？删除后不能恢复",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){delOp_z_160826_1705(orgeId);}
   });
}	
	
</script>
