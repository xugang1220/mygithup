<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?UserFunAjax"></script>
<script>
jQuery(document).ready(function(){
  var p_empowerUserId='${param.empowerUserId}';	
  $("#empowerUserId_z_160903_0054").val(p_empowerUserId);
  UserFunAjax.getEmpower("empowerUserId="+p_empowerUserId,function(data){
    //alert(data);											 
   data = fjson(data);
   if (data.state == 0) {
	 var json = data.object;
       		//设置组织树
  		var setting = {
  		     treeId :"funcTree_z_160903_0054",
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
  					var treeObj_z_160903_0054=$.fn.zTree.getZTreeObj("userFunc_z_160903_0054");
					var nodes=treeObj_z_160903_0054.getCheckedNodes(true);
					var funcIds="";
					for(var i=0;i<nodes.length;i++){
					   funcIds+=nodes[i].funcId + ",";
					}
					$("#funcIds_z_160903_0054").val(funcIds);
  				}
  			}
  		};
  		var zNodes = json;
  		$.fn.zTree.init($("#userFunc_z_160903_0054"), setting, zNodes);
		var zTree_z_160903_0054 = $.fn.zTree.getZTreeObj("userFunc_z_160903_0054");
		zTree_z_160903_0054.expandAll(true);
   }else{
	  $(this).alertmsg('info',data.message);
	  $(this).dialog('closeCurrent');//关闭当前Dialog
   }
  });
});


function add_z_160903_0054()
{
  $(this).alertmsg('confirm',"确定重设此账户功能？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){addOp_z_160903_0054();}
   });
}	

function addOp_z_160903_0054(){
   if(isNull($("#empowerUserId_z_160903_0054").val())){
   $(this).alertmsg('info',"对不起，获取账户ID失败");
   return false;
  }
 if(isNull($("#funcIds_z_160903_0054").val())){
   $(this).alertmsg('info',"对不起,您未分配任何功能");
   return false;
  }  
  var para={
	  funcIds:$("#funcIds_z_160903_0054").val(),
	  empowerUserId:$("#empowerUserId_z_160903_0054").val()
  }
  UserFunAjax.addUserFunc(para,function(data){    
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
  <input name="empowerUserId_z_160903_0054" type="hidden" id="empowerUserId_z_160903_0054" value="0000" />
  <input name="funcIds_z_160903_0054" type="hidden" id="funcIds_z_160903_0054" value="0000" />
  <div id="userFunc_z_160903_0054" class="ztree" data-toggle="ztree"></div>
</div>
<div class="bjui-pageFooter">
  <ul>
    <li>
      <button type="button" data-icon="close" class="btn-close">关闭</button>
    </li>
    <li>
      <button type="button" data-icon="save" onclick="add_z_160903_0054();" class="btn-default">保存</button>
    </li>
  </ul>
</div>