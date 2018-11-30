<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysUserAjax"></script>
<script>
$(document).ready(function(){
   SysUserAjax.getMyInfo(null, function(data){
      data=fjson(data);	
	  if(data.state==0) { 
		 var json=data.object;
		 $("#loginName_z_160822_2302").html(json.loginName);
		 $("#userStatus_z_160822_2302").html(stateToName_z_160822_2302(json.userStatus));
		 $("#orgeName_z_160822_2302").html(json.orgeName);
		 $("#roleName_z_160822_2302").html(json.roleName);
		 $("#userName_z_160822_2302").val(json.userName);
		 $("#mobileNo_z_160822_2302").val(json.mobileNo);
		 $("#userId_z_160822_2302").val(json.userId);
		}else{
	      $(this).alertmsg('info',data.message);
		}
	})
});

function stateToName_z_160822_2302(code){ 
  var codeName='';
  if(isNonNull(code)){ 
	 if(code=='0'){
		codeName='正常';
	  }else if(code=='1'){
		codeName='禁止';
	 }
   }
  return codeName;
}
//更新
function up_z_160822_2302(){
 if(isNull($("#userId_z_160822_2302").val())){
   $(this).alertmsg('info',"服务器繁忙，请稍后再试");
   return false;
  }
 if(isNull($("#userName_z_160822_2302").val())){
   $(this).alertmsg('info',"请填写姓名");
   return false;
  } 
 if(isNull($("#mobileNo_z_160822_2302").val())){
   $(this).alertmsg('info',"请填写联系电话");
   return false;
  }   
 if(isTel($("#mobileNo_z_160822_2302").val())){
   $(this).alertmsg('info',"请填写正确的电话号码");
   return false;
  }  
  
   var para={
	   userId:$("#userId_z_160822_2302").val(),
	   userName:$("#userName_z_160822_2302").val(),
	   mobileNo:$("#mobileNo_z_160822_2302").val()
	   }
	   
    SysUserAjax.upMyInfo(para,function(data){
		 data=fjson(data);							   
		 if(data.state==0){   
		   $(this).alertmsg('info',"信息更新成功");
		   //$(this).dialog('closeCurrent');//关闭当前Dialog
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
        <td height="50" colspan="4" align="center"><h3>个人信息</h3></td>
      </tr>
      <tr>
        <td width="103" align="right"><label>登录名称：</label></td>
        <td width="164"><div id="loginName_z_160822_2302"></div></td>
        <td width="100" align="right"><label>账户状态：</label></td>
        <td width="163"><div id="userStatus_z_160822_2302"></div></td>
      </tr>
      <tr>
        <td align="right"><label>所属组织：</label></td>
        <td><div id="orgeName_z_160822_2302"></div></td>
        <td align="right"><label>用户角色：</label></td>
        <td><div id="roleName_z_160822_2302"></div></td>
      </tr>
      <tr>
        <td width="100" align="right"><label>姓名：</label></td>
        <td width="164"><input type="text" name="userName_z_160822_2302" id="userName_z_160822_2302" value=""  size="18" /></td>
        <td width="103" align="right"><label>电话：</label></td>
        <td width="163"><input type="text" name="mobileNo_z_160822_2302" id="mobileNo_z_160822_2302" value=""  size="18" />
          <input name="userId_z_160822_2302" type="hidden" id="userId_z_160822_2302" value="0000" /></td>
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
      <button type="button" data-icon="save" onclick="up_z_160822_2302();" class="btn-default">保存</button>
    </li>
  </ul>
</div>