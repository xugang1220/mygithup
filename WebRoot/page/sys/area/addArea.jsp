<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysAreaAjax"></script>
<script>
jQuery(document).ready(function(){				
   var p_supperCode='${param.supperCode}';
   $("#supperCode_z_160830_1103").val(p_supperCode);
})

function op_z_160830_1103(){	
 if(isNull($("#supperCode_z_160830_1103").val())){
	  $(this).alertmsg('info',"获取上级节点编码失败");
	  return false;
 }
 if(isNull($("#areaName_z_160830_1103").val())){
	  $(this).alertmsg('info',"请填写地区名称");
	  return false;
 }
 if(isNull($("#areaCode_z_160830_1103").val())){
	  $(this).alertmsg('info',"请填写地区编码");
	  return false;
 }
 if(isNumber($("#areaCode_z_160830_1103").val())){
 	  $(this).alertmsg('info',"地区编码请填写数字");
	  return false;
 }
var para={
	areaName:$("#areaName_z_160830_1103").val(),
	areaCode:$("#areaCode_z_160830_1103").val(),
	supperCode:$("#supperCode_z_160830_1103").val()
	}	
    SysAreaAjax.addArea(para,function(data){
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
        <td height="50" colspan="2" align="center"><h3>添加地区</h3></td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label>地区名称：</label></td>
        <td width="263" >
          <input type="text" name="areaName_z_160830_1103" data-rule="required" id="areaName_z_160830_1103" placeholder="地区名称" size="20" />
          <input name="supperCode_z_160830_1103" type="hidden" id="supperCode_z_160830_1103" value="0000" /></td>
      </tr>
       <tr>
        <td width="121" height="30" align="right"><label>地区编码：</label></td>
        <td width="263" >
          <input name="areaCode_z_160830_1103" type="text"  id="areaCode_z_160830_1103" size="20" maxlength="2" placeholder="地区编码" data-rule="integer"/>
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
      <button type="button" data-icon="save" onclick="op_z_160830_1103();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
