<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?DiscountAjax"></script>
<!-- <script src="js/yfyue.orga.js" type="text/javascript"></script> -->
<script>

//添加套餐	
function addDiscount1806221708(){
	
	 if(isNull($("#dname_160830_2330").val())){
	   $(this).alertmsg('info',"套餐名称不能为空");
	   return false;
	}
	 if(isNull($("#remove_160830_2330").val())){
	   $(this).alertmsg('info',"请选择套餐状态");
	   return false;
	}  
	 if(isNull($("#rechargeMoney_160830_2330").val())){
	   $(this).alertmsg('info',"请填写套餐充值金额");
	   return false;
	}   
	 if(isNull($("#givingMoney_160830_2330").val())){
	   $(this).alertmsg('info',"请填写优惠金额");
	   return false;
	}
	 /*
	 if(isNull($("#packgeDiscountStart_160830_2330").val())){
	   $(this).alertmsg('info',"请选择套餐优惠开始时间");
	   return false;
	} 
	 if(isNull($("#packgeDiscountEnd_160830_2330").val())){
		   $(this).alertmsg('info',"请选择套餐优惠结束时间");
		   return false;
	} 
	 if(isNull($("#packageUseStart_160830_2330").val())){
		   $(this).alertmsg('info',"请选择套餐有效期开始时间");
		   return false;
	}
	 if(isNull($("#packageUseEnd_160830_2330").val())){
		   $(this).alertmsg('info',"请选择套餐有效期结束时间");
		   return false;
	}
	 */
   var para={
	    dname:$("#dname_160830_2330").val(),
		remove:$("#remove_160830_2330").val(),
	//	createTime:$("#createTime_160830_2330").val(),
		rechargeMoney:$("#rechargeMoney_160830_2330").val(),
		givingMoney:$("#givingMoney_160830_2330").val(),
		packgeDiscountStart:$("#packgeDiscountStart_160830_2330").val(),
	   	packgeDiscountEnd:$("#packgeDiscountEnd_160830_2330").val(),	
	   	packageUseStart:$("#packageUseStart_160830_2330").val(),	
	   	packageUseEnd:$("#packageUseEnd_160830_2330").val(),
	   	note:$("#note_1807061124").val()
	   };
   DiscountAjax.addDiscount(para,function(data){
		data=fjson(data);							   
		if(data.state==0){   
		   $(this).alertmsg('info',data.message);
		   $(this).dialog('closeCurrent');//关闭当前Dialog
		   $(this).navtab('reload');//刷新当前页面
		}else{
		   $(this).alertmsg('info',data.message);
		}
   });
 }	   
</script>
<div class="bjui-pageContent" >
  <table class="table table-condensed table-hover">
    <tbody>
      <tr>
        <td height="60" colspan="4" align="center"><h3>添加套餐</h3></td>
      </tr>
      <tr>
        <td width="103" align="right"><label>套餐名称:</label></td>
        <td width="148"><input name="dname_160830_2330" type="text" id="dname_160830_2330" value=""  size="18" maxlength="16" /></td>
        <td width="107" align="right"><label>套餐状态:</label></td>
     <td>
      	<select name="remove_160830_2330" id="remove_160830_2330" data-toggle="selectpicker" data-rule="required">
            <option value="0000" selected="selected">请选择</option>
            <option value="0">启用</option>
            <option value="1">禁用</option>
       	</select><input name="remove_z_180622_1829" id="remove_z_180622_1829" type="hidden" value="0000" />
      </td>
      </tr>
       <tr> 
        <td align="right"><label>充值金额:</label></td>
        <td>
        	<input type="text" id="rechargeMoney_160830_2330" name="rechargeMoney_160830_2330"  value=""  size="18" maxlength="16">
        </td>
        	<td align="right"><label>优惠金额:</label></td>
        <td>
        	<input type="text" id="givingMoney_160830_2330" name="givingMoney_160830_2330" value=""  size="18" maxlength="16">
        </td>
      </tr>
    <tr>
    	<td align="right"><label>服务说明:</label></td>
     	<td>
     		<textarea id="note_1807061124" name="note_1807061124" clos="50" rows="4">
    		</textarea>
     	</td>
    </tr>
 <!-- <tr>
      	<td align="right"><label>优惠开始时间：</label></td>
        <td>
        <input type="text" name="packgeDiscountStart_160830_2330" data-pattern="yyyy-MM-dd HH:mm:ss" id="packgeDiscountStart_160830_2330" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="优惠开始时间"  size="18" maxlength="16" >
           
        <td align="right"><label>优惠结束时间：</label></td>
        <td>
        <input type="text" id="packgeDiscountEnd_160830_2330" name="packgeDiscountEnd_160830_2330" data-pattern="yyyy-MM-dd HH:mm:ss" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="优惠结束时间"  size="18" maxlength="16" >
        </td>
      </tr>
      <tr>
      	<td align="right"><label>有效期开始时间：</label></td>
        <td>
        <input type="text" name="packageUseStart_160830_2330" data-pattern="yyyy-MM-dd HH:mm:ss" id="packageUseStart_160830_2330" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="有效期开始时间"  size="18" maxlength="16" >
           
        <td align="right"><label>有效期结束时间：</label></td>
        <td>
        <input type="text" id="packageUseEnd_160830_2330" name="packageUseEnd_160830_2330" data-pattern="yyyy-MM-dd HH:mm:ss" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="有效期结束时间"  size="18" maxlength="16" >
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
      <button type="button" data-icon="save" onclick="addDiscount1806221708();" class="btn-default">保存</button>
    </li>
  </ul>
</div>