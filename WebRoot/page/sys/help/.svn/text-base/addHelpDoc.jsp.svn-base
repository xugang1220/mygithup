<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?HelpDocAjax"></script>
<script>
var editor_z_160927_2133;
jQuery(document).ready(function(){				
  editor_z_160927_2133 = KindEditor.create('textarea[name="docContent_z_160927_2133"]', {
	items:['source', '|', 'undo', 'redo', '|', 'preview', 'template',  'cut', 'copy', 'paste',
           'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
           'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
           'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '|',
           'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
           'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
          , 'table', 'hr', 'emoticons', 'pagebreak',
           'anchor', 'link', 'unlink'
		  ],
	height:"280px",width:"95%",uploadJson:"<%=path%>/KindEditor.file"});
})
function op_z_160927_2133(){	
 if(isNull($("#docTitle_z_160927_2133").val())){
	  $(this).alertmsg('info',"请填写文档主题");
	  return false;
 }
 if(isNull(editor_z_160927_2133.html())){
	  $(this).alertmsg('info',"请填写文档内容");
	  return false;
 }
 if(isNull($("#docCode_z_160927_2133").val())){
	  $(this).alertmsg('info',"请填写文档编码");
	  return false;
 } 
 if(isEorN($("#docCode_z_160927_2133").val())){
	  $(this).alertmsg('info',"编码只能是字母或数字");
	  return false;
 }  
 if(isNumber($("#docOrder_z_160927_2133").val())){
 	$(this).alertmsg('info',"排序数必须正整数");
	return false;
 } 
var para={
	docOrder:$("#docOrder_z_160927_2133").val(),
	docCode:$("#docCode_z_160927_2133").val(),
	docTitle:$("#docTitle_z_160927_2133").val(),
	docContent:editor_z_160927_2133.html()
	}	
    HelpDocAjax.addHelpDoc(para,function(data){
	  data=fjson(data);										 
	   if(data.state==0){
		 $(this).alertmsg('info',"添加成功");
         $(this).dialog('closeCurrent');//关闭当前Dialog
	     $(this).navtab('reload');//重新加载当前标签
	   }else{
		 $(this).alertmsg('info',data.message);
		 if(data.state==-997){
			 goLogin();
		 }
	  }
   });
}
</script>
<div class="bjui-pageContent">
  <table class="table table-condensed table-hover">
    <tbody>
      <tr>
        <td height="50" colspan="4" align="center"><h3>添加帮助文档</h3></td>
      </tr>
      <tr>
        <td width="108" height="30" align="right"><label>文档主题：</label></td>
        <td colspan="3" >
          <input type="text" name="docTitle_z_160927_2133" data-rule="required" id="docTitle_z_160927_2133" placeholder="文档主题" size="45" /></td>
      </tr>
        <tr>
        <td width="108" height="30" align="right"><label>文档编码：</label></td>
        <td width="156" ><input name="docCode_z_160927_2133" type="text" id="docCode_z_160927_2133" size="12" maxlength="12" /></td>
        <td width="81"  align="right"><label>排序：</label></td>
        <td width="245"  ><input type="text" name="docOrder_z_160927_2133" id="docOrder_z_160927_2133" value="1" size="8" data-toggle="spinner" data-min="1" data-max="10000" data-step="1" data-rule="integer"></td>
      </tr>
             <tr>
        <td width="108" height="30" align="right"><label>文档内容：</label></td>
        <td colspan="3" ><textarea id="docContent_z_160927_2133" name="docContent_z_160927_2133"></textarea>
        
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
      <button type="button" data-icon="save" onclick="op_z_160927_2133();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
