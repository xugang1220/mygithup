<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?HangZhouAjax"></script>
<!-- <script src="js/yfyue.orga.js" type="text/javascript"></script> -->
<script>

	//添加嘉兴面试机会
	function addHangZhou() {

		if (isNull($("#dname_160830_2330").val())) {
			$(this).alertmsg('info', "公司名称不能为空");
			return false;
		}
		if (isNull($("#mResult_20181106").val())) {
			$(this).alertmsg('info', "请选择岗位类型");
			return false;
		}
		if (isNull($("#mAddress_20181106").val())) {
			$(this).alertmsg('info', "公司地址不能为空");
			return false;
		}
		if (isNull($("#mMdate_20181106").val())) {
			$(this).alertmsg('info', "请选择面试时间");
			return false;
		}
		if (isNull($("#mResult_20181106").val())) {
			$(this).alertmsg('info', "请选择是否查询学历");
			return false;
		}
		if (isNull($("#mDistance_20181106").val())) {
			$(this).alertmsg('info', "请输入来往距离");
			return false;
		}

		if (isNull($("#mMdate_20181106").val())) {
			$(this).alertmsg('info', "请选择套餐优惠开始时间");
			return false;
		}
		if (isNull($("#mPhone_20181106").val())) {
			$(this).alertmsg('info', "公司电话不能为空");
			return false;
		}

		if (isNull($("#mResult_20181106").val())) {
			$(this).alertmsg('info', "请选择面试结果");
			return false;
		}
		if (isNull($("#mFeel_20181106").val())) {
			$(this).alertmsg('info', "请输入自我感觉或原因");
			return false;
		}

		var para = {
				mName : $("#dname_160830_2330").val(),
				mAddress : $("#mAddress_20181106").val(),
				mMdate:$("#mMdate_20181106").val(),
				mType : $("#mType_20181106").val(),
				mEducation : $("#mEducation_20181106").val(),
				mDistance : $("#mDistance_20181106").val(),
				mPhone : $("#mPhone_20181106").val(),
				mResult : $("#mResult_20181106").val(),
				mFeel : $("#mFeel_20181106").val()
		};
		HangZhouAjax.addHangZhou(para, function(data) {
			data = fjson(data);
			if (data.state == 0) {
				$(this).alertmsg('info', data.message);
				$(this).dialog('closeCurrent');//关闭当前Dialog
				$(this).navtab('reload');//刷新当前页面
			} else {
				$(this).alertmsg('info', data.message);
			}
		});
	}
</script>
<div class="bjui-pageContent" >
  <table class="table table-condensed table-hover">
    <tbody>
      <tr>
        <td height="60" colspan="4" align="center"><h3>添加面试记录</h3></td>
      </tr>
      <tr>
        <td width="103" align="right"><label>公司名称:</label></td>
        <td width="148">
        	<input name="dname_160830_2330" type="text" id="dname_160830_2330" value=""  size="18" maxlength="16" /></td>
        <td align="right"><label>岗位类型:</label>
     <td>
      	<select name="mType_20181106" id="mType_20181106" data-toggle="selectpicker" data-rule="required">
            <option value="0000" selected="selected">请选择</option>
            <option value="0">启用</option>
            <option value="1">禁用</option>
   		</select><input name="remove_z_180622_1829" id="remove_z_180622_1829" type="hidden" value="0000" />
      </td>
      </tr>
      
       <tr> 
       	<td align="right">
       		<label>公司地址:</label>
       	</td>
        <td>
        	<input type="text" id="mAddress_20181106" name="mAddress_20181106"  value=""  size="18" maxlength="16">
        </td>
        <td align="right"><label>面试时间：</label></td>
        <td>
        <input type="text" name="mMdate_20181106" data-pattern="yyyy-MM-dd HH:mm:ss" id="mMdate_20181106" data-toggle="datepicker" data-rule="required;date" readonly  placeholder="面试时间"  size="18" maxlength="16" >
      </tr>
      <tr>
     	 <td width="107" align="right"><label>是否查学历:</label></td>
      <td>
      	<select name="mEducation_20181106" id="mEducation_20181106" data-toggle="selectpicker" data-rule="required">
            <option value="0000" selected="selected">请选择</option>
            <option value="0">会查</option>
            <option value="1">不会</option>
       	</select><input name="remove_z_180622_1829" id="remove_z_180622_1829" type="hidden" value="0000" />
      </td>
      <tr>
      	<td align="right"><label>去往距离:</label></td>
        <td>
        	<input type="text" id="mDistance_20181106" name="mDistance_20181106" value=""  size="18" maxlength="16">
        </td>
        <td align="right"><label>公司电话:</label></td>
        <td>
        	<input type="text" id="mPhone_20181106" name="mPhone_20181106" value=""  size="18" maxlength="16">
        </td>
      </tr>
      
    <tr>
    	<td width="107" align="right"><label>面试结果:</label></td>
    	<td>
	      	<select name="mResult_20181106" id="mResult_20181106" data-toggle="selectpicker" data-rule="required">
	            <option value="0000" selected="selected">请选择</option>
	            <option value="0">已面试</option>
	            <option value="1">未面试</option>
	       	</select><input name="remove_z_180622_1829" id="remove_z_180622_1829" type="hidden" value="0000" />
        </td>
    	<td align="right"><label>自我感觉:</label></td>
     	<td>
     		<textarea id="mFeel_20181106" name="mFeel_20181106" clos="50" rows="4">
    		</textarea>
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
      <button type="button" data-icon="save" onclick="addHangZhou();" class="btn-default">保存</button>
    </li>
  </ul>
</div>