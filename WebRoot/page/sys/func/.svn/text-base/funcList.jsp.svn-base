<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysFuncAjax"></script>
<script src="js/TreeGrid.js" type="text/javascript"></script>
<script type="text/javascript">
  function F5_z_160826_0856() {
	  $('#dataDiv_z_160826_0856').html('');
	  loadData_z_160826_0856();
  }
</script>
<div class="bjui-pageHeader">
<div class="pull-right">
<a class="btn btn-default" href="javascript:;" onclick="F5_z_160826_0856();" data-clear-query="true" data-icon="undo">刷新</a>

<a  href='page/sys/func/addOneFunc.jsp' class="btn btn-orange btn-nm" data-icon="plus" data-toggle="dialog" data-width="600" data-height="240" data-id="a_z_160826_0856" data-mask="true">添加根节点</a>
</div>
</div>
<div class="bjui-pageContent tableContent">
  <div id="dataDiv_z_160826_0856"></div>
</div>
<script type="text/javascript">
$(document).ready(function(){
  loadData_z_160826_0856();
})
function loadData_z_160826_0856() {
  SysFuncAjax.getFuncAllList(null, function (data) {
    //alert(data);											 
   data = fjson(data);
   if (data.state == 0) {
	 var json = data.object;
	 var str = JSON.stringify(json);
	 if (str.indexOf('[') != 0) {
		 json = JSON.parse('[' + str + ']')
	 }
	 //配置树
	 var config = {
		id : "tg_z_160826_0856",
		width : "100%",
		renderTo : "dataDiv_z_160826_0856",
		headerAlign : "left",
		headerHeight : "30",
		dataAlign : "left",
		indentation : "20",
		folderOpenIcon : "images/folderOpen.gif",
		folderCloseIcon : "images/folderClose.gif",
		defaultLeafIcon : "images/defaultLeaf.gif",
		folderColumnIndex : "0",
		expandLayer : 1,
		columns : [{headerText : "",dataField : "funcLevel",headerAlign : "center",dataAlign : "center",width : "100px"}, 
				   {headerText : "ID",dataField : "funcId",headerAlign : "center",dataAlign : "center",width : "50"}, 
				   {headerText : "功能名称",dataField : "funcName",headerAlign : "center",width : "100px"},
				   {headerText : "URL",dataField : "funcUrl",headerAlign : "center"}, 
				   {headerText : "状态",dataField : "funcState",headerAlign : "center",dataAlign : "center",width : "50"}, 
				   {headerText : "层数",dataField : "funcLevel",headerAlign : "center",dataAlign : "center",width : "50"}, 
				   {headerText : "叶子",dataField : "isLeaf",headerAlign : "center",dataAlign : "center",width : "50"}, 
				   {headerText : "别名",dataField : "funcAlias",headerAlign : "center",width : "100px"}, 
				   {headerText : "操作",headerAlign : "center",dataAlign : "center",handler : "op_z_160826_0856",width : "200px"}
				],
				data : json
			};
			//创建一个组件对象
			treeGrid = new TreeGrid(config);
			treeGrid.show();
			treeGrid.expandAll("N");
		} else {
			$(this).alertmsg('info', data.message);
		}
  });
}

	function op_z_160826_0856(row, col) {
		var opt = "<a href='page/sys/func/addFunc.jsp?supperFuncId=" + row.funcId + "' class=\"btn btn-orange btn-sm\" data-toggle=\"dialog\" data-width=\"700\" data-height=\"300\" data-id=\"aa_z_160826_0856\" data-mask=\"true\">下级</a>&nbsp;"+
				"<a href='page/sys/button/buttonList.jsp?funcId=" + row.funcId + "' class=\"btn btn-green btn-sm\" data-toggle=\"dialog\" data-width=\"500\" data-height=\"440\" data-id=\"be_z_160826_0856\" data-mask=\"true\">按钮</a>&nbsp;"+
		"<a href='page/sys/func/upFunc.jsp?funcId=" + row.funcId + "' class=\"btn btn-blue btn-sm\" data-toggle=\"dialog\" data-width=\"700\" data-height=\"300\" data-id=\"a_z_160826_0856\" data-mask=\"true\">编辑</a>&nbsp;"+
"&nbsp;<a href='javascript:;' onclick=\"del_z_160826_0856('"+row.funcId+"')\" class=\"btn btn-red btn-sm\" >删除</a>";	
			return opt;
	}
	
function delOp_z_160826_0856(funcId)
{
    loading();
	SysFuncAjax.delFunc("funcId="+funcId,function(data){
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

function del_z_160826_0856(funcId)
{
  $(this).alertmsg('confirm',"确定要删除此功能吗？删除后不能恢复",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){delOp_z_160826_0856(funcId);}
   });
}		
	
</script>
