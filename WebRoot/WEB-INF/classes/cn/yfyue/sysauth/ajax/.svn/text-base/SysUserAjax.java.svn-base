package cn.yfyue.sysauth.ajax;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.sysauth.bll.User;
import cn.yfyue.sysauth.db.model.BjUser;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value="SysUserAjax")
public class SysUserAjax{
	
private User user=ContextLoader.getCurrentWebApplicationContext().getBean(User.class);		

//取当前自己的账户信息
public String getMyInfo(ServletRequest request) {
   BjUser bjUser=null;
   ReturnJson returnJson=new ReturnJson();
	try {
		if (Auth.isAuth(request)) {
			
			bjUser = user.getMyInfo(Auth.getAuthUserId(request));
	     if(bjUser!=null){
			returnJson.setState(0);
			returnJson.setMessage("操作成功");
			returnJson.setObject(bjUser);
		  }else{
			returnJson.setState(-1);
			returnJson.setMessage("获取账户信息失败"); 
		  }
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}	
//更新自己信息
public String upMyInfo(@AjaxParam("userId") String userId,
		@AjaxParam("userName") String userName, 
		@AjaxParam("mobileNo") String mobileNo,
		ServletRequest request) {
//	L.printRequest(Thread.currentThread() .getStackTrace(), request);
	ReturnJson returnJson=new ReturnJson();
	BjUser bjUser = null;
	userId=F.isNull(userId);
	userName=F.isNull(userName);
	try {
	 if(Auth.isAuth(request)){
	     if(userName!=null && userId!=null){
	    	 bjUser=new BjUser();
	    	 bjUser.setMobileNo(mobileNo);
	    	 bjUser.setUserName(userName);
	    	 bjUser.setUserId(userId);
	    	 
	    	 if(user.upUserInfo(bjUser)>0){
	    		returnJson.setState(0); 
	    		returnJson.setMessage("更新成功"); 
	    	 }else{
	    		returnJson.setState(-1); 
	    		returnJson.setMessage("数据保存失败"); 
	    	 }
	     }else{
		   returnJson.setState(-1); 
		   returnJson.setMessage("数据格式错误");
	     }
	 }else{
		returnJson.setState(-1); 
		returnJson.setMessage("登录已失效,请重新登录");
	 }
	} catch (Exception e) {
		returnJson.setState(-1);
		returnJson.setMessage(e.toString());
		e.printStackTrace();
	}
	//记录日志
	L.opLog(Thread.currentThread() .getStackTrace(), request, "更新自己信息", returnJson.getMessage());
	return returnJson.getJson();
}
//更新密码
public String changeMyPasswd(@AjaxParam("oldPasswd") String oldPasswd,
		@AjaxParam("newPasswd") String newPasswd, 
		@AjaxParam("submitPasswd") String submitPasswd,
		ServletRequest request) {
	L.printRequest(Thread.currentThread() .getStackTrace(), request);
	ReturnJson returnJson=new ReturnJson();
	oldPasswd=F.isNull(oldPasswd);
	newPasswd=F.isNull(newPasswd);
	String userId=null;
	try {
	 if(Auth.isAuth(request)){
		userId=Auth.getAuthUserId(request);	
	     if(oldPasswd!=null && userId!=null && newPasswd!=null){
	    	 oldPasswd=F.md5Passwd(oldPasswd);
	    	 newPasswd=F.md5Passwd(newPasswd);
	    	 
	    	 if(user.upMyPasswd(userId, oldPasswd, newPasswd)>0){
	    		returnJson.setState(0); 
	    		returnJson.setMessage("更新成功"); 
	    	 }else{
	    		returnJson.setState(-1); 
	    		returnJson.setMessage("数据保存失败"); 
	    	 }
	     }else{
		   returnJson.setState(-1); 
		   returnJson.setMessage("数据格式错误");
	     }
	 }else{
		returnJson.setState(-1); 
	    returnJson.setMessage("登录失效,请重新登录"); 
	 }
	} catch (Exception e) {
		returnJson.setState(-1);
		returnJson.setMessage(e.toString());
		e.printStackTrace();
	}
	//记录日志
	L.opLog(Thread.currentThread() .getStackTrace(), request, "更新自己密码", returnJson.getMessage());
	return returnJson.getJson();
}

// 查询列表
public String getUserList(
		@AjaxParam("qkey") String qkey,
		@AjaxParam("page") String page,
		@AjaxParam("rows") String rows,
		ServletRequest request) {
	List dataList = null;
	ReturnJson returnJson=new ReturnJson();
	int nPage = F.fPage(page);
	int nRowNum = F.fRow(rows);
	qkey = F.isNull(qkey);
	try {
		if (Auth.isAuth(request)) {
			
			// 取最大行数
			dataList = user.getUserList(Auth.getAuthUserId(request),
					Auth.getAuthUserLevel(request), qkey, (nPage - 1)
							* nRowNum, nRowNum);
			if(dataList!=null && !dataList.isEmpty())
			{
			  for(int i=0;i<dataList.size();i++){
				BjUser bjUser=(BjUser)dataList.get(i);
				bjUser.setUserStatusStr(CodeToStr.bjUserToState(""+bjUser.getUserStatus()));
			  }

			}
			returnJson.setState(0);
			returnJson.setMessage("操作成功");
			returnJson.setObject(dataList);
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//列表统计
public String getUserListCount(
		@AjaxParam("qkey") String qkey,
		ServletRequest request) {
    //L.printRequest(Thread.currentThread() .getStackTrace(), request);
	ReturnJson returnJson=new ReturnJson();
    int dataTotalRowNum=0;
    qkey=F.isNull(qkey);

	try {
		if (Auth.isAuth(request)) {
			
		// 取最大行数
		dataTotalRowNum = user.getUserListCount(Auth.getAuthUserId(request),
				Auth.getAuthUserLevel(request), qkey);
		returnJson.setState(0);
		returnJson.setMessage("操作成功");
        returnJson.setObject(dataTotalRowNum);
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}

//启用账户
public String enabledUser(
		@AjaxParam("userId") String userId,
		ServletRequest request) {
    L.printRequest(Thread.currentThread() .getStackTrace(), request);
	ReturnJson returnJson=new ReturnJson();
    userId=F.isNull(userId);
    BjUser bjUser=null;
	try {
		if (Auth.isAuth(request)) {
			
			bjUser=user.getMyInfo(userId);
			if(bjUser!=null){
			  if(bjUser.getUserStatus()==1){
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
			returnJson.setState(-1);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "启动账户", returnJson.getMessage());
	return returnJson.getJson();
}
//禁用账户
public String disabledUser(
		@AjaxParam("userId") String userId,
		ServletRequest request) {
   L.printRequest(Thread.currentThread() .getStackTrace(), request);
   ReturnJson returnJson=new ReturnJson();
   userId=F.isNull(userId);
   BjUser bjUser=null;
	try {
		if (Auth.isAuth(request)) {
			
			bjUser=user.getMyInfo(userId);
			if(bjUser!=null){
			  if(bjUser.getUserStatus()==0){
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
			returnJson.setState(-1);
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
   BjUser bjUser=null;
   String initPasswd="a";
	try {
		if (Auth.isAuth(request)) {
			
			bjUser=user.getMyInfo(userId);
			if(bjUser!=null){
			  if(user.initPasswd(userId, F.md5Passwd(initPasswd))>0){
				returnJson.setState(0);
				returnJson.setMessage("账户:"+bjUser.getLoginName()+" 密码初绐化为"+initPasswd);    
			  }else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起,账户:"+bjUser.getLoginName()+" 密码初绐化失败");  
			  }
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起,获取账户信息失败");
			}
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "重置密码", returnJson.getMessage());
	return returnJson.getJson();
}
//取账户信息
public String getUserInfo(
		@AjaxParam("userId") String userId,
		ServletRequest request) {
   
   ReturnJson returnJson=new ReturnJson();
   userId=F.isNull(userId);
   BjUser bjUser=null;
	try {
		if (Auth.isAuth(request)) {
			
			bjUser=user.getMyInfo(userId);
			if(bjUser!=null){
				returnJson.setState(0);
				returnJson.setMessage("操作成功");
				returnJson.setObject(bjUser);
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起,获取账户信息失败");
			}
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//添加账户
public String addUser(
		@AjaxParam("loginName") String loginName,
		@AjaxParam("passWord") String passWord,
		@AjaxParam("passWord2") String passWord2,
		@AjaxParam("userName") String userName,
		@AjaxParam("mobileNo") String mobileNo,
		@AjaxParam("orgeId") String orgeId,
		@AjaxParam("roleCode") String roleCode,
		@AjaxParam("dataExt") String dataExt,
		@AjaxParam("dataExt2") String dataExt2,
		ServletRequest request) {
  // L.printRequest(Thread.currentThread() .getStackTrace(), request);
   ReturnJson returnJson=new ReturnJson();
   loginName=F.isNull(loginName);
   passWord=F.isNull(passWord);
   userName=F.isNull(userName);
   orgeId=F.isNull(orgeId);
   roleCode=F.isNull(roleCode);
   dataExt=F.isNull(dataExt);
   dataExt2=F.isNull(dataExt2);
   BjUser bjUser=null;
	try {
		if (Auth.isAuth(request)) {
          if(loginName!=null && passWord!=null){
        	 if(passWord2.equals(passWord)){
        		 if(user.isLoginName(loginName)==0){
        			 bjUser=new BjUser();
        			 bjUser.setAdminLevel(1);
        			 bjUser.setDataExt(dataExt2);
        			 bjUser.setDataExt2(dataExt2);
        			 bjUser.setLoginName(loginName);
        			 bjUser.setUserName(userName);
        			 bjUser.setMobileNo(mobileNo);
        			 bjUser.setOrgeId(F.strToLong(orgeId));
        			 bjUser.setOpenUserId(F.strToLong(Auth.getAuthUserId(request)));
        			 bjUser.setPassWord(F.md5Passwd(passWord));
        			 bjUser.setRoleCode(roleCode);
                     if(user.addUser(bjUser)>0){
                  		returnJson.setState(0);
                  		returnJson.setMessage("账户已开通 账户名:"+loginName+" 密码:"+passWord); 	 
                     }else{
                 		returnJson.setState(-1);
                  		returnJson.setMessage("对不起!数据保存失败"); 
                     }
        		 }else{
            		returnJson.setState(-1);
              		returnJson.setMessage("对不起!登录名已占用");   
        		 }
        	 }else{
       			returnJson.setState(-1);
      			returnJson.setMessage("对不起!两次密码不一置");   
        	 }
          }else{
  			returnJson.setState(-1);
  			returnJson.setMessage("对不起!数据格式错误");  
          }
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "添加账户", returnJson.getMessage());
	return returnJson.getJson();
}
//更新帐户
public String upUser(
		@AjaxParam("userId") String userId,
		@AjaxParam("userName") String userName,
		@AjaxParam("mobileNo") String mobileNo,
		@AjaxParam("orgeId") String orgeId,
		@AjaxParam("roleCode") String roleCode,
		@AjaxParam("dataExt") String dataExt,
		@AjaxParam("dataExt2") String dataExt2,
		ServletRequest request) {
   L.printRequest(Thread.currentThread() .getStackTrace(), request);
   ReturnJson returnJson=new ReturnJson();
   userId=F.isNull(userId);
   userName=F.isNull(userName);
   orgeId=F.isNull(orgeId);
   roleCode=F.isNull(roleCode);
   dataExt=F.isNull(dataExt);
   dataExt2=F.isNull(dataExt2);
   BjUser bjUser=null;
	try {
		if (Auth.isAuth(request)) {
          if(userId!=null){
			 bjUser=new BjUser();
			 bjUser.setDataExt(dataExt2);
			 bjUser.setDataExt2(dataExt2);
			 bjUser.setMobileNo(mobileNo);
			 bjUser.setOrgeId(F.strToLong(orgeId));
			 bjUser.setRoleCode(roleCode);
			 bjUser.setUserName(userName);
			 bjUser.setUserId(userId);
             if(user.upUserInfo(bjUser)>0){
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
			returnJson.setState(-1);
			returnJson.setMessage("请登录后,再操作...");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "更新账户", returnJson.getMessage());
	return returnJson.getJson();
}
}
