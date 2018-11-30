<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script src="js/yfyue.orga.js" type="text/javascript"></script>
<script type="text/javascript" src="jajax/jquery.js?DiscountAjax"></script>

<script>
jQuery(document).ready(function(){
	var disId='${param.id}';
	// $("#remove_z_160830_1218").val(remove);
	DiscountAjax.getMyDiscount("id="+disId,function(data){		
	 data=fjson(data);	
	 if(data.state==0){ 
	  	 var json=data.object;
	  	 $('#disid_180623_1341').val(json.id);
		 $('#Dname_z_180622_1430').val(json.dname);
		 $('#remove_180622_1431').find("option[value='"+json.remove+"']").attr("selected",true);
		 $('#createTime_180622_1432').val(json.createTime);
		 $('#updateTime_180622_1432').val(json.updateTime);
		 $('#rechargeMoney_0622_1433').val(json.rechargeMoney);
		 $('#givingMoney_180622_1802').val(json.givingMoney);
		 $('#packgeDiscountStart_0622_1434').val(json.packgeDiscountStart);
		 $('#packgeDiscountEnd_0622_1434').val(json.packgeDiscountEnd);
		 $('#packageUseStart_0622_1435').val(json.packageUseStart);
		 $('#packageUseEnd_0622_1435').val(json.packageUseEnd);
		 $('#remove_z_160830_1218').val(json.id);
		 $('#note_1807061137').val(json.note);
	   }else{
		  $(this).alertmsg('info',data.message);
		  $(this).dialog('closeCurrent');//关闭当前Dialog
		  $(this).navtab('reload');//重新加载当前标签
	   }
	});	  
});

function up_z_180622_1508(){
	if(isNull($("#Dname_z_180622_1430").val())){
   		$(this).alertmsg('info',"请填写套餐名称");
   		return false;
  	}
	if(isNull($("#remove_z_160830_1218").val())){
   		$(this).alertmsg('info',"获取套餐状态失败");
   		return false;
  	}
	if(isNull($("#remove_180622_1431").val())){
   		$(this).alertmsg('info',"请选择套餐状态");
   		return false;
  	}
	if(isNull($("#rechargeMoney_0622_1433").val())){
		$(this).alertmsg('info',"请输入充值金额");
		return false;
	} 
 	if(isNull($("#givingMoney_180622_1802").val())){
   		$(this).alertmsg('info',"请输入优惠金额");
   		return false;
  	}
/*	if(isNull($("#packgeDiscountStart_0622_1434").val())){
   		$(this).alertmsg('info',"请选择优惠开始时间");
   		return false;
  	}
	if(isNull($("#packgeDiscountEnd_0622_1434").val())){
   		$(this).alertmsg('info',"请选择优惠结束时间");
   		return false;
  	}
	if(isNull($("#packageUseStart_0622_1435").val())){
   		$(this).alertmsg('info',"请选择有效期时间");
   		return false;
  	}
	if(isNull($("#packageUseEnd_0622_1435").val())){
   		$(this).alertmsg('info',"请选择有效期结束时间");
   		return false;
  	}  */
//更新    
   var para={
		id:$("#disid_180623_1341").val(),
		dname:$("#Dname_z_180622_1430").val(),
		 remove:$("#remove_180622_1431").val(),
	//	 createTime:$("#createTime_180622_1432").val(),
	//	 updateTime:$("#updateTime_180622_1432").val(),
		 rechargeMoney:$('#rechargeMoney_0622_1433').val(),
		 givingMoney:$('#givingMoney_180622_1802').val(),
		 packgeDiscountStart:$('#packgeDiscountStart_0622_1434').val(),
		 packgeDiscountEnd:$('#packgeDiscountEnd_0622_1434').val(),
		 packageUseStart:$('#packageUseStart_0622_1435').val(),
		 packageUseEnd:$('#packageUseEnd_0622_1435').val(),
		 note:$('#note_1807061137').val()
	   }
   DiscountAjax.upDiscountDate(para,function(data){
		 data=fjson(data);							   
		 if(data.state==0){   
		   $(this).alertmsg('info',"套餐更新成功");
		   $(this).dialog('closeCurrent');//关闭当前Dialog
		   $(this).navtab('reload');
		 }else{
		   $(this).alertmsg('info',data.message);
		}
   }) 	   
	   
}
</script>
<div class="bjui-pageContent" >
  <table class="table table-condensed table-hover">
    <tbody>
      <tr>
        <td height="50" colspan="4" align="center"><h3>编辑套餐</h3></td>
        <td><input name="disid_180623_1341" type="hidden" id="disid_180623_1341" value="0000" /></td>
      </tr>
      <tr>
        <td width="103" align="right"><label>套餐名称:</label></td>
        <td width="148"><input name="Dname_z_180622_1430" type="text" id="Dname_z_180622_1430" value=""  size="18" maxlength="16" /></td>
        <td width="107" align="right"><label>套餐状态:</label></td> 
      <td>
      	<select name="remove_180622_1431" id="remove_180622_1431"  data-rule="required">
            <option value="0000" selected="selected">请选择</option>
            <option value="0">启用</option>
            <option value="1">禁用</option>
       	</select><input name="remove_z_160830_1218" id="remove_z_160830_1218" type="hidden" value="0000" /> 
      </td>
      </tr>
       <tr> 
        <td align="right"><label>充值金额:</label></td>
        <td>
        	<input type="text" id="rechargeMoney_0622_1433" name="rechargeMoney_0622_1433"  value="" >
        </td>
        <td align="right"><label>优惠金额:</label></td>
        <td>
        	<input type="text" id="givingMoney_180622_1802" name="givingMoney_180622_1802" value=""  >
        </td>
      </tr>
     <tr>
    	<td align="right"><label>服务说明:</label></td>
     	<td>
     		<textarea id="note_1807061137" name="note_1807061137" clos="50" rows="4" >
    		</textarea>
     	</td>
    </tr>
 <!--<tr>
      	<td align="right"><label>优惠开始时间：</label></td>
        <td>
        <input type="text" name="packgeDiscountStart_0622_1434" data-pattern="yyyy-MM-dd HH:mm:ss" id="packgeDiscountStart_0622_1434" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="优惠开始时间"  size="18" maxlength="16" >
           
        <td align="right"><label>优惠结束时间：</label></td>
        <td>
        <input type="text" id="packgeDiscountEnd_0622_1434" name="packgeDiscountEnd_0622_1434" data-pattern="yyyy-MM-dd HH:mm:ss" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="优惠结束时间"  size="18" maxlength="16" >
        </td>
      </tr>
      <tr>
      	<td align="right"><label>有效期开始时间：</label></td>
        <td>
        <input type="text" name="packageUseStart_0622_1435" data-pattern="yyyy-MM-dd HH:mm:ss" id="packageUseStart_0622_1435" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="有效期开始时间"  size="18" maxlength="16" >
           
        <td align="right"><label>有效期结束时间：</label></td>
        <td>
        <input type="text" id="packageUseEnd_0622_1435" name="packageUseEnd_0622_1435" data-pattern="yyyy-MM-dd HH:mm:ss" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="有效期结束时间"  size="18" maxlength="16" >
        </td>
      </tr> -->   
    </tbody>
  </table>
</div>
<div class="bjui-pageFooter">
  <ul>
    <li>
      <button type="button" data-icon="close" class="btn-close">关闭</button>
    </li>
    <li>
      <button type="button" data-icon="save" onclick="up_z_180622_1508();" class="btn-default">保存</button>
    </li>
  </ul>
</div>