<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page isThreadSafe="false" import="cn.yfyue.comm.SetSys"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=SetSys.platName%></title>
<LINK REL="SHORTCUT ICON" HREF="favicon.ico">
<script type="text/javascript" src="BJUI/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="jajax/jquery.js?LoginAjax"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/tctip-1.0.3.min.js"></script>
<script type="text/javascript">
function exitSysOp()
 {
    LoginAjax.logout(null,function(data){
	  var outData=data;							   
   });
}
$(document).ready(function(){
  //  exitSysOp();
	isvof();
});
function isvof(){  
   document.getElementById('userdv').src="<%=basePath%>/img_dv.gif?rnd=" + Math.random();
}

$(document).ready(function() {
  $("#pwd").focus(function(){
	  $("#showPwd").hide();
	  })
});

$(document).ready(function() {
	 $("#pwd").blur(function(){
	  var text_value=$(this).val();
	  if (text_value==""){
		  $("#showPwd").show();
		  }	 
	});
});
new tctip({
    top: '20%',
    button: {
      id: 9,
      type: 'dashang',
    },
    list: [
      {
        type: 'alipay',
        qrImg: 'images/xugangZFB.jpg'
      }, {
        type: 'wechat',
        qrImg: 'images/xugangWX.png'
      }
    ]
  }).init()
</script>
<link type="text/css" rel="stylesheet" href="css/login.css" />
</head>
<body>
<!--head-->
<div style="width:100%; height:620px;margin-top:-320px; position:absolute; top:50%;">
  <div class="top">
    <!-- <div class="top_logo"><img src="images/logo-1.png" /></div>-->   
  </div>
  <!--center-->
  <div class="cen">
    <div class="cen_pic">
      <div class="login_box">
        <div class="login">
        <div class="login_tt"><%=SetSys.platShortName%></div>	
          <div style="margin-left:25px; ">
            <input name="loginname" type="text" class="login_user" id="loginname" />
            <input name="password" type="password" class="login_password" id="password"  />
            <input name="vcode" type="text" value=""  class="login_vcode" id="vcode"  maxlength="4" />
            <div class="login_reset"><img alt="点击获取" onClick="isvof();" style="cursor:pointer; vertical-align:middle;" name="userdv" width="100px" height="35px" border=0 id="userdv"/> </div>
            <div style="color:#f00; font-size:12px;  text-align:center;margin-top:10px;" id="loginInfo"> </div>
            <div style=" margin-top:20px;"> <img src="images/pic_login.png" style="cursor:pointer; vertical-align:middle;"  onClick="loginSys();" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="images/pic_reset.png" style="cursor:pointer; vertical-align:middle;"  onClick="resetlogin();"/></div>
          </div>
        </div>
      </div>
      <!--login box end-->
    </div>
    <!--line-->
    <div style="background:url(images/line.png); width:100%; height:2px;"></div>
    <div class="foot"> 版权所有Copyright &copy; <%=SetSys.companyName%> <br/>
      <%=SetSys.linkTel%>&nbsp;&nbsp;<%=SetSys.technicalSupport%> </div>
    <!--end-->
  </div>
</div>
</body>
</html>
