package cn.yfyue.sysauth.ajax;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.context.ContextLoader;
import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.sysauth.bll.Login;
import cn.yfyue.sysauth.db.model.BjUser;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value="LoginAjax")
public class LoginAjax{
	
private Login login=ContextLoader.getCurrentWebApplicationContext().getBean(Login.class);	

//登录
public String isLogin(@AjaxParam("login_name") String login_name,
		@AjaxParam("pass_word") String pass_word, 
		@AjaxParam("vcode") String vcode,
		ServletRequest request) {
	HttpSession session = null;
	BjUser bjUser = null;
	ReturnJson returnJson=new ReturnJson();
	try {

		session = ((HttpServletRequest) request).getSession(false);
	   if (session!=null && session.getAttribute("DynamicValidateNum").toString().equals(vcode)) {
		// 判断是否登录成功
		 if(login_name!=null && pass_word!=null){
			 L.p("--->"+login.isLogin(login_name, F.md5Passwd(pass_word)));
			 if(login.isLogin(login_name, F.md5Passwd(pass_word)) == 1) {
				bjUser = login.getUserLoginInfo(login_name);
				if (bjUser != null) {
                    //登录信息写SESSION  
					session.setAttribute("bjUserId","" + bjUser.getUserId());
					session.setAttribute("bjLoginName","" + bjUser.getLoginName());
					session.setAttribute("bjUserName","" + bjUser.getUserName());
					session.setAttribute("bjAdminLevel","" + bjUser.getAdminLevel());
					session.setAttribute("bjOrgeId","" + bjUser.getOrgeId());
					session.setAttribute("bjOrgeName","" + bjUser.getOrgeName());
					session.setAttribute("bjRoleCode","" + bjUser.getRoleCode());
					session.setAttribute("bjDataExt","" + bjUser.getDataExt());
					session.setAttribute("bjDataExt2","" + bjUser.getDataExt2());
					returnJson.setState(0);
					returnJson.setMessage("登录成功");
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("获取用户资料失败");
				}
			  } else {
				  returnJson.setState(-1);
				  returnJson.setMessage("用户名或密码错误");
			  }
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("请输入用户名和密码");
			}
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("验证码错误");
		}
	} catch (Exception e) {
		returnJson.setState(-1);
		returnJson.setMessage(e.toString());
		e.printStackTrace();
	}
	//记录日志
	L.loginLog(request, login_name, returnJson.getMessage());
	return returnJson.getJson();
}
//退出 
public void logout(ServletRequest request) {
	try {
		L.outLog(request);
	} catch (Exception e) {
		e.printStackTrace();
	}
}
//取当前用户名称
public String getLoginUserName(ServletRequest request) {
	//L.printRequest(Thread.currentThread() .getStackTrace(), request);
	ReturnJson returnJson=new ReturnJson();
	try {
        if(Auth.isAuth(request)){
        	returnJson.setState(0);
        	returnJson.setObject(Auth.getAuthUserName(request));
        }else{
        	returnJson.setState(-1);
        	returnJson.setMessage("请重新登录");
        }	
	} catch (Exception e) {
		returnJson.setState(-999);
		returnJson.setMessage(e.toString());
		e.printStackTrace();
	}
	//记录日志
	return returnJson.getJson();
 }
}
