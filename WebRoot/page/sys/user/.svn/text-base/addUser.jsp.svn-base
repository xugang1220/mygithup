<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script src="js/yfyue.orga.js" type="text/javascript"></script>
<script type="text/javascript" src="jajax/jquery.js?SysUserAjax"></script>
<script type="text/javascript" src="jajax/jquery.js?SysOrgeAjax"></script>
<script>
jQuery(document).ready(function(){
  loadYfyueOrga("z_160830_2330",jQuery("#orgeName_z_160830_2330"),jQuery("#orgeId_z_160830_2330"));							   
});

//更新
function add_z_160830_2330(){
 if(isNull($("#loginName_z_160830_2330").val())){
   $(this).alertmsg('info',"登录名不能为空");
   return false;
  }
 if(isEorN($("#loginName_z_160830_2330").val())){
   $(this).alertmsg('info',"登录名必须字母或数字");
   return false;
  }  
 if(isNull($("#userName_z_160830_2330").val())){
   $(this).alertmsg('info',"请填写姓名");
   return false;
  } 
 if(isNull($("#passWord_z_160830_2330").val())){
   $(this).alertmsg('info',"请填写密码");
   return false;
  }   
 if(isTel($("#mobileNo_z_160830_2330").val())){
   $(this).alertmsg('info',"请填写正确的电话号码");
   return false;
  }  
/* if(isNull($("#orgeId_z_160830_2330").val())){
   $(this).alertmsg('info',"请选择部门或组织");
   return false;
  } 
  */
 if($("#passWord_z_160830_2330").val()==$("#passWord2_z_160830_2330").val()) {
	   
   var para={
	   loginName:$("#loginName_z_160830_2330").val(),
	   passWord:$("#passWord_z_160830_2330").val(),
	   passWord2:$("#passWord2_z_160830_2330").val(),
	   userName:$("#userName_z_160830_2330").val(),
	   mobileNo:$("#mobileNo_z_160830_2330").val(),
	   orgeId:$("#orgeId_z_160830_2330").val()
	   }
	   
    SysUserAjax.addUser(para,function(data){
		 data=fjson(data);							   
		 if(data.state==0){   
		   $(this).alertmsg('info',data.message);
		   $(this).dialog('closeCurrent');//关闭当前Dialog
		   $(this).navtab('reload');
		 }else{
		   $(this).alertmsg('info',data.message);
		}
   }) 
 }else{
   $(this).alertmsg('info',"对不起！两次密码不一致");
   return false; 
 }  	   
	   
}
</script>
<div class="bjui-pageContent" >
  <table class="table table-condensed table-hover">
    <tbody>
      <tr>
        <td height="50" colspan="4" align="center"><h3>添加账户</h3></td>
      </tr>
      <tr>
        <td width="103" align="right"><label>登录名：</label></td>
        <td width="148"><input name="loginName_z_160830_2330" type="text" id="loginName_z_160830_2330" value=""  size="18" maxlength="16" data-rule="required" /></td>
        <td width="107" align="right"><label>姓名：</label></td>
        <td width="175"><input type="text" name="userName_z_160830_2330" id="userName_z_160830_2330" value=""  size="18" /></td>
      </tr>

      <tr>
        <td width="103" align="right"><label>密码：</label></td>
        <td width="148"><input  name="passWord_z_160830_2330" type="password" id="passWord_z_160830_2330" value=""  size="18" maxlength="16" data-rule="密码:required" /></td>
        <td width="107" align="right"><label>确认密码：</label></td>
        <td width="175"><input name="passWord2_z_160830_2330" type="password" id="passWord2_z_160830_2330" value=""  size="18" maxlength="16" /></td>
      </tr>
            <tr>
        <td align="right"><label>联系电话：</label></td>
        <td><input name="mobileNo_z_160830_2330" type="text" id="mobileNo_z_160830_2330" value=""  size="18" maxlength="32" data-rule="required;mobile" /></td>
   <!--	<td align="right"><label>部门/组织：</label></td>
        <td>
        <input type="hidden" id="orgeId_z_160830_2330" name="orgeId_z_160830_2330">
        <input type="text" name="orgeName_z_160830_2330" id="orgeName_z_160830_2330" data-toggle="selectztree" data-tree="#J_ORGA_TREE_z_160830_2330" size="18" >
            <ul id="J_ORGA_TREE_z_160830_2330" class="ztree hide">
            </ul>
        </td> 	--> 
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
      <button type="button" data-icon="save" onclick="add_z_160830_2330();" class="btn-default">保存</button>
    </li>
  </ul>
</div>