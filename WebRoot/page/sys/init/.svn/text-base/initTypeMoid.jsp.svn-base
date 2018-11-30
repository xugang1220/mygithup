<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysInitAjax"></script>
<script>
jQuery(document).ready(function(){
	var p_initTypeId='${param.initTypeId}';
	SysInitAjax.getInitTypeInfo("initTypeId="+p_initTypeId,function(data){		
	 data=fjson(data);	
	 if(data.state==0){ 
	  	var json=data.object;
		$('#initTypeId_z_160822_2338').val(json.initTypeId);
		$('#typeName_z_160822_2338').val(json.typeName);
	   }else{
		  $(this).alertmsg('info',data.message);
		  $(this).dialog('closeCurrent');//关闭当前Dialog
		  $(this).navtab('reload');//重新加载当前标签
	   }
	});
})



function op_z_160822_2338(){
 if(isNull($("#initTypeId_z_160822_2338").val())){
	  $(this).alertmsg('info',"请填写类型编码");
	  return false;
 }
 if(isNull($("#typeName_z_160822_2338").val())){
	  $(this).alertmsg('info',"请填写类型名称");
	  return false;
 }

var para={
	initTypeId:$("#initTypeId_z_160822_2338").val(),
	typeName:$("#typeName_z_160822_2338").val()
	}	
    SysInitAjax.upInitType(para,function(data){
	  data=fjson(data);										 
	  if(data.state==0){
		    $(this).alertmsg('info',"数据更新成功");
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
        <td height="50" colspan="2" align="center"><h3>更新初始化数据类型名称</h3></td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label>类型名称：</label></td>
        <td width="263" >&nbsp;
          <input type="text" name="typeName_z_160822_2338" data-rule="required" id="typeName_z_160822_2338" placeholder="类型名称" size="20" />
          <input name="initTypeId_z_160822_2338" type="hidden" id="initTypeId_z_160822_2338" value="0000" /></td>
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
      <button type="button" data-icon="save" onclick="op_z_160822_2338();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
