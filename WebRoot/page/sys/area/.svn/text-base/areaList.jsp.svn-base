<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- readonly -->
<base href="<%=basePath%>">
<script src="js/TreeGrid.js" type="text/javascript"></script>
<script src="js/yfyue.area.js" type="text/javascript"></script>
<script type="text/javascript" src="jajax/jquery.js?SysAreaAjax"></script>
<div class="bjui-pageHeader">
  <div class="bjui-searchBar">&nbsp;&nbsp;
    <label>地区：</label>
     <input type="hidden" id="areaCode_z_160826_1053" name="areaCode_z_160826_1053">
     <input type="text" name="areaName_z_160826_1053" id="areaName_z_160826_1053" data-toggle="selectztree" data-tree="#J_AREA_TREE_z_160826_1053" size="25" >
            <ul id="J_AREA_TREE_z_160826_1053" class="ztree hide">
            </ul>
    &nbsp;&nbsp;
    <button type="button" onclick="loadData_z_160826_1053();" class="btn-default" data-icon="search">查询</button>
  <div class="pull-right">
<a  href='page/sys/area/addOneArea.jsp' class="btn btn-orange" data-icon="plus" data-toggle="dialog" data-width="600" data-height="240" data-id="a_z_160826_1053" data-mask="true">添加省级地区</a>
</div>  
  </div>



</div>
<div class="bjui-pageContent tableContent">
  <div id="areaDiv_z_160826_1053"></div>
</div>
<script type="text/javascript">
$(document).ready(function(){
  loadYfyueArea("z_160826_1053",jQuery("#areaName_z_160826_1053"),jQuery("#areaCode_z_160826_1053"));						   
  loadData_z_160826_1053();
})
function loadData_z_160826_1053(){
  loading();	
  $('#areaDiv_z_160826_1053').html('');	
  var para={ 
	  areaCode:$("#areaCode_z_160826_1053").val()
	  }	
  SysAreaAjax.getAreaList(para,function(data){
	//alert(data);								  
	data=fjson(data);
	unloading();
	if(data.state==0){   
	  var json=data.object;
	  var str = JSON.stringify(json); 
	  if(str.indexOf('[')!=0){
		json=JSON.parse('['+str+']')
	  }
	  //配置树
	  var config = {
		id: "tg_z_160826_1053",
		width: "100%",
		renderTo: "areaDiv_z_160826_1053",
		headerAlign: "center",
		headerHeight: "30",
		dataAlign: "left",
		indentation: "20",
		folderOpenIcon: "images/folderOpen.gif",
		folderCloseIcon: "images/folderClose.gif",
		defaultLeafIcon: "images/defaultLeaf.gif",
		folderColumnIndex: "0",
		expandLayer: 1,
		columns: [
			{headerText: "",dataField : "areaLevel", width: "160px" },
			{ headerText: "地区编码", dataField: "areaCode"},
			{ headerText: "地区名称", dataField: "areaName"},
			{ headerText: "完整地区名", dataField: "fullName"},
			{ headerText: "操作", dataAlign: "center",  handler: "op_z_160826_1053", width: "180px"  }
			],
			data: json
		};
			//创建一个组件对象
			treeGrid = new TreeGrid(config);
			treeGrid.show();
	}else{
		$(this).alertmsg('info',data.message);
	}
  });
}
function op_z_160826_1053(row, col) {
   var opt="<a href='page/sys/area/upArea.jsp?areaCode="+row.areaCode+"' class=\"btn btn-blue btn-sm\" data-toggle=\"dialog\" data-width=\"600\" data-height=\"240\" data-id=\"areaEide_z_160826_1053\" data-mask=\"true\">编辑</a>&nbsp;"+
   "<a href='page/sys/area/addArea.jsp?supperCode="+row.areaCode+"' class=\"btn btn-orange btn-sm\"  data-toggle=\"dialog\" data-width=\"600\" data-height=\"240\" data-id=\"areaAdd_z_160826_1053\" data-mask=\"true\">添加下级</a>"
   +"&nbsp;<a href='javascript:;' onclick=\"del_z_160826_1053('"+row.areaCode+"')\" class=\"btn btn-red btn-sm\" >删除</a>&nbsp;";		
  return opt;
}

function delOp_z_160826_1053(areaCode)
{
    loading();
	SysAreaAjax.delArea("areaCode="+areaCode,function(data){
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

function del_z_160826_1053(areaCode)
{
  $(this).alertmsg('confirm',"确定要删除地区吗？删除后不能恢复",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){delOp_z_160826_1053(areaCode);}
   });
}	

</script>
