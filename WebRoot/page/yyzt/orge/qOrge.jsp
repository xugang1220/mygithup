<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="jajax/jquery.js?OpOrgeAjax"></script>
<script src="js/yfyue.js"></script>
<script>
jQuery(document).ready(function(){				
	var para = {
		orgeId : '${param.orgeId}'
	}
    OpOrgeAjax.getOrgeInfo(para,function(data){
    	//alert(data);
    	unloading();
    	data = fjson(data);										 
	  	if(data.state==0){//成功
	  		var json = data.object;
	  		$("#orgeFullName_my_171215_1251").html(ifNull(json.orgeFullName));
	  		$("#orgeName_my_171215_1251").html(ifNull(json.orgeName));
	  		$("#orgeType_my_171215_1251").html(initToName(ifNull(json.orgeType)));
	  		$("#linkMan_my_171215_1251").html(ifNull(json.linkMan));
	  		$("#orgeTel_my_171215_1251").html(ifNull(json.orgeTel));
	  		$("#orgeAddr_my_171215_1251").html(ifNull(json.orgeAddr));
	  		$("#email_my_171215_1251").html(ifNull(json.email));
	  		$("#orgeState_my_171215_1251").html(stateToStr_my_171215_1251(ifNull(json.orgeState)));
	  		$("#loadTime_my_171215_1251").html(ifNull(json.loadTime));
	  		$("#upTime_my_171215_1251").html(ifNull(json.upTime));
		}else{
		    $(this).alertmsg('info',data.message);
		    $(this).dialog('closeCurrent');//关闭当前Dialog
			$(this).navtab('reload');//重新加载当前标签
		}
	});
});
function stateToStr_my_171215_1251(code){ 
	var codeStr=code;
	if(isNonNull(code)){ 
		if(code=='0'){
	  		codeStr='正常';
	  	}
	}
	return codeStr;
}
</script>
<div class="bjui-pageContent">
	<table class="table table-condensed table-hover">
    <tbody>
    	<tr>
        	<td colspan="4" align="center"><h3>主体详细信息</h3></td>
      	</tr>
      	<tr>
        	<td align="right"><label>主体全称：</label></td>
        	<td colspan="3">
        		<div id="orgeFullName_my_171215_1251"></div>
       		</td>
      	</tr>
      	<tr>
			<td align="right"><label>主体名称：</label></td>
	        <td>
	        	<div id="orgeName_my_171215_1251"></div>
	        </td>
      		<td align="right"><label>主体类型：</label></td>
        	<td>
        		<div id="orgeType_my_171215_1251"></div>
          	</td>
      	</tr>
      	<tr>
      		<td align="right"><label>联系人：</label></td>
        	<td>
        		<div id="linkMan_my_171215_1251"></div>
          	</td>
			<td align="right"><label>联系电话：</label></td>
	        <td>
	        	<div id="orgeTel_my_171215_1251"></div>
	        </td>
        </tr>
        <tr>
      		<td align="right"><label>地址：</label></td>
        	<td colspan="3">
        		<div id="orgeAddr_my_171215_1251"></div>
          	</td>
        </tr>
      	<tr>
      		<td align="right"><label>邮箱：</label></td>
        	<td>
        		<div id="email_my_171215_1251"></div>
          	</td>
      		<td align="right"><label>状态：</label></td>
        	<td>
        		<div id="orgeState_my_171215_1251"></div>
          	</td>
        </tr>
      	<tr>
      		<td align="right"><label>记录时间：</label></td>
        	<td>
        		<div id="loadTime_my_171215_1251"></div>
          	</td>
      		<td align="right"><label>更新时间：</label></td>
        	<td>
        		<div id="upTime_my_171215_1251"></div>
          	</td>
        </tr>
    </tbody>
	</table>
</div>
<div class="bjui-pageFooter">
	<ul>
    	<li>
      		<button type="button" data-icon="close" class="btn btn-close">关闭</button>
    	</li>
  	</ul>
</div>