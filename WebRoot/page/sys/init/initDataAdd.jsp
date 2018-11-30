<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysInitAjax"></script>
<script>
function initTypeSelect_z_160829_2205(selectID,selectName){    
   SysInitAjax.getInitTypeAllList(null, function (data) {
  	data = fjson(data);
  	if (data.state == 0) {
  		var json = data.object;
  		var str = JSON.stringify(json);
  		if (str.indexOf('[') != 0) {
  			json = JSON.parse('[' + str + ']')
  		}
  		//下拿
		//debugger;
		if(isNonNull(json)){
			selectID.find("option").remove();
			selectID.append("<option value='0000'>"+selectName+"");
			for(var n=0;n<json.length;n++){
				 selectID.append("<option  value='"+json[n].typeCode+"'>"+json[n].typeName);
				}
			    selectID.selectpicker('refresh');
			 // mySelect.find('option:disabled').prop('disabled', false);
			 // mySelect.find('option:selected').prop('disabled', true);
		}else{
		   selectID.append("<option value='0000'>"+selectName+"");
		}
  	}else{
		$(this).alertmsg('info',data.message);
	}
  });
}
jQuery(document).ready(function(){				
	initTypeSelect_z_160829_2205(jQuery("#typeCode_z_160829_2205"),"数据类型");	
})
function add_z_160829_2205(){
 if(isNull($("#typeCode_z_160829_2205").val())){
	  $(this).alertmsg('info',"请选择数据类型");
	  return false;
 }	
 if(isNull($("#dataCode_z_160829_2205").val())){
	  $(this).alertmsg('info',"请填写数据编码");
	  return false;
 }
 if(isEorN($("#dataCode_z_160829_2205").val())){
	   $(this).alertmsg('info',"编码必须是非汉字");
	  return false; 
 }
 if(isNull($("#dataName_z_160829_2205").val())){
	  $(this).alertmsg('info',"请填写数据名称");
	  return false;
 }

var para={
	dataName:$("#dataName_z_160829_2205").val(),
	dataCode:$("#dataCode_z_160829_2205").val(),
	dataTypeCode:$("#typeCode_z_160829_2205").val()
	}	
    SysInitAjax.addInitData(para,function(data){
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
        <td height="50" colspan="2" align="center"><h3>添加初始化数据</h3></td>
      </tr>
            <tr>
        <td width="121" height="30" align="right"><label>数据类型：</label></td>
        <td width="263" >
            <select data-toggle="selectpicker" id="typeCode_z_160829_2205" name="typeCode_z_160829_2205">
       		<option value='0000'>数据类型</option>
    		</select></td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label>数据编码：</label></td>
        <td width="263" >
          <input name="dataCode_z_160829_2205" type="text" id="dataCode_z_160829_2205" size="20" maxlength="16"  aria-required="true" placeholder="类型编码" /></td>
      </tr>
      <tr>
        <td height="30" align="right"><label>数据名称：</label></td>
        <td >
          <input type="text" name="dataName_z_160829_2205" data-rule="required" id="dataName_z_160829_2205" placeholder="类型名称" size="20" /></td>
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
      <button type="button" data-icon="save" onclick="add_z_160829_2205();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
