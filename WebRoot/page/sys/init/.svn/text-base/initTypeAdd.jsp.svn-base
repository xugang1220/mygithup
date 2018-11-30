<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysInitAjax"></script>
<script>
function add_z_160829_2118(){
 if(isNull($("#typeCode_z_160829_2118").val())){
	  $(this).alertmsg('info',"请填写类型编码");
	  return false;
 }
 if(isEorN($("#typeCode_z_160829_2118").val())){
	   $(this).alertmsg('info',"编码必须是非汉字");
	  return false; 
 }
 if(isNull($("#typeName_z_160829_2118").val())){
	  $(this).alertmsg('info',"请填写类型名称");
	  return false;
 }

var para={
	typeName:$("#typeName_z_160829_2118").val(),
	typeCode:$("#typeCode_z_160829_2118").val()
	}	
    SysInitAjax.addInitType(para,function(data){
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
        <td height="50" colspan="2" align="center"><h3>添加初始化数据类型</h3></td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label>类型编码：</label></td>
        <td width="263" >&nbsp;
          <input name="typeCode_z_160829_2118" type="text" id="typeCode_z_160829_2118" size="20" maxlength="16"  aria-required="true" placeholder="类型编码" /></td>
      </tr>
      <tr>
        <td height="30" align="right"><label>类型名称：</label></td>
        <td >&nbsp;
          <input type="text" name="typeName_z_160829_2118" data-rule="required" id="typeName_z_160829_2118" placeholder="类型名称" size="20" /></td>
      </tr>
            <tr>
        <td height="30" colspan="2" align="center"></td>
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
      <button type="button" data-icon="save" onclick="add_z_160829_2118();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
