<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
		<style>
			* { padding: 0; margin: 0;}
			ul,li,dl,dd,dt { list-style-type: none;}
			.body_ccms {
				width: 95%;
				margin: 20px auto 0 20px;
				overflow: hidden;
				float:left;
			}
			.body_ccms .left {
				float: left;
				width: 70%;
			}
			.body_ccms .left .data {
				text-align: center;
				overflow: hidden;
			}
			.body_ccms .left .data li {
				float: left;
				width: 30%;
				padding: 20px 0;
				margin-bottom: 20px;
				border: 1px solid #dad9d4;
				border-radius: 5px;
			}
			.body_ccms .left .data li:nth-child(3n+2) {
				margin: 0 5% 20px 5%;
			}
			.body_ccms .left .data .one {
				background: #f3fdff;
			}
			.body_ccms .left .data .two {
				background: #b3adff;
			}
			.body_ccms .left .data .three {
				background: #e2fffc;
			}
			.body_ccms .left .data .four {
				background: #b7ffb2;
			}
			.body_ccms .left .data .five {
				background: #feff90;
			}
			.body_ccms .left .data .six {
				background: #ffbcbc;
			}
			.body_ccms .left .data li h3 {
				margin: 0;
				font-size: 36px;
				color: #da4949;
			}
			.body_ccms .left .data li p {
				margin: 5px 0 0 0;
				font-size: 16px;
				color: #4c4e4e;
			}
			.body_ccms .left .table-one {
				border: 1px solid #c8c8c8;
			}
			.body_ccms .left .table-one h3 {
				padding: 0 15px;
				margin: 0;
				font-family: "microsoft yahei";
				font-weight: bold;
				font-size: 14px;
				line-height: 26px;
				border-bottom: 1px solid #c8c8c8;
				background: #f1f1f1;
			}
			.body_ccms .left .table-one .list {
				padding: 0 15px;
				margin: 0;
				font-size: 16px;
				line-height: 30px;
				overflow: hidden;
				background: #f7f7f7;
			}
			.body_ccms .left .table-one .list dd {
				float: left;
				font-size: 12px;
				line-height: 24px;
			}
			.body_ccms .left .table-one .list dd span {
				color: #ff0000;
			}
			.body_ccms .left .table-one .list dt {
				float: right;
				line-height: 24px;
			}
			.body_ccms .right {
				float: right;
				width: 28%;
			}
			.body_ccms .right .table {
				margin-bottom: 20px;
				border: 1px solid #c8c8c8;
			}
			.body_ccms .right .table h3 {
				padding: 0 15px;
				margin: 0;
				font-family: "microsoft yahei";
				font-weight: bold;
				font-size: 14px;
				line-height: 26px;
				border-bottom: 1px solid #c8c8c8;
				background: #f1f1f1;
			}
			.body_ccms .right .table .text-one {
				padding: 5px 15px;
				margin: 0;
				font-size: 16px;
				color: #666;
				line-height: 20px;
				background: #f7f7f7;
			}
			.body_ccms .right .table .text-one li {
				font-size: 12px;
				line-height: 24px;
			}
			.body_ccms .right .table .text-two {
				padding: 0 15px;
				margin: 0;
				font-size: 16px;
				color: #666;
				line-height: 30px;
				background: #f7f7f7;
				overflow: hidden;
			}
			.body_ccms .right .table .text-two dd {
				float: left;
				height:24px;
				
				font-size: 12px;
				line-height: 24px;
				white-space: nowrap;
				text-overflow: ellipsis;
				overflow: hidden;
			}
			.body_ccms .right .table .text-two dt {
				float: right;
				font-weight: normal;
				width: 85px;
				font-size: 12px;
				line-height: 24px;
			}
		</style>

<div class="bjui-pageContent tableContent">
<div class="body_ccms">
    <div class="left">
        <ul class="data">
            <li class="one">
                <h3 id="stateTotal"></h3>
                <p>累计人数</p>
            </li>
            <li class="two">
                <h3 id="state0"></h3>
                <p>待矫人数</p>
            </li>
            <li class="three">
                <h3 id="state1"></h3>
                <p>在矫人数</p>
            </li>
            <li class="four">
                <h3 id="level1"></h3>
                <p>宽松管理</p>
            </li>
            <li class="five">
                <h3 id="level2"></h3>
                <p>普通管理</p>
            </li>
            <li class="six">
                <h3 id="level3"></h3>
                <p>严格管理</p>
            </li>
        </ul>
        <div class="table-one">
            <h3>工作提醒</h3>
			<div id="schedule_z_0616_0955">

            

            </div>


        </div>
    </div>
    <div class="right">
        <div class="table">
            <h3>告警</h3>
            <ul id="wran_z_0616_0955" class="text-one">

            </ul>
        </div>
        <div class="table">
            <h3>通知</h3>
            <dl id="notifySys_z_0616_0955" class="text-two">

            </dl>
        </div>
    </div>
</div>
</div>