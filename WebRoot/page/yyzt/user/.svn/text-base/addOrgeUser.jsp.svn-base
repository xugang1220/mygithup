<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script src="js/yfyue.orga.js" type="text/javascript"></script>
<script type="text/javascript" src="jajax/jquery.js?OpUserAjax"></script>
<script>
jQuery(document).ready(function () {
	yfyueSelectLoad(jQuery("#orgeType_my_171205_1612"),"请选择","ZTLX",null);
})
function add_my_171205_1612(){
 	if(isNull($("#orgeFullName_my_171205_1612").val())){
 		$(this).alertmsg('info',"请填写主体全称");
 		return false;
 	}
 	if(isLong($("#orgeFullName_my_171205_1612").val(),64)){
 		$(this).alertmsg('info',"主体全称最大支持64个字符");
 		return false;
 	}
 	if(isNull($("#orgeName_my_171205_1612").val())){
 		$(this).alertmsg('info',"请填写主体名称");
 		return false;
 	}
 	if(isLong($("#orgeName_my_171205_1612").val(),8)){
 		$(this).alertmsg('info',"主体名称最大支持8个字符");
 		return false;
 	} 
 	if(isNull($("#orgeType_my_171205_1612").val())){
 		$(this).alertmsg('info',"请选择主体类型");
 		return false;
 	}
 	if(isNonNull($("#linkMan_my_171205_1612").val())){
 		if(isLong($("#linkMan_my_171205_1612").val(),64)){
 			$(this).alertmsg('info',"联系人最大支持64个字符");
 			return false;
 		} 
 	}
	if(isNonNull($("#orgeTel_my_171205_1612").val())){
		if(isTel($("#orgeTel_my_171205_1612").val())){
	  		$(this).alertmsg('info',"请填写正确的主体联系电话");
	  		return false;
		}	
	}
	if(isNonNull($("#email_my_171205_1612").val())){
 		if(!isEmail($("#email_my_171205_1612").val())){
 	   		$(this).alertmsg('info',"请填写正确的邮箱");
 	   		return false;
 	 	}
 		if(isLong($("#email_my_171205_1612").val(),16)){
 			$(this).alertmsg('info',"邮箱最大支持16个字符");
 			return false;
 		} 
 	}
	if(isNonNull($("#orgeAddr_my_171205_1612").val())){
 		if(isLong($("#orgeAddr_my_171205_1612").val(),128)){
 			$(this).alertmsg('info',"地址最大支持128个字符");
 			return false;
 		} 
 	}
 	if(isNull($("#loginName_my_171205_1612").val())){
   		$(this).alertmsg('info',"登录名不能为空");
   		return false;
  	}
 	if(isEorN($("#loginName_my_171205_1612").val())){
   		$(this).alertmsg('info',"登录名必须字母或数字");
   		return false;
  	} 
 	if(isLong($("#loginName_my_171205_1612").val(),16)){
		$(this).alertmsg('info',"登录名最大支持16个字符");
		return false;
	} 
 	if(isNull($("#userName_my_171205_1612").val())){
   		$(this).alertmsg('info',"请填写姓名");
   		return false;
  	}
 	if(isLong($("#userName_my_171205_1612").val(),16)){
		$(this).alertmsg('info',"姓名最大支持16个字符");
		return false;
	} 
 	if(isNull($("#passWord_my_171205_1612").val())){
   		$(this).alertmsg('info',"请填写密码");
   		return false;
  	}
 	if(isLong($("#passWord_my_171205_1612").val(),16)){
		$(this).alertmsg('info',"密码最大支持16个字符");
		return false;
	} 
 	if(isTel($("#mobileNo_my_171205_1612").val())){
   		$(this).alertmsg('info',"请填写正确的账户电话号码");
   		return false;
  	}  
 	if($("#passWord_my_171205_1612").val()==$("#passWord2_my_171205_1612").val()) {
   		var para={
		   	loginName:$("#loginName_my_171205_1612").val(),
		   	passWord:$("#passWord_my_171205_1612").val(),
		   	passWord2:$("#passWord2_my_171205_1612").val(),
		   	userName:$("#userName_my_171205_1612").val(),
		   	mobileNo:$("#mobileNo_my_171205_1612").val(),
		   	orgeFullName:$("#orgeFullName_my_171205_1612").val(),
			orgeName:$("#orgeName_my_171205_1612").val(),
			orgeType:$("#orgeType_my_171205_1612").val(),
			linkMan:$("#linkMan_my_171205_1612").val(),
			orgeTel:$("#orgeTel_my_171205_1612").val(),
			email:$("#email_my_171205_1612").val(),
			orgeAddr:$("#orgeAddr_my_171205_1612").val()
	   	}
    	OpUserAjax.addMdUser(para,function(data){
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
        	<td height="50" colspan="4" align="center"><h3>添加运营主体</h3></td>
      	</tr>
        <tr>
        	<td align="right"><label class="yfyue-dot">主体全称：</label></td>
        	<td colspan="3"><input type="text" name="orgeFullName_my_171205_1612" data-rule="required" 
        	 	size="45" id="orgeFullName_my_171205_1612" placeholder="主体全称" /></td>
      	</tr>
      	<tr>
	      	<td align="right"><label class="yfyue-dot">主体名称：</label></td>
	        <td><input type="text" name="orgeName_my_171205_1612" data-rule="required" id="orgeName_my_171205_1612" placeholder="主体名称" /></td>
	        <td align="right"><label class="yfyue-dot">主体类型：</label></td>
	        <td>
	        	<select data-toggle="selectpicker" id="orgeType_my_171205_1612" name="orgeType_my_171205_1612">
           			<option value="">请选择</option>
           		</select>
	        </td>
	    </tr> 
        <tr>
	        <td align="right"><label>联系人：</label></td>
	        <td><input type="text" name="linkMan_my_171205_1612" data-rule="required" id="linkMan_my_171205_1612" placeholder="联系人" /></td>
	        <td align="right"><label>联系电话：</label></td>
	        <td><input type="text" name="orgeTel_my_171205_1612" data-rule="required" id="orgeTel_my_171205_1612" placeholder="联系电话" /></td>
      	</tr>
      	<tr>
	        <td align="right"><label>邮箱：</label></td>
	        <td colspan="3"><input type="text" name="email_my_171205_1612" data-rule="required" id="email_my_171205_1612" placeholder="邮箱" /></td>
      	</tr>  
        <tr>
	        <td align="right"><label>地址：</label></td>
	        <td colspan="3">
	        	<textarea name="orgeAddr_my_171205_1612" placeholder="地址" id="orgeAddr_my_171205_1612" 
        			data-toggle="autoheight" class="form-control autosize" style="overflow: hidden; word-wrap: break-word; 
        			resize: horizontal; height: 45px; width:95%;"></textarea>
	        </td>
      	</tr>
   	</tbody>
  	</table>
	<table data-width="99%" class="table table-bordered table-hover table-striped" data-selected-multi="false">
    <tbody>
    	<tr>
        	<td height="50" colspan="4" align="center"><h3>添加主体登录账户</h3></td>
      	</tr>
      	<tr>
        	<td align="right"><label class="yfyue-dot">登录名：</label></td>
        	<td><input type="text" name="loginName_my_171205_1612" id="loginName_my_171205_1612" placeholder="登录名" data-rule="required" /></td>
        	<td align="right"><label class="yfyue-dot">姓名：</label></td>
        	<td><input type="text" name="userName_my_171205_1612" id="userName_my_171205_1612" placeholder="姓名" data-rule="required" /></td>
      	</tr>
      	<tr>
        	<td align="right"><label class="yfyue-dot">密码：</label></td>
        	<td><input name="passWord_my_171205_1612" type="password" id="passWord_my_171205_1612" placeholder="密码" data-rule="required" /></td>
        	<td align="right"><label class="yfyue-dot">确认密码：</label></td>
        	<td><input name="passWord2_my_171205_1612" type="password" id="passWord2_my_171205_1612" placeholder="确认密码" data-rule="required" /></td>
      	</tr>
        <tr>
        	<td align="right"><label class="yfyue-dot">联系电话：</label></td>
        	<td colspan="3"><input name="mobileNo_my_171205_1612" type="text" id="mobileNo_my_171205_1612" 
        		placeholder="联系电话" data-rule="required;mobile" /></td>
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
      		<button type="button" data-icon="save" onclick="add_my_171205_1612();" class="btn-default">保存</button>
    	</li>
  	</ul>
</div>