<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysOrgeAjax"></script>
<script type = "text/javascript">		
  var p_superiorOrgeId='${param.superiorOrgeId}';
  $("#superiorOrgeId_z_171002_1211").val(p_superiorOrgeId);
</script>
<script>
function op_z_171002_1211(){	
 if(isNull($("#superiorOrgeId_z_171002_1211").val())){
	  $(this).alertmsg('info',"获取上级部门ID失败");
	  return false;
 } 
 if(isNull($("#orgeFullName_z_171002_1211").val())){
	$(this).alertmsg('info',"请填写组织全称");
	return false;
 }
 if(isLong($("#orgeFullName_z_171002_1211").val(),64)){
	$(this).alertmsg('info',"全称最大支持64个字符");
	return false;
 }
 if(isNull($("#orgeName_z_171002_1211").val())){
	  $(this).alertmsg('info',"请填写组织简称");
	  return false;
 }
 if(isLong($("#orgeName_z_171002_1211").val(),8)){
	$(this).alertmsg('info',"简称最大支持8个字符");
	return false;
 } 
 if(isNonNull($("#linkMan_z_171002_1211").val())){
	 if(isLong($("#linkMan_z_171002_1211").val(),128)){
		$(this).alertmsg('info',"最大支持128个字符");
		$("#linkMan_z_171002_1211").focus();
		return false;
	 } 
 }
var para={
	orgeFullName:$("#orgeFullName_z_171002_1211").val(),
	orgeName:$("#orgeName_z_171002_1211").val(),
	orgeTel:$("#orgeTel_z_171002_1211").val(),
	email:$("#email_z_171002_1211").val(),
	linkMan:$("#linkMan_z_171002_1211").val(),
	superiorOrgeId:$("#superiorOrgeId_z_171002_1211").val(),
	orgeAddr:$("#orgeAddr_z_171002_1211").val()
	}	
    SysOrgeAjax.addOrge(para,function(data){
	  data=fjson(data);										 
	  if(data.state==0){
		    $(this).alertmsg('info',"添加成功");
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
        <td height="50" colspan="4" align="center"><h3>添加组织</h3></td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label class="yfyue-dot">组织全称：</label></td>
        <td colspan="3" >
          <input type="text" name="orgeFullName_z_171002_1211" data-rule="required" id="orgeFullName_z_171002_1211" placeholder="组织全称" class="yfyue-w80"/>
          <input type="hidden" name="superiorOrgeId_z_171002_1211" id="superiorOrgeId_z_171002_1211" />
          </td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label class="yfyue-dot">组织简称：</label></td>
        <td width="190" ><input type="text" name="orgeName_z_171002_1211" data-rule="required" id="orgeName_z_171002_1211" placeholder="组织简称" class="yfyue-w95"/></td>
        <td width="121" align="right" ><label>组织电话：</label></td>
        <td width="192" ><input type="text" name="orgeTel_z_171002_1211" data-rule="required" id="orgeTel_z_171002_1211" placeholder="组织电话" class="yfyue-w95"/></td>
      </tr> 
            <tr>
        <td width="121" height="30" align="right"><label>组织邮箱：</label></td>
        <td width="190" ><input type="text" name="email_z_171002_1211" data-rule="required" id="email_z_171002_1211" placeholder="组织邮箱" class="yfyue-w95"/></td>
        <td width="121" align="right" ><label>组织联系人：</label></td>
        <td width="192" >          <input type="text" name="linkMan_z_171002_1211" data-rule="required" id="linkMan_z_171002_1211" placeholder="组织联系人" class="yfyue-w95"/>
        </td>
      </tr>  
                  <tr>
        <td width="121" height="30" align="right"><label>组织地址：</label></td>
        <td colspan="3" >
          <input type="text" name="orgeAddr_z_171002_1211" data-rule="required" id="orgeAddr_z_171002_1211" placeholder="组织地址" class="yfyue-w80"/>
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
      <button type="button" data-icon="save" onclick="op_z_171002_1211();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
