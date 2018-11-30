<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysInitAjax"></script>
<script>
jQuery(document).ready(function(){				
	var p_initDataId='${param.initDataId}';
	SysInitAjax.getInitDataInfo("initDataId="+p_initDataId,function(data){		
	 data=fjson(data);	
	 if(data.state==0){ 
	  	 var json=data.object;
		 $('#initDataId_z_160829_2242').val(json.initDataId);
		 $('#dataName_z_160829_2242').val(json.dataName);
	   }else{
		  $(this).alertmsg('info',data.message);
		  $(this).dialog('closeCurrent');//关闭当前Dialog
		  $(this).navtab('reload');//重新加载当前标签
	   }
	});	
})
function add_z_160829_2242(){
 if(isNull($("#initDataId_z_160829_2242").val())){
	  $(this).alertmsg('info',"请选择数据类型");
	  return false;
 }	
 if(isNull($("#dataName_z_160829_2242").val())){
	  $(this).alertmsg('info',"请填写数据名称");
	  return false;
 }

var para={
	dataName:$("#dataName_z_160829_2242").val(),
	initDataId:$("#initDataId_z_160829_2242").val()
	}	
    SysInitAjax.upInitData(para,function(data){
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
        <td height="50" colspan="2" align="center"><h3>更新初始化数据名称</h3></td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label>数据名称：</label></td>
        <td width="263" >
          <input type="text" name="dataName_z_160829_2242" data-rule="required" id="dataName_z_160829_2242" placeholder="类型名称" size="20" /><input name="initDataId_z_160829_2242" type="hidden" id="initDataId_z_160829_2242" value="0000" />
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
      <button type="button" data-icon="save" onclick="add_z_160829_2242();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
