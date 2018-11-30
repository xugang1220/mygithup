$(document).ready(function () {
	submitlogin();
	$("#login").click(loginSys);
	$("#resetlogin").click(resetlogin);
});

function submitlogin() {
	if (document.addEventListener) { //如果是Firefox
		document.addEventListener("keypress", fireFoxHandler, true);
	} else {
		document.attachEvent("onkeypress", ieHandler);
	}
}

function fireFoxHandler(evt) {
	if (evt.keyCode == 13) {
		loginSys();
	}
}

function ieHandler(evt) {
	if (evt.keyCode == 13) {
		loginSys();
	}
}

function loginSys() {
	if (isNull($("#loginname").val())) {
		$("#loginInfo").html("请输入用户名");
		isvof();
		return false;
	}
	if (isNull($("#password").val())) {
		$("#loginInfo").html("请输入密码");
		isvof();
		return false;
	}

	$("#loginInfo").html("正在验证登陆信息 请稍后...");
	//调发送POST
	var para = {
		login_name : $.trim($("#loginname").val()),
		pass_word : $.trim($("#password").val()),
		vcode : $.trim($("#vcode").val())
	}
	LoginAjax.isLogin(para, loginCallBack);
}

function loginCallBack(data) {
	var dataObj = formatdata(data);
	if (dataObj.state == 0) {
		location.href = "frame.jsp";
	} else {
		isvof();
		$("#loginInfo").html(dataObj.message);
	}
}

function resetlogin() {
	$("#vcode").val("");
	$("#username").val("");
	$("#password").val("");
	isvof();
}

//判断为空
function isNull(obj) {
	try {
		if (typeof obj === 'undefined' || obj === NaN || obj === null || obj === 'null' || obj === '' || obj === '0000') {
			return true;
		} else {
			if (lrtrim(obj) === '') {
				return true;
			} else {
				return false;
			}
		}
	} catch (e) {
		return false;
	}
}
//去掉字符串头尾空格
function lrtrim(str) {
	return typeof str === 'string' ? str.replace(/(^\s*)|(\s*$)/g, "") : str;
}
//json字符转对像  var obj={"state":-998,"message":"非JSON字符"}
function formatdata(data) {
	if (isJson(data)) {
		return eval("(" + data + ")");
	} else {
		return {
			"state" : -998,
			"message" : "返回非Json对象:" + data
		};
	}
}
//判断JSON字符串
function isJson(obj) {
	try {
		if (typeof(obj) != "undefined" && obj != null && obj != "null") {
			eval("(" + obj + ")");
			return true;
		} else {
			return false;
		}
	} catch (e) {
		return false;
	}
}