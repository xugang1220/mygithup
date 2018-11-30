<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?UserAreaAjax"></script>
<script>
jQuery(document).ready(function(){
  var p_empowerUserId='${param.empowerUserId}';	
  $("#empowerUserId_z_160903_1222").val(p_empowerUserId);
  UserAreaAjax.getUserAreaTree("empowerUserId="+p_empowerUserId,function(data){
    //alert(data);											 
   data = fjson(data);
   if (data.state == 0) {
	 var json = data.object;
       		//设置组织树
  		var setting = {
  		     treeId :"areaTree_z_160903_1222",
			 expandAll:"true",
  			check : {
  				enable : true,
  				chkStyle : "checkbox",
  				radioType : "level"
  			},
  			data : {
  				key : {
  					name : "areaName",
					id : "areaCode"
  				}
  			},
  			callback : {
  				onCheck : function (event, treeId, treeNode, clickFlag) {
  					var treeObj_z_160903_1222=$.fn.zTree.getZTreeObj("userArea_z_160903_1222");
					var nodes=treeObj_z_160903_1222.getCheckedNodes(true);
					var areas="";
					for(var i=0;i<nodes.length;i++){
					   areas+=nodes[i].areaCode + ",";
					}
					$("#areas_z_160903_1222").val(areas);
  				}
  			}
  		};
  		var zNodes = json;
  		$.fn.zTree.init($("#userArea_z_160903_1222"), setting, zNodes);
		var zTree_z_160903_1222 = $.fn.zTree.getZTreeObj("userArea_z_160903_1222");
		zTree_z_160903_1222.expandAll(true);
   }else{
	  $(this).alertmsg('info',data.message);
	  $(this).dialog('closeCurrent');//关闭当前Dialog
   }
  });
});


function add_z_160903_1222()
{
  $(this).alertmsg('confirm',"确定重设此账户地区？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){addOp_z_160903_1222();}
   });
}	

function addOp_z_160903_1222(){
   if(isNull($("#empowerUserId_z_160903_1222").val())){
   $(this).alertmsg('info',"对不起，获取账户ID失败");
   return false;
  }
 if(isNull($("#areas_z_160903_1222").val())){
   $(this).alertmsg('info',"对不起,您未分配任何地区");
   return false;
  }  
  var para={
	  areaCodes:$("#areas_z_160903_1222").val(),
	  empowerUserId:$("#empowerUserId_z_160903_1222").val()
  }
  UserAreaAjax.addUserArea(para,function(data){    
      data=fjson(data);										 
	  if(data.state==0){
		    $(this).alertmsg('info',data.message);
            $(this).dialog('closeCurrent');//关闭当前Dialog
		 }else{
		    $(this).alertmsg('info',data.message);
		}
  })
}
</script>
<div class="bjui-pageContent" >
  <input name="empowerUserId_z_160903_1222" type="hidden" id="empowerUserId_z_160903_1222" value="0000" />
  <input name="areas_z_160903_1222" type="hidden" id="areas_z_160903_1222" value="0000" />
  <div id="userArea_z_160903_1222" class="ztree" data-toggle="ztree"></div>
</div>
<div class="bjui-pageFooter">
  <ul>
    <li>
      <button type="button" data-icon="close" class="btn-close">关闭</button>
    </li>
    <li>
      <button type="button" data-icon="save" onclick="add_z_160903_1222();" class="btn-default">保存</button>
    </li>
  </ul>
</div>