<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?SysFuncAjax"></script>
<script>
function op_z_160830_1240(){	
 if(isNull($("#funcName_z_160830_1240").val())){
	  $(this).alertmsg('info',"请填写功能名称");
	  return false;
 }
var para={
	funcName:$("#funcName_z_160830_1240").val(),
	funcAlias:$("#funcAlias_z_160830_1240").val(),
	styleImg:$("#styleImg_z_160830_1240").val()
	}	
    SysFuncAjax.addFuncOne(para,function(data){
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
        <td height="50" colspan="4" align="center"><h3>添加功能根节点</h3></td>
      </tr>
      <tr>
        <td width="121" height="30" align="right"><label>功能名称：</label></td>
        <td width="166" >
          <input type="text" name="funcName_z_160830_1240" data-rule="required" id="funcName_z_160830_1240" placeholder="功能名称" size="20" /></td>
        <td width="102" align="right" >功能别名：</td>
        <td width="161" ><input type="text" name="funcAlias_z_160830_1240" data-rule="required" id="funcAlias_z_160830_1240" placeholder="功能别名" size="20" /></td>
      </tr>
      
            <tr>
        <td width="121" height="30" align="right"><label>样式：</label></td>
        <td colspan="3" ><textarea name="styleImg_z_160830_1240" id="styleImg_z_160830_1240" class="form-control autosize"  style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 30px; width: 400px;" placeholder="节点显示样式" data-toggle="autoheight"></textarea></td>
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
      <button type="button" data-icon="save" onclick="op_z_160830_1240();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
