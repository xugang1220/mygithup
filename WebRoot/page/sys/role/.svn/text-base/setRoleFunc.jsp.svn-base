<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?RoleFunAjax"></script>
<script>
jQuery(document).ready(function(){
  var p_roleId='${param.roleId}';	
  $("#roleId_z_171203_2331").val(p_roleId);
  RoleFunAjax.getRoleFuncTree("roleId="+p_roleId,function(data){
    //alert(data);											 
   data = fjson(data);
   if (data.state == 0) {
	 var json = data.object;
       		//设置组织树
  		var setting = {
  		     treeId :"roleFuncTree_z_171203_2331",
			 expandAll:"true",
  			check : {
  				enable : true,
  				chkStyle : "checkbox",
  				radioType : "level"
  			},
  			data : {
  				key : {
  					name : "funcName",
					id : "funcId"
  				}
  			},
  			callback : {
  				onCheck : function (event, treeId, treeNode, clickFlag) {
  					var treeObj_z_171203_2331=$.fn.zTree.getZTreeObj("roleFunc_z_171203_2331");
					var nodes=treeObj_z_171203_2331.getCheckedNodes(true);
					var funcIds="";
					for(var i=0;i<nodes.length;i++){
					   funcIds+=nodes[i].funcId + ",";
					}
					$("#funcIds_z_171203_2331").val(funcIds);
  				}
  			}
  		};
  		var zNodes = json;
  		$.fn.zTree.init($("#roleFunc_z_171203_2331"), setting, zNodes);
		var zTree_z_171203_2331 = $.fn.zTree.getZTreeObj("roleFunc_z_171203_2331");
		zTree_z_171203_2331.expandAll(true);
   }else{
	  $(this).alertmsg('info',data.message);
	  $(this).dialog('closeCurrent');//关闭当前Dialog
   }
  });
});


function add_z_171203_2331()
{
  $(this).alertmsg('confirm',"确定重设此角色功能？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){addOp_z_171203_2331();}
   });
}	

function addOp_z_171203_2331(){
   if(isNull($("#roleId_z_171203_2331").val())){
   $(this).alertmsg('info',"对不起,未指分配的角色");
   return false;
  } 
  var para={
	  funcIds:$("#funcIds_z_171203_2331").val(),
	  roleCode:$("#roleId_z_171203_2331").val()
  }
  RoleFunAjax.addRoleFunc(para,function(data){    
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
  <input name="roleId_z_171203_2331" type="hidden" id="roleId_z_171203_2331" value="0000" />
  <input name="funcIds_z_171203_2331" type="hidden" id="funcIds_z_171203_2331" value="0000" />
  <div id="roleFunc_z_171203_2331" class="ztree" data-toggle="ztree"></div>
</div>
<div class="bjui-pageFooter">
  <ul>
    <li>
      <button type="button" data-icon="close" class="btn-close">关闭</button>
    </li>
    <li>
      <button type="button" data-icon="save" onclick="add_z_171203_2331();" class="btn-default">保存</button>
    </li>
  </ul>
</div>