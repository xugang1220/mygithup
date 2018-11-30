package cn.yfyue.yyzt.ajax;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.yyzt.db.bll.OUser;
import cn.yfyue.yyzt.db.model.OpUser;
import cn.yfyue.yyzt.db.bll.TransOpOrgeUser;
import cn.yfyue.yyzt.wrap.OrgeUserWrap;
import cn.yfyue.sysauth.ajax.CodeToStr;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value="OpUserAjax")
public class OpUserAjax{
	
private OUser user=ContextLoader.getCurrentWebApplicationContext().getBean(OUser.class);

//查询门店账户列表
public String getMdUserList(@AjaxParam("orgeId") String orgeId,
		@AjaxParam("qkey") String qkey,
		@AjaxParam("page") String page,
		@AjaxParam("rows") String rows,
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	List dataList = null;
	orgeId = F.isNull(orgeId);
	qkey = F.isNull(qkey);
	int nPage = F.fPage(page);
	int nRowNum = F.fRow(rows);
	try {
		if (Auth.isAuth(request)) {
			// 取最大行数
			dataList = user.getUserList(orgeId, qkey, (nPage - 1) * nRowNum, nRowNum);
			if(dataList!=null && !dataList.isEmpty()){
				for(int i=0;i<dataList.size();i++){
					OpUser opUser=(OpUser)dataList.get(i);
					opUser.setUserStatusStr(CodeToStr.bjUserToState(""+opUser.getUserStatus()));
				}
			}
			returnJson.setState(0);
			returnJson.setMessage("操作成功");
			returnJson.setObject(dataList);
		} else {
			returnJson.setState(-997);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//门店账户列表统计
public String getMdUserListCount(@AjaxParam("orgeId") String orgeId,
		@AjaxParam("qkey") String qkey,
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	int dataTotalRowNum=0;
	qkey=F.isNull(qkey);
	try {
		if (Auth.isAuth(request)) {
			// 取最大行数
			dataTotalRowNum = user.getUserListCount(orgeId, qkey);
			returnJson.setState(0);
			returnJson.setMessage("操作成功");
			returnJson.setObject(dataTotalRowNum);
		}else{
			returnJson.setState(-997);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//添加门店账户
public String addMdUser(@AjaxParam("loginName") String loginName,
		@AjaxParam("passWord") String passWord,
		@AjaxParam("passWord2") String passWord2,
		@AjaxParam("userName") String userName,
		@AjaxParam("mobileNo") String mobileNo,
		@AjaxParam("orgeFullName") String orgeFullName,
		@AjaxParam("orgeName") String orgeName,
		@AjaxParam("orgeType") String orgeType,
		@AjaxParam("linkMan") String linkMan,
		@AjaxParam("orgeTel") String orgeTel,
		@AjaxParam("email") String email,
		@AjaxParam("orgeAddr") String orgeAddr,
		ServletRequest request) {
	loginName=F.isNull(loginName);
	passWord=F.isNull(passWord);
	passWord2=F.isNull(passWord2);
	userName=F.isNull(userName);
	mobileNo=F.isNull(mobileNo);
	orgeFullName=F.isNull(orgeFullName);
	orgeName=F.isNull(orgeName);
	orgeType=F.isNull(orgeType);
	linkMan=F.isNull(linkMan);
	orgeTel=F.isNull(orgeTel);
	email=F.isNull(email);
	orgeAddr=F.isNull(orgeAddr);
	OrgeUserWrap orgeUserWrap = new OrgeUserWrap();
	orgeUserWrap.setLoginName(loginName);
	orgeUserWrap.setPassWord(passWord);
	orgeUserWrap.setPassWord2(passWord2);
	orgeUserWrap.setUserName(userName);
	orgeUserWrap.setMobileNo(mobileNo);
	orgeUserWrap.setOrgeFullName(orgeFullName);
	orgeUserWrap.setOrgeName(orgeName);
	orgeUserWrap.setOrgeType(orgeType);
	orgeUserWrap.setLinkMan(linkMan);
	orgeUserWrap.setOrgeTel(orgeTel);
	orgeUserWrap.setEmail(email);
	orgeUserWrap.setOrgeAddr(orgeAddr);
	TransOpOrgeUser opOrgeUserTrans = ContextLoader.getCurrentWebApplicationContext().getBean(TransOpOrgeUser.class);
	return opOrgeUserTrans.addOrgeUser(orgeUserWrap, request);
}
//启用账户
public String enabledUser(@AjaxParam("userId") String userId,
		ServletRequest request) {
    L.printRequest(Thread.currentThread() .getStackTrace(), request);
	ReturnJson returnJson=new ReturnJson();
    userId=F.isNull(userId);
    OpUser opUser=null;
	try {
		if (Auth.isAuth(request)) {
			opUser=user.getUserInfo(userId);
			if(opUser!=null){
			  if(opUser.getUserStatus()==1){
				 if(user.enabledUser(userId)>0){
					returnJson.setState(0);
					returnJson.setMessage("账户开启成功");   
				 }else{
					returnJson.setState(-1);
					returnJson.setMessage("对不起,帐户开启失败");  
				 }
			  }else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起,帐户是开启状态");  
			  }
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起,获取账户信息失败");
			}
		}else{
			returnJson.setState(-997);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "启动账户", returnJson.getMessage());
	return returnJson.getJson();
}
//禁用账户
public String disabledUser(@AjaxParam("userId") String userId,
		ServletRequest request) {
   L.printRequest(Thread.currentThread() .getStackTrace(), request);
   ReturnJson returnJson=new ReturnJson();
   userId=F.isNull(userId);
   OpUser opUser=null;
	try {
		if (Auth.isAuth(request)) {
			opUser=user.getUserInfo(userId);
			if(opUser!=null){
			  if(opUser.getUserStatus()==0){
				 if(user.disabledUser(userId)>0){
					returnJson.setState(0);
					returnJson.setMessage("账户已禁止");   
				 }else{
					returnJson.setState(-1);
					returnJson.setMessage("对不起,帐户禁止失败");  
				 }
			  }else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起,帐户是禁止状态");  
			  }
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起,获取账户信息失败");
			}
		}else{
			returnJson.setState(-997);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "禁用账户", returnJson.getMessage());
	return returnJson.getJson();
}
//初始化密码
public String initPasswd(
		@AjaxParam("userId") String userId,
		ServletRequest request) {
   L.printRequest(Thread.currentThread() .getStackTrace(), request);
   ReturnJson returnJson=new ReturnJson();
   userId=F.isNull(userId);
   OpUser opUser=null;
   String initPasswd="123456";
	try {
		if (Auth.isAuth(request)) {
			opUser=user.getUserInfo(userId);
			if(opUser!=null){
			  if(user.initPasswd(userId, F.md5Passwd(initPasswd))>0){
				returnJson.setState(0);
				returnJson.setMessage("账户:"+opUser.getLoginName()+" 密码初绐化为"+initPasswd);    
			  }else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起,账户:"+opUser.getLoginName()+" 密码初绐化失败");  
			  }
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起,获取账户信息失败");
			}
		}else{
			returnJson.setState(-997);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "重置密码", returnJson.getMessage());
	return returnJson.getJson();
}
//取账户信息
public String getUserInfo(@AjaxParam("userId") String userId,
		ServletRequest request) {
   ReturnJson returnJson=new ReturnJson();
   userId=F.isNull(userId);
   OpUser opUser=null;
	try {
		if (Auth.isAuth(request)) {
			opUser=user.getUserInfo(userId);
			if(opUser!=null){
				returnJson.setState(0);
				returnJson.setMessage("操作成功");
				returnJson.setObject(opUser);
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起,获取账户信息失败");
			}
		}else{
			returnJson.setState(-997);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//更新帐户
public String upUser(@AjaxParam("userId") String userId,
		@AjaxParam("userName") String userName,
		@AjaxParam("mobileNo") String mobileNo,
		ServletRequest request) {
   ReturnJson returnJson=new ReturnJson();
   userId=F.isNull(userId);
   userName=F.isNull(userName);
   mobileNo=F.isNull(mobileNo);
   OpUser opUser=null;
	try {
		if (Auth.isAuth(request)) {
          if(userId!=null){
			 opUser=new OpUser();
			 opUser.setUserId(userId);
			 opUser.setUserName(userName);
			 opUser.setMobileNo(mobileNo);
             if(user.upUser(opUser)>0){
          		returnJson.setState(0);
          		returnJson.setMessage("账户信息已更新"); 	 
             }else{
         		returnJson.setState(-1);
          		returnJson.setMessage("对不起!数据保存失败"); 
             }
          }else{
  			returnJson.setState(-1);
  			returnJson.setMessage("对不起!数据格式错误");  
          }
		}else{
			returnJson.setState(-997);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "更新账户", returnJson.getMessage());
	return returnJson.getJson();
}
}