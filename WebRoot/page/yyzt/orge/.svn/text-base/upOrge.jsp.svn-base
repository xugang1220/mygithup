<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?OpOrgeAjax"></script>
<script>
jQuery(document).ready(function(){				
   var p_orgeId='${param.orgeId}';
  	OpOrgeAjax.getOrgeInfo("orgeId="+p_orgeId,function(data){		
	 data=fjson(data);	
	 if(data.state==0){ 
	  	 var json=data.object;
		 $('#orgeId_my_171208_1311').val(json.orgeId);
		 $('#orgeFullName_my_171208_1311').val(json.orgeFullName);
		 $('#orgeName_my_171208_1311').val(json.orgeName);
		 $('#orgeTel_my_171208_1311').val(json.orgeTel);
		 $('#email_my_171208_1311').val(json.email);
		 $('#linkMan_my_171208_1311').val(json.linkMan);
		 $('#orgeAddr_my_171208_1311').val(json.orgeAddr);
	   }else{
		  $(this).alertmsg('info',data.message);
		  $(this).dialog('closeCurrent');//关闭当前Dialog
		  $(this).navtab('reload');//重新加载当前标签
	   }
	});	
})
function op_my_171208_1311(){	
 if(isNull($("#orgeId_my_171208_1311").val())){
	  $(this).alertmsg('info',"获取主体ID失败");
	  return false;
 }
 if(isNull($("#orgeFullName_my_171208_1311").val())){
	$(this).alertmsg('info',"请填写主体全称");
	return false;
 }
 if(isLong($("#orgeFullName_my_171208_1311").val(),64)){
	$(this).alertmsg('info',"全称最大支持64个字符");
	return false;
 }
 if(isNull($("#orgeName_my_171208_1311").val())){
	  $(this).alertmsg('info',"请选择主体名称");
	  return false;
 }
 if(isLong($("#orgeName_my_171208_1311").val(),8)){
	$(this).alertmsg('info',"名称最大支持8个字符");
	return false;
 } 
 if(isNonNull($("#orgeTel_my_171208_1311").val())){
	if(isTel($("#orgeTel_my_171208_1311").val())){
   		$(this).alertmsg('info',"请填写正确的联系电话");
   		return false;
 	}	
 }
 if(isNonNull($("#email_my_171208_1311").val())){
	if(!isEmail($("#email_my_171208_1311").val())){
   		$(this).alertmsg('info',"请填写正确的邮箱");
   		return false;
 	}
	if(isLong($("#email_my_171208_1311").val(),16)){
		$(this).alertmsg('info',"邮箱最大支持16个字符");
		return false;
	} 
 }
 if(isNonNull($("#linkMan_my_171208_1311").val())){
	 if(isLong($("#linkMan_my_171208_1311").val(),64)){
		$(this).alertmsg('info',"联系人最大支持64个字符");
		$("#linkMan_my_171208_1311").focus();
		return false;
	 } 
 }
 if(isNonNull($("#orgeAddr_my_171208_1311").val())){
	 if(isLong($("#orgeAddr_my_171208_1311").val(),128)){
		$(this).alertmsg('info',"地址最大支持128个字符");
		$("#orgeAddr_my_171208_1311").focus();
		return false;
	 } 
 }
var para={
	orgeId:$("#orgeId_my_171208_1311").val(),
	orgeFullName:$("#orgeFullName_my_171208_1311").val(),
	orgeName:$("#orgeName_my_171208_1311").val(),  
	orgeTel:$("#orgeTel_my_171208_1311").val(),
	email:$("#email_my_171208_1311").val(),
	linkMan:$("#linkMan_my_171208_1311").val(),
	orgeAddr:$("#orgeAddr_my_171208_1311").val()	
	}	
    OpOrgeAjax.upOrge(para,function(data){
	  data=fjson(data);										 
	  if(data.state==0){
		    $(this).alertmsg('info',"更新成功");
            $(this).dialog('closeCurrent');//关闭当前Dialog
			$(this).navtab('reload');//重新加载当前标签
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
        <td height="50" colspan="4" align="center"><h3>更新主体信息</h3></td>
      </tr>
      <tr>
        <td height="30" align="right"><label class="yfyue-dot">主体全称：</label></td>
        <td colspan="3">
          <input type="text" name="orgeFullName_my_171208_1311" data-rule="required" id="orgeFullName_my_171208_1311" placeholder="主体全称" class="yfyue-w80"/>
          <input type="hidden" name="orgeId_my_171208_1311" id="orgeId_my_171208_1311" />
        </td>
      </tr>
      <tr>
        <td height="30" align="right"><label class="yfyue-dot">主体名称：</label></td>
        <td><input type="text" name="orgeName_my_171208_1311" data-rule="required" id="orgeName_my_171208_1311" placeholder="主体名称" class="yfyue-w95"/></td>
        <td align="right" ><label>联系电话：</label></td>
        <td><input type="text" name="orgeTel_my_171208_1311" data-rule="required" id="orgeTel_my_171208_1311" placeholder="联系电话" class="yfyue-w95"/></td>
      </tr> 
      <tr>
        <td height="30" align="right"><label>邮箱：</label></td>
        <td><input type="text" name="email_my_171208_1311" data-rule="required" id="email_my_171208_1311" placeholder="邮箱" class="yfyue-w95"/></td>
        <td align="right" ><label>联系人：</label></td>
        <td><input type="text" name="linkMan_my_171208_1311" data-rule="required" id="linkMan_my_171208_1311" placeholder="联系人" class="yfyue-w95"/></td>
      </tr>  
      <tr>
        <td height="30" align="right"><label>地址：</label></td>
        <td colspan="3">
        	<textarea name="orgeAddr_my_171208_1311" placeholder="地址" id="orgeAddr_my_171208_1311" 
        			data-toggle="autoheight" class="form-control autosize" style="overflow: hidden; word-wrap: break-word; 
        			resize: horizontal; height: 45px; width:95%;"></textarea>
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
      <button type="button" data-icon="save" onclick="op_my_171208_1311();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
