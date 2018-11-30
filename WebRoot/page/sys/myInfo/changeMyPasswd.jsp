<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysUserAjax"></script>
<script>
function up_z_160822_2338(){
  $(this).alertmsg('confirm',"确定要更新登录密码？",
	{displayMode:'slide', 
	 displayPosition:'topcenter', 
	 okName:'确定', 
	 cancelName:'取消',
	 okCall:function(){upPasswd_z_160822_2338();}
   });	
}
function upPasswd_z_160822_2338(){
 if(isNull($("#oldPasswd_z_160822_2338").val())){
	  $(this).alertmsg('info',"请填写原来密码");
	  return false;
 }
 if(isNull($("#newPasswd_z_160822_2338").val())){
	  $(this).alertmsg('info',"请填写新密码");
	  return false;
 }
if($("#newPasswd_z_160822_2338").val()!=$("#submitPasswd_z_160822_2338").val())
{
  $(this).alertmsg('info',"两次密码不一致");
  return false;
}
	
var para={
	oldPasswd:$("#oldPasswd_z_160822_2338").val(),
	newPasswd:$("#newPasswd_z_160822_2338").val(),
	submitPasswd:$("#submitPasswd_z_160822_2338").val()
	}	
    SysUserAjax.changeMyPasswd(para,function(data){
	  data=fjson(data);										 
	  if(data.state==0){
		$(this).alertmsg('confirm',"密码更新成功,请重新登录",
		  {displayMode:'slide', 
		   displayPosition:'topcenter', 
		   okName:'确定', 
		   okCall:function(){window.location.href="index.jsp";}
		  });
		  //$(this).dialog('closeCurrent');//关闭当前Dialog
		 }else{
		  $(this).alertmsg('info',data.message);
		}
    });
}
</script>
<div class="bjui-pageContent">
  <table class="table table-condensed table-hover">
    <tbody>
      <tr>
        <td height="50" colspan="2" align="center"><h3>更新密码</h3></td>
      </tr>
      <tr>
        <td height="30" align="right"><label>原来密码：</label></td>
        <td >
          <input type="password" name="oldPasswd_z_160822_2338" id="oldPasswd_z_160822_2338" placeholder="原来密码" size="20" /></td>
      </tr>
      <tr>
        <td height="30" align="right"><label>新密码：</label></td>
        <td >
          <input type="password" name="newPasswd_z_160822_2338" data-rule="密码:required" id="newPasswd_z_160822_2338" placeholder="新密码" size="20" /></td>
      </tr>
      <tr>
        <td width="148" height="30" align="right"><label>确认新密码：</label></td>
        <td width="412">
          <input type="password" data-rule="确认新密码:required;match(newPasswd_z_160822_2338)" name="submitPasswd_z_160822_2338" id="submitPasswd_z_160822_2338" placeholder="确认新密码" size="20" /></td>
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
      <button type="button" data-icon="save" onclick="up_z_160822_2338();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
