<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
	
	div, p,img,h5,span{margin:0px;padding:0px;list-style:none;border-style:none;}	
	img{border:none;vertical-align: middle;}
	.red-2{color:#df3f3f;font:bold 37px/95px "Microsoft YaHei";}
	.back-bg{margin:0px;padding:0px;width:100%;height:100%;background:url(images/bg-icon.png) center top no-repeat #fff;}	
	.wid-th{width:100%;height:100%;margin:0px auto;text-align:center;}
	.wid-th h5, .wid-th p{width:50%;position:absolute;left:25%;}
	.wid-th h5{height:95px;background:url(images/welcome.png) center top no-repeat;border-bottom:1px solid #ddd;font:bold 37px/95px "Microsoft YaHei";color:#444;letter-spacing: 1.5px;top:22%;}    
	.wid-th h5:after{content:"";display:block;width:100px;height:2px;background:#df3f3f;margin:-1px auto 0px;}
	.wid-th p{height:240px;top:44%;}
</style>
<div class="bjui-pageContent">
    <div class="back-bg">
        <div class="wid-th">
            <h5><span class="red-2">电子商务</span>管理平台</h5>
            <p><img src="images/icon-work.png" alt="" /></p>
        </div>
    </div>
</div>

