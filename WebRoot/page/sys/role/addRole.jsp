<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script src="js/yfyue.orga.js" type="text/javascript"></script>
<script type="text/javascript" src="jajax/jquery.js?SysRoleAjax"></script>
<script type="text/javascript" src="jajax/jquery.js?SysOrgeAjax"></script>
<script>
jQuery(document).ready(function(){
  loadYfyueOrga("z_160830_2330",jQuery("#orgeName_z_171202_2347"),jQuery("#orgeId_z_171202_2347"));							   
});

//更新
function add_z_171202_2347(){
 if(isNull($("#roleName_z_171202_2347").val())){
   $(this).alertmsg('info',"角色名字不能为空");
   return false;
  }	   
   var para={
	   roleName:$("#roleName_z_171202_2347").val(),
	   roleKey:$("#orgeId_z_171202_2347").val()
	   }
    SysRoleAjax.addRole(para,function(data){
		 data=fjson(data);							   
		 if(data.state==0){   
		   $(this).alertmsg('info',data.message);
		   $(this).dialog('closeCurrent');//关闭当前Dialog
		   $(this).navtab('reload');
		 }else{
		   $(this).alertmsg('info',data.message);
		}
   }) 
 	   
	   
}
</script>
<div class="bjui-pageContent" >
  <table class="table table-condensed table-hover">
    <tbody>
      <tr>
        <td height="50" colspan="2" align="center"><h3>添加角色</h3></td>
      </tr>
      <tr>
        <td align="right"><label>角色姓名：</label></td>
        <td width="175"><input type="text" name="roleName_z_171202_2347" id="roleName_z_171202_2347" value=""/></td>
      </tr>
            <tr>
        <td align="right"><label>部门/组织：</label></td>
        <td>
        <input type="hidden" id="orgeId_z_171202_2347" name="orgeId_z_171202_2347">
        <input type="text" name="orgeName_z_171202_2347" id="orgeName_z_171202_2347" data-toggle="selectztree" data-tree="#J_ORGA_TREE_z_160830_2330" size="18" >
            <ul id="J_ORGA_TREE_z_160830_2330" class="ztree hide">
            </ul>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<div class="bjui-pageFooter">
  <ul>
    <li>
      <button type="button" data-icon="close" class="btn-close">关闭</button>
    </li>
    <li>
      <button type="button" data-icon="save" onclick="add_z_171202_2347();" class="btn-default">保存</button>
    </li>
  </ul>
</div>