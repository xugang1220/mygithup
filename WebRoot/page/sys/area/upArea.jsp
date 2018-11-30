<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysAreaAjax"></script>
<script>
jQuery(document).ready(function(){				
   var p_areaCode='${param.areaCode}';
  	SysAreaAjax.getAreaInfo("areaCode="+p_areaCode,function(data){		
	 data=fjson(data);	
	 if(data.state==0){ 
	  	 var json=data.object;
		 $('#areaCode_z_160830_1120').val(json.areaCode);
		 $('#areaName_z_160830_1120').val(json.areaName);
	   }else{
		  $(this).alertmsg('info',data.message);
		  $(this).dialog('closeCurrent');//关闭当前Dialog
		  $(this).navtab('reload');//重新加载当前标签
	   }
	});	
})

function op_z_160830_1120(){	
 if(isNull($("#areaCode_z_160830_1120").val())){
	  $(this).alertmsg('info',"获取节点编码失败");
	  return false;
 }
 if(isNull($("#areaName_z_160830_1120").val())){
	  $(this).alertmsg('info',"请填写地区名称");
	  return false;
 }

var para={
	areaName:$("#areaName_z_160830_1120").val(),
	areaCode:$("#areaCode_z_160830_1120").val()
	}	
    SysAreaAjax.upArea(para,function(data){
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
        <td height="50" colspan="2" align="center"><h3>更新地区名称</h3></td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label>地区名称：</label></td>
        <td width="263" >
          <input type="text" name="areaName_z_160830_1120" data-rule="required" id="areaName_z_160830_1120" placeholder="地区名称" size="20" />
          <input name="areaCode_z_160830_1120" type="hidden" id="areaCode_z_160830_1120" value="0000" /></td>
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
      <button type="button" data-icon="save" onclick="op_z_160830_1120();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
