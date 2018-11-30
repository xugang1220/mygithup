<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysFuncAjax"></script>
<script>
jQuery(document).ready(function(){				
    var p_funcId='${param.funcId}';
  	SysFuncAjax.getFuncInfo("funcId="+p_funcId,function(data){		
	 data=fjson(data);	
	 if(data.state==0){ 
	  	 var json=data.object;
		 $('#funcName_z_160830_1330').val(json.funcName);
		// $('#isLeaf_z_160830_1330').selectpicker('val', json.isLeaf);
		 $('#isLeaf_z_160830_1330').find("option[value='"+json.isLeaf+"']").attr("selected",true);
		// $('#isLeaf_z_160830_1330').selectpicker('refresh');
		 $('#funcUrl_z_160830_1330').val(json.funcUrl);
		 $('#funcAlias_z_160830_1330').val(json.funcAlias);
		 $('#funcOrder_z_160830_1330').val(json.funcOrder);
		 $('#styleImg_z_160830_1330').val(json.styleImg);
		 $('#funcId_z_160830_1330').val(json.funcId);

	   }else{
		  $(this).alertmsg('info',data.message);
		  $(this).dialog('closeCurrent');//关闭当前Dialog
		  $(this).navtab('reload');//重新加载当前标签
	   }
	});	
})

function op_z_160830_1330(){	
 if(isNull($("#funcId_z_160830_1330").val())){
	  $(this).alertmsg('info',"获取节点ID失败");
	  return false;
 }
 if(isNull($("#funcName_z_160830_1330").val())){
	  $(this).alertmsg('info',"请填写地区名称");
	  return false;
 }
 if(isNull($("#isLeaf_z_160830_1330").val())){
	  $(this).alertmsg('info',"请选择是否叶子接点");
	  return false;
 }
 if(isNull($("#funcUrl_z_160830_1330").val())){
	  $(this).alertmsg('info',"请填写功能地址");
	  return false;
 }
if(isNumber($("#funcOrder_z_160830_1330").val())){ 
 	  $(this).alertmsg('info',"排序必须为正整数");
	  return false;
}
var para={
	funcName:$("#funcName_z_160830_1330").val(),
	funcUrl:$("#funcUrl_z_160830_1330").val(),
	funcId:$("#funcId_z_160830_1330").val(),
	supperFuncId:$("#supperFuncId_z_160830_1330").val(),
	isLeaf:$("#isLeaf_z_160830_1330").val(),
	funcAlias:$("#funcAlias_z_160830_1330").val(),
	funcOrder:$("#funcOrder_z_160830_1330").val(),
	styleImg:$("#styleImg_z_160830_1330").val()
	}	
    SysFuncAjax.upFunc(para,function(data){
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
        <td height="50" colspan="4" align="center"><h3>更新功能信息</h3></td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label>功能名称：</label></td>
        <td width="166" >
          <input type="text" name="funcName_z_160830_1330" data-rule="required" id="funcName_z_160830_1330" placeholder="功能名称" size="20" /></td>
        <td width="102" align="right" ><label>是否叶子：</label></td>
        <td width="161" >
        <select name="isLeaf_z_160830_1330" id="isLeaf_z_160830_1330" class="yfyue-select" data-rule="required">
            <option value="0000" selected="selected">请选择</option>
            <option value="0">非叶子</option>
            <option value="1">叶子</option>
        </select>
        <input name="funcId_z_160830_1330" id="funcId_z_160830_1330" type="hidden" value="0000" /></td>
      </tr>
      
            <tr>
        <td width="121" height="30" align="right"><label>功能地址：</label></td>
        <td colspan="3" >
          <input type="text" name="funcUrl_z_160830_1330" data-rule="required" id="funcUrl_z_160830_1330" placeholder="功能地址" size="40" /></td>
      </tr>
      
            <tr>
        <td width="121" height="30" align="right"><label>功能别名：</label></td>
        <td width="166" >
          <input type="text" name="funcAlias_z_160830_1330" data-rule="required" id="funcAlias_z_160830_1330" placeholder="功能别名" size="20" /></td>
        <td width="102" align="right" >排序：</td>
        <td width="161" ><input type="text" name="funcOrder_z_160830_1330" id="funcOrder_z_160830_1330" value="1" size="5" data-toggle="spinner" data-min="0" data-max="100" data-step="1" data-rule="integer"></td>
      </tr>
      
            <tr>
        <td width="121" height="30" align="right"><label>样式：</label></td>
        <td colspan="3" ><textarea name="styleImg_z_160830_1330" id="styleImg_z_160830_1330" class="form-control autosize"  style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 30px; width: 400px;" placeholder="样式" data-toggle="autoheight"></textarea></td>
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
      <button type="button" data-icon="save" onclick="op_z_160830_1330();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
