<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysButtonAjax"></script>
<script>
jQuery(document).ready(function(){				
   var p_funcId='${param.funcId}';
   $("#funcId_z_160901_2040").val(p_funcId);
})

function op_z_160901_2040(){	
 if(isNull($("#funcId_z_160901_2040").val())){
	  $(this).alertmsg('info',"获取功能ID失败");
	  return false;
 }
 if(isNull($("#buttonName_z_160901_2040").val())){
	  $(this).alertmsg('info',"请填写按钮名称");
	  return false;
 }

 if(isNull($("#buttonHtml_z_160901_2040").val())){
	  $(this).alertmsg('info',"请填写按钮HTML");
	  return false;
 }
var para={
	funcId:$("#funcId_z_160901_2040").val(),
	buttonHtml:$("#buttonHtml_z_160901_2040").val(),
	buttonName:$("#buttonName_z_160901_2040").val()
	}	
    SysButtonAjax.addButton(para,function(data){
	  data=fjson(data);										 
	  if(data.state==0){
		    $(this).alertmsg('info',"添加成功");
            $(this).dialog('closeCurrent');//关闭当前Dialog
			//$(this).refresh('a_z_160826_0856');//重新加载当前标签
			//dialog.refresh('a_z_160826_0856');
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
        <td height="50" colspan="4" align="center"><h3>添加按钮</h3></td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label>按钮名称：</label></td>
        <td width="166" >
          <input type="text" name="buttonName_z_160901_2040" data-rule="required" id="buttonName_z_160901_2040" placeholder="按钮名称" size="20" />
          <input name="funcId_z_160901_2040" id="funcId_z_160901_2040" type="hidden" value="0000" /></td>
        <td width="102" align="right" >&nbsp;</td>
        <td width="161" >&nbsp;</td>
      </tr>
      
            <tr>
        <td width="121" height="30" align="right"><label>按钮HTML：</label></td>
        <td colspan="3" ><textarea name="buttonHtml_z_160901_2040" id="buttonHtml_z_160901_2040" class="form-control autosize"  style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 50px; width: 400px;" placeholder="按钮HTML" data-toggle="autoheight"></textarea></td>
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
      <button type="button" data-icon="save" onclick="op_z_160901_2040();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
