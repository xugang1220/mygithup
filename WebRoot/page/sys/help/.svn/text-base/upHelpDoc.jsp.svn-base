<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?HelpDocAjax"></script>
<script>
var editor_z_160927_2214;
jQuery(document).ready(function(){				
  editor_z_160927_2214 = KindEditor.create('textarea[name="docContent_z_160927_2214"]', {
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
  
  //取数据
    var p_docId='${param.docId}';
	//alert(p_docId);
  	HelpDocAjax.getHelpDocInfo("docId="+p_docId,function(data){	
	 //alert(data);													 
	 data=fjson(data);	
	 if(data.state==0){ 
	  	 var json=data.object;
		 $('#docId_z_160927_2214').val(json.docId);
		 $('#docCode_z_160927_2214').val(json.docCode);
		 $('#docTitle_z_160927_2214').val(json.docTitle);
		 $('#docOrder_z_160927_2214').val(json.docOrder);
		 editor_z_160927_2214.html(json.docContent);
	   }else{
		  $(this).alertmsg('info',data.message);
		  $(this).dialog('closeCurrent');//关闭当前Dialog
		  $(this).navtab('reload');//重新加载当前标签
	   }
	});   
})
function op_z_160927_2214(){	
 if(isNull($("#docId_z_160927_2214").val())){
	  $(this).alertmsg('info',"获取文档ID失败");
	  return false;
 } 
 if(isNull($("#docTitle_z_160927_2214").val())){
	  $(this).alertmsg('info',"请填写文档主题");
	  return false;
 }
 if(isNull(editor_z_160927_2214.html())){
	  $(this).alertmsg('info',"请填写文档内容");
	  return false;
 } 
 if(isNumber($("#docOrder_z_160927_2214").val())){
 	$(this).alertmsg('info',"排序数必须正整数");
	return false;
 } 
var para={
	docOrder:$("#docOrder_z_160927_2214").val(),
	docId:$("#docId_z_160927_2214").val(),
	docTitle:$("#docTitle_z_160927_2214").val(),
	docContent:editor_z_160927_2214.html()
	}	
    HelpDocAjax.upHelpDoc(para,function(data){
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
        <td height="50" colspan="4" align="center"><h3>更新帮助文档</h3></td>
      </tr>
      <tr>
        <td width="108" height="30" align="right"><label>文档主题：</label></td>
        <td colspan="3" >
          <input type="text" name="docTitle_z_160927_2214" data-rule="required" id="docTitle_z_160927_2214" placeholder="文档主题" size="45" />
          <input name="docId_z_160927_2214" type="hidden" id="docId_z_160927_2214" value="0000" /></td>
      </tr>
        <tr>
        <td width="108" height="30" align="right"><label>文档编码：</label></td>
        <td width="156" ><input name="docCode_z_160927_2214" type="text" id="docCode_z_160927_2214" size="12" maxlength="12" readonly="readonly" /></td>
        <td width="81"  align="right"><label>排序：</label></td>
        <td width="245"  ><input type="text" name="docOrder_z_160927_2214" id="docOrder_z_160927_2214" value="1" size="8" data-toggle="spinner" data-min="1" data-max="10000" data-step="1" data-rule="integer"></td>
      </tr>
             <tr>
        <td width="108" height="30" align="right"><label>文档内容：</label></td>
        <td colspan="3" ><textarea id="docContent_z_160927_2214" name="docContent_z_160927_2214"></textarea>
        
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
      <button type="button" data-icon="save" onclick="op_z_160927_2214();" class="btn-default">保存</button>
    </li>
  </ul>
</div>
