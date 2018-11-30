<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysFuncAjax"></script>
<script>
jQuery(document).ready(function(){				
   var p_supperFuncId='${param.supperFuncId}';
   $("#supperFuncId_z_160830_1218").val(p_supperFuncId);
})

function op_z_160830_1218(){	
 if(isNull($("#supperFuncId_z_160830_1218").val())){
	  $(this).alertmsg('info',"获取上级节点ID失败");
	  return false;
 }
 if(isNull($("#funcName_z_160830_1218").val())){
	  $(this).alertmsg('info',"请填写地区名称");
	  return false;
 }
 if(isNull($("#isLeaf_z_160830_1218").val())){
	  $(this).alertmsg('info',"请选择是否叶子接点");
	  return false;
 }
 if(isNull($("#funcUrl_z_160830_1218").val())){
	  $(this).alertmsg('info',"请填写功能地址");
	  return false;
 }
 if(isNumber($("#funcOrder_z_160830_1218").val())){ 
 	  $(this).alertmsg('info',"排序必须为正整数");
	  return false;
}
var para={
	funcName:$("#funcName_z_160830_1218").val(),
	funcUrl:$("#funcUrl_z_160830_1218").val(),
	supperFuncId:$("#supperFuncId_z_160830_1218").val(),
	isLeaf:$("#isLeaf_z_160830_1218").val(),
	funcAlias:$("#funcAlias_z_160830_1218").val(),
	funcOrder:$("#funcOrder_z_160830_1218").val(),
	styleImg:$("#styleImg_z_160830_1218").val()
	}	
    SysFuncAjax.addFunc(para,function(data){
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
        <td height="50" colspan="4" align="center"><h3>添加功能</h3></td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label>功能名称：</label></td>
        <td width="166" >
          <input type="text" name="funcName_z_160830_1218" data-rule="required" id="funcName_z_160830_1218" placeholder="功能名称" size="20" /></td>
        <td width="102" align="right" ><label>是否叶子：</label></td>
        <td width="161" >
        <select name="isLeaf_z_160830_1218" id="isLeaf_z_160830_1218" data-toggle="selectpicker" data-rule="required">
                            <option value="0000" selected="selected">请选择</option>
                            <option value="0">非叶子</option>
                            <option value="1">叶子</option>
        </select><input name="supperFuncId_z_160830_1218" id="supperFuncId_z_160830_1218" type="hidden" value="0000" /></td>
      </tr>
      
            <tr>
        <td width="121" height="30" align="right"><label>功能地址：</label></td>
        <td colspan="3" >
          <input type="text" name="funcUrl_z_160830_1218" data-rule="required" id="funcUrl_z_160830_1218" placeholder="功能地址" size="50" /></td>
      </tr>
      
            <tr>
        <td width="121" height="30" align="right"><label>功能别名：</label></td>
        <td width="166" >
          <input type="text" name="funcAlias_z_160830_1218" data-rule="required" id="funcAlias_z_160830_1218" placeholder="功能别名" size="20" /></td>
        <td width="102" align="right" >排序：</td>
        <td width="161" ><input type="text" name="funcOrder_z_160830_1218" id="funcOrder_z_160830_1218" value="1" size="5" data-toggle="spinner" data-min="0" data-max="100" data-step="1" data-rule="integer"></td>
      </tr>
      
            <tr>
        <td width="121" height="30" align="right"><label>样式：</label></td>
        <td colspan="3" ><textarea name="styleImg_z_160830_1218" id="styleImg_z_160830_1218" class="form-control autosize"  style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 30px; width: 400px;" placeholder="样式" data-toggle="autoheight"></textarea></td>
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
      <button type="button" data-icon="save" onclick="op_z_160830_1218();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
