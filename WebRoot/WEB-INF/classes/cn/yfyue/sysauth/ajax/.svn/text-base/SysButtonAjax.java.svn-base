package cn.yfyue.sysauth.ajax;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.sysauth.bll.Button;
import cn.yfyue.sysauth.bll.Func;
import cn.yfyue.sysauth.bll.UserButton;
import cn.yfyue.sysauth.db.model.BjButton;
import cn.yfyue.sysauth.db.model.BjFunc;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value="SysButtonAjax")
public class SysButtonAjax{
	
private Button button=ContextLoader.getCurrentWebApplicationContext().getBean(Button.class);
private UserButton userButton=ContextLoader.getCurrentWebApplicationContext().getBean(UserButton.class);
private Func func=ContextLoader.getCurrentWebApplicationContext().getBean(Func.class);

//取列表
public String getButtonList(
		@AjaxParam("funcId") String funcId,
		ServletRequest request) {
	//L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	List<BjButton> dataList = null;
	try {
		if (Auth.isAuth(request)) {
		  dataList = button.getButtonList(funcId);
		  returnJson.setState(0);
		  returnJson.setMessage("操作成功");
		  returnJson.setObject(dataList);
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		returnJson.setState(-1);
		returnJson.setMessage(e.toString());
		e.printStackTrace();
	}
	return returnJson.getJson();
}

//添加
public String addButton(
		@AjaxParam("funcId") String funcId,
		@AjaxParam("buttonHtml") String buttonHtml,
		@AjaxParam("buttonName") String buttonName,
		ServletRequest request) {
	//L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	BjButton bjButton=null;
	funcId=F.isNull(funcId);
	buttonHtml=F.isNull(buttonHtml);
	buttonName=F.isNull(buttonName);
	BjFunc bjFunc=null;
	try {
		if (Auth.isAuth(request)) {
		 if(funcId!=null && buttonHtml!=null && buttonName!=null){
			 bjFunc=func.getFuncInfo(funcId);
			 if(bjFunc!=null){
			   if(bjFunc.getIsLeaf().equals("1")){
				   bjButton=new BjButton();
				   bjButton.setButtonHtml(buttonHtml);
				   bjButton.setButtonName(buttonName);
				   bjButton.setFunId(F.strToLong(funcId));
				   bjButton.setRegMan(F.strToLong(Auth.getAuthUserId(request)));
				   if(button.addButton(bjButton)>0){
					   returnJson.setState(0);
					   returnJson.setMessage("操作成功"); 
				   }else{
					   returnJson.setState(-1);
					   returnJson.setMessage("对不起!数据保存失败"); 
				   } 
			   }else{
				   returnJson.setState(-1);
				   returnJson.setMessage("对不起!非叶子接点,不能添加按钮");    
			   }
			 }else{
				 returnJson.setState(-1);
				 returnJson.setMessage("对不起!获取功能数据失败");  
			 }
		 }else{
			 returnJson.setState(-1);
			 returnJson.setMessage("对不起!数据格式错误"); 
		 }
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		returnJson.setState(-1);
		returnJson.setMessage(e.toString());
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "添加铵钮", returnJson.getMessage());
	return returnJson.getJson();
}

//取单个
public String getButtonInfo(
		@AjaxParam("buttonId") String buttonId,
		ServletRequest request) {
	//L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	BjButton bjButton=null;
	buttonId=F.isNull(buttonId);
	try {
		if (Auth.isAuth(request)) {
		 if(buttonId!=null){
		   bjButton=button.getButtonInfo(buttonId);
		   if(bjButton!=null){
			   returnJson.setState(0);
			   returnJson.setMessage("操作成功");   
			   returnJson.setObject(bjButton);
		   }else{
			   returnJson.setState(-1);
			   returnJson.setMessage("对不起!获取按钮信息失败");    
		   }
		 }else{
			 returnJson.setState(-1);
			 returnJson.setMessage("对不起!数据格式错误"); 
		 }
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		returnJson.setState(-1);
		returnJson.setMessage(e.toString());
		e.printStackTrace();
	}
	return returnJson.getJson();
}

//更新
public String upButton(
		@AjaxParam("buttonId") String buttonId,
		@AjaxParam("buttonHtml") String buttonHtml,
		@AjaxParam("buttonName") String buttonName,
		ServletRequest request) {
	//L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	BjButton bjButton=null;
	buttonId=F.isNull(buttonId);
	buttonHtml=F.isNull(buttonHtml);
	buttonName=F.isNull(buttonName);
	try {
		if (Auth.isAuth(request)) {
		 if(buttonId!=null && buttonHtml!=null && buttonName!=null){
		   bjButton=new BjButton();
		   bjButton.setButtonHtml(buttonHtml);
		   bjButton.setButtonName(buttonName);
		   bjButton.setButtonId(F.strToLong(buttonId));
		   bjButton.setRegMan(F.strToLong(Auth.getAuthUserId(request)));
		   if(button.upButton(bjButton)>0){
			   returnJson.setState(0);
			   returnJson.setMessage("操作成功"); 
		   }else{
			   returnJson.setState(-1);
			   returnJson.setMessage("对不起!数据保存失败"); 
		   }
		 }else{
			 returnJson.setState(-1);
			 returnJson.setMessage("对不起!数据格式错误"); 
		 }
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		returnJson.setState(-1);
		returnJson.setMessage(e.toString());
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "更新铵钮", returnJson.getMessage());
	return returnJson.getJson();
}

public String delButton(
		@AjaxParam("buttonId") String buttonId,
		ServletRequest request) {
	//L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	buttonId=F.isNull(buttonId);
	try {
		if (Auth.isAuth(request)) {
		 if(buttonId!=null){
			if(button.delButton(buttonId)>0){
				if(userButton.delButtonIdToUserButton(buttonId)==0){
					L.p("按删除用户按钮表失败");
				}
				returnJson.setState(0);
				returnJson.setMessage("操作成功"); 
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!数据格式错误"); 	
			}
		 }else{
			 returnJson.setState(-1);
			 returnJson.setMessage("对不起!数据格式错误"); 
		 }
		} else {
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		returnJson.setState(-1);
		returnJson.setMessage(e.toString());
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "删除铵钮", returnJson.getMessage());
	return returnJson.getJson();
}
}
