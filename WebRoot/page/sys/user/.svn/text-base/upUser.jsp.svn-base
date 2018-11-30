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
	loadYfyueOrga("z_160831_0004",jQuery("#orgeName_z_160831_0004"),jQuery("#orgeId_z_160831_0004"));	
	var p_userId='${param.userId}';
  	SysUserAjax.getUserInfo("userId="+p_userId,function(data){		
	 data=fjson(data);	
	 if(data.state==0){ 
	  	 var json=data.object;
		 $('#loginName_z_160831_0004').val(json.loginName);
		 $('#userName_z_160831_0004').val(json.userName);
		 $('#mobileNo_z_160831_0004').val(json.mobileNo);
		 $('#orgeId_z_160831_0004').val(json.orgeId);
		 $('#orgeName_z_160831_0004').val(json.orgeName);
		 $('#userId_z_160831_0004').val(json.userId);
	   }else{
		  $(this).alertmsg('info',data.message);
		  $(this).dialog('closeCurrent');//关闭当前Dialog
		  $(this).navtab('reload');//重新加载当前标签
	   }
	});	  
  
  
});

//更新
function up_z_160822_2302(){
 if(isNull($("#userId_z_160831_0004").val())){
   $(this).alertmsg('info',"对不起，获取账户ID失败");
   return false;
  }
 if(isNull($("#userName_z_160831_0004").val())){
   $(this).alertmsg('info',"请填写姓名");
   return false;
  }  
 if(isTel($("#mobileNo_z_160831_0004").val())){
   $(this).alertmsg('info',"请填写正确的电话号码");
   return false;
  }  
 if(isNull($("#orgeId_z_160831_0004").val())){
   $(this).alertmsg('info',"请选择部门或组织");
   return false;
  } 
	   
   var para={
	   userId:$("#userId_z_160831_0004").val(),
	   userName:$("#userName_z_160831_0004").val(),
	   mobileNo:$("#mobileNo_z_160831_0004").val(),
	   orgeId:$("#orgeId_z_160831_0004").val()
	   }
	   
    SysUserAjax.upUser(para,function(data){
		 data=fjson(data);							   
		 if(data.state==0){   
		   $(this).alertmsg('info',"数据更新成功");
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
        <td height="50" colspan="4" align="center"><h3>编辑账户</h3></td>
      </tr>
      <tr>
        <td width="103" align="right"><label>登录名：</label></td>
        <td width="148"><input name="loginName_z_160831_0004" type="text" disabled="disabled" id="loginName_z_160831_0004" value=""  size="18" maxlength="16" data-rule="required" /></td>
        <td width="107" align="right"><label>姓名：</label></td>
        <td width="175"><input type="text" name="userName_z_160831_0004" id="userName_z_160831_0004" value=""  size="18" />
        <input name="userId_z_160831_0004" type="hidden" id="userId_z_160831_0004" value="0000" /></td>
      </tr>
     <tr>
        <td align="right"><label>联系电话：</label></td>
        <td><input name="mobileNo_z_160831_0004" type="text" id="mobileNo_z_160831_0004" value=""  size="18" maxlength="32" data-rule="required;mobile" /></td>
        <td align="right"><label>部门/组织：</label></td>
        <td>
        <input type="hidden" id="orgeId_z_160831_0004" name="orgeId_z_160831_0004">
        <input type="text" name="orgeName_z_160831_0004" id="orgeName_z_160831_0004" data-toggle="selectztree" data-tree="#J_ORGA_TREE_z_160831_0004" size="18" readonly>
            <ul id="J_ORGA_TREE_z_160831_0004" class="ztree hide">
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
      <button type="button" data-icon="save" onclick="up_z_160822_2302();" class="btn-default">保存</button>
    </li>
  </ul>
</div>