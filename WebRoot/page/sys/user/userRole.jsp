<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?UserRoleAjax"></script>
<script>
jQuery(document).ready(function(){
  var p_empowerUserId='${param.empowerUserId}';	
  $("#empowerUserId_z_171204_0102").val(p_empowerUserId);
  UserRoleAjax.getUserRoleList("userId="+p_empowerUserId,function(data){
    //alert(data);											 
   data = fjson(data);
   if (data.state == 0) {
	 var json = data.object;
			//加载到表格
			var trs = "";
			//alert(json.length);
			for (var i = 0; i < json.length; i++) {
				var data_id = i + 1;
				var tr = "<tr align=\"center\" data-id='" + data_id + "'>" +
				    "   <td><input type=\"checkbox\" class=\"yfyue-checkbox\" name=\"userRoles\" "+ifNull(json[i].checkboxChecked)+" value='"+ ifNull(json[i].checkboxValue) +"'></td>" +
					"   <td align=\"left\">" + ifNull(json[i].checkboxName) + "</td>" +
					"   <td align=\"left\">" + ifNull(json[i].orgeFullName) + "</td>" +
					"   </tr>";
				trs += tr;
			}
			//alert(trs);
			$('#tBody_z_171204_0102').html(trs);
			$("#tBody_z_171204_0102").initui();      
   }else{
	  $(this).alertmsg('info',data.message);
	  $(this).dialog('closeCurrent');//关闭当前Dialog
   }
  });
});


function addUserRole_z_171204_0102()
{
  $(this).alertmsg('confirm',"确定重设此账户角色？",
	{displayMode:'slide', 
	displayPosition:'topcenter', 
	okName:'确定', 
	cancelName:'取消',
	okCall:function(){addUserRoleOp_z_171204_0102();}
   });
}	

function addUserRoleOp_z_171204_0102(){
   if(isNull($("#empowerUserId_z_171204_0102").val())){
   $(this).alertmsg('info',"对不起，获取账户ID失败");
   return false;
  }
	  var para={
		  userRoles:checkboxVal("userRoles"),
		  userId:$("#empowerUserId_z_171204_0102").val()
	  }
	  UserRoleAjax.upUserRole(para,function(data){    
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
  <input name="empowerUserId_z_171204_0102" type="hidden" id="empowerUserId_z_171204_0102" value="0000" />
 <div data-layout-h="0">
  <table width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <thead>
      <tr>
        <th width="60" align="center">选择</th>
        <th align="left">角色名称</th>
        <th align="left">关联组织/职务</th>
      </tr>
    </thead>
    <tbody id="tBody_z_171204_0102">
    </tbody>
  </table>
  </div>
</div>
<div class="bjui-pageFooter">
  <ul>
    <li>
      <button type="button" data-icon="close" class="btn-close">关闭</button>
    </li>
    <li>
      <button type="button" data-icon="save" onclick="addUserRole_z_171204_0102();" class="btn-default">保存</button>
    </li>
  </ul>
</div>