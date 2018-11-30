<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script src="js/yfyue.orga.js" type="text/javascript"></script>
<script type="text/javascript" src="jajax/jquery.js?OpUserAjax"></script>
<script>
jQuery(document).ready(function(){
	var p_userId='${param.userId}';
  	OpUserAjax.getUserInfo("userId="+p_userId,function(data){		
		data=fjson(data);	
		if(data.state==0){ 
			var json=data.object;
			$('#loginName_my_171207_1346').val(json.loginName);
			$('#userName_my_171207_1346').val(json.userName);
			$('#mobileNo_my_171207_1346').val(json.mobileNo);
			$('#userId_my_171207_1346').val(json.userId);
		}else{
			$(this).alertmsg('info',data.message);
			$(this).dialog('closeCurrent');//关闭当前Dialog
			$(this).navtab('reload');//重新加载当前标签
		}
	});	  
});
function up_my_171207_1346(){
 	if(isNull($("#userId_my_171207_1346").val())){
   		$(this).alertmsg('info',"对不起，获取账户ID失败");
   		return false;
  	}
 	if(isNull($("#userName_my_171207_1346").val())){
   		$(this).alertmsg('info',"请填写姓名");
   		return false;
  	} 
 	if(isLong($("#userName_my_171207_1346").val(),8)){
		$(this).alertmsg('info',"姓名最大支持8个字符");
		return false;
	} 
 	if(isTel($("#mobileNo_my_171207_1346").val())){
   		$(this).alertmsg('info',"请填写正确的电话号码");
   		return false;
  	}	  
   	var para={
		userId:$("#userId_my_171207_1346").val(),
	   	userName:$("#userName_my_171207_1346").val(),
	   	mobileNo:$("#mobileNo_my_171207_1346").val()
	}
    OpUserAjax.upUser(para,function(data){
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
      	<td height="50" colspan="2" align="center"><h3>编辑账户</h3></td>
      </tr>
      <tr>
        <td width="103" align="right"><label class="yfyue-dot">登录名：</label></td>
        <td width="148">
        	<input name="loginName_my_171207_1346" type="text" disabled="disabled" id="loginName_my_171207_1346" data-rule="required" />
        </td>
      </tr>
      <tr>  
        <td width="107" align="right"><label class="yfyue-dot">姓名：</label></td>
        <td width="175">
        	<input type="text" name="userName_my_171207_1346" id="userName_my_171207_1346" />
        	<input name="userId_my_171207_1346" type="hidden" id="userId_my_171207_1346" />
        </td>
      </tr>
      <tr>
        <td align="right"><label class="yfyue-dot">联系电话：</label></td>
        <td>
        	<input name="mobileNo_my_171207_1346" type="text" id="mobileNo_my_171207_1346" data-rule="required;mobile" />
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
      <button type="button" data-icon="save" onclick="up_my_171207_1346();" class="btn-default">保存</button>
    </li>
  </ul>
</div>