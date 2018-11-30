package cn.yfyue.sysauth.ajax;

import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;
import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.sysauth.bll.Button;
import cn.yfyue.sysauth.bll.Func;
import cn.yfyue.sysauth.bll.RoleFun;
import cn.yfyue.sysauth.bll.UserButton;
import cn.yfyue.sysauth.bll.UserFun;
import cn.yfyue.sysauth.db.model.BjFunc;
import cn.yfyue.sysauth.wrap.FuncUtil;

@AjaxClass(value="SysFuncAjax")
public class SysFuncAjax{
	
private Func func=ContextLoader.getCurrentWebApplicationContext().getBean(Func.class);		

// 取列表
public String getFuncAllList(
		ServletRequest request) {
	L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	List<BjFunc> dataList = null;
	try {
		if (Auth.isAuth(request)) {
			
			// 取最大行数
			dataList = func.getFuncAllList();
			if(dataList!=null && !dataList.isEmpty()){
		       Iterator<BjFunc> dataIterator = dataList.iterator();
		       while (dataIterator.hasNext()) {
		    	   BjFunc bjFunc = (BjFunc) dataIterator.next();
		    	   if(bjFunc!=null){
		    		   bjFunc.setFuncState(CodeToStr.bjUserToState(bjFunc.getFuncState()));
		    		   bjFunc.setIsLeaf(CodeToStr.bjUserToIsLeaf(bjFunc.getIsLeaf()));
		    	   }
		       }
			}
			returnJson.setState(0);
			returnJson.setMessage("操作成功");
			returnJson.setObject(FuncUtil.getFuncChildNodes(dataList));
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
public String addFunc(
		@AjaxParam("funcName") String funcName,
		@AjaxParam("funcUrl") String funcUrl,
		@AjaxParam("supperFuncId") String supperFuncId,
		@AjaxParam("isLeaf") String isLeaf,
		@AjaxParam("funcAlias") String funcAlias,
		@AjaxParam("funcOrder") String funcOrder,
		@AjaxParam("styleImg") String styleImg,
		ServletRequest request) {
	L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	BjFunc bjFunc = null;
	BjFunc supperFunc = null;
	funcName=F.isNull(funcName);
	funcUrl=F.isNull(funcUrl);
	supperFuncId=F.isNull(supperFuncId);
	isLeaf=F.isNull(isLeaf);
	funcAlias=F.isNull(funcAlias);
	funcOrder=F.isNull(funcOrder);
	styleImg=F.isNull(styleImg);
	String levelStr="1";
	int nOpFlag=0;
	try {
		if (Auth.isAuth(request)) {
			
		  if(funcName!=null && supperFuncId!=null){
			  if(supperFuncId!=null && supperFuncId.equals("0")){
				  supperFuncId="0";
				  levelStr="1";
				  nOpFlag=0; 
			  }else{
				  supperFunc=func.getFuncInfo(supperFuncId);
				  if(supperFunc!=null){
					 if(supperFunc.getIsLeaf().equals("0")){ 
						 if(supperFunc.getFuncLevel()!=null){
							if((supperFunc.getFuncLevel()+1)<=5){
								levelStr=""+(supperFunc.getFuncLevel()+1);
								supperFuncId=supperFunc.getFuncId();
								nOpFlag=0; 
							}else{
								nOpFlag=-1; 
								returnJson.setState(-1);
								returnJson.setMessage("对不起!只支持5层结构");	
							}
						 }else{
							 nOpFlag=-1; 
							 returnJson.setState(-1);
							 returnJson.setMessage("对不起!获取数据异常");	
						 }
					 }else{
						  nOpFlag=-1;
						  returnJson.setState(-1);
						  returnJson.setMessage("对不起!叶子节点不能添加下一级");	 
					 }
				  }else{
					  nOpFlag=-1;
					  returnJson.setState(-1);
					  returnJson.setMessage("对不起!获取上级功能信息失败");	
				  }	  
			  }
		  }else{
			  returnJson.setState(-1);
			  returnJson.setMessage("对不起!数据格式错误");
		  }
		  if(nOpFlag==0){
			bjFunc=new 	BjFunc();
			bjFunc.setFuncAlias(funcAlias);
			bjFunc.setFuncLevel(F.StrToInt(levelStr));
			bjFunc.setFuncName(funcName);
			bjFunc.setFuncOrder(funcOrder);
			bjFunc.setFuncUrl(funcUrl);
			bjFunc.setIsLeaf(isLeaf);
			bjFunc.setRegMan(Auth.getAuthUserId(request));
			bjFunc.setStyleImg(styleImg);
			bjFunc.setSupperFuncId(supperFuncId);
			
			if(func.addFunc(bjFunc)>0){
				returnJson.setState(0);
				returnJson.setMessage("添加成功");	
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!数据保存失败");	
			}
			
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
	L.opLog(Thread.currentThread() .getStackTrace(), request, "添加功能", returnJson.getMessage());
	return returnJson.getJson();
}
//添加一级功能
public String addFuncOne(
		@AjaxParam("funcName") String funcName,
		@AjaxParam("funcAlias") String funcAlias,
		@AjaxParam("styleImg") String styleImg,
		ServletRequest request) {
	L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	BjFunc bjFunc = null;
	funcName=F.isNull(funcName);
	String funcUrl="#";
	String supperFuncId="0";
	String isLeaf="0";
	funcAlias=F.isNull(funcAlias);
	String funcOrder="0";
	styleImg=F.isNull(styleImg);
	String levelStr="1";
	try {
		if (Auth.isAuth(request)) {
			bjFunc=new 	BjFunc();
			bjFunc.setFuncAlias(funcAlias);
			bjFunc.setFuncLevel(F.StrToInt(levelStr));
			bjFunc.setFuncName(funcName);
			bjFunc.setFuncOrder(funcOrder);
			bjFunc.setFuncUrl(funcUrl);
			bjFunc.setIsLeaf(isLeaf);
			bjFunc.setRegMan(Auth.getAuthUserId(request));
			bjFunc.setStyleImg(styleImg);
			bjFunc.setSupperFuncId(supperFuncId);
			
			if(func.addFunc(bjFunc)>0){
				returnJson.setState(0);
				returnJson.setMessage("添加成功");	
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!数据保存失败");	
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
	L.opLog(Thread.currentThread() .getStackTrace(), request, "添加一级功能", returnJson.getMessage());
	return returnJson.getJson();
}

//获取单个
public String getFuncInfo(
		@AjaxParam("funcId") String funcId,
		ServletRequest request) {
	L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	BjFunc bjFunc = null;
	funcId=F.isNull(funcId);
	try {
		if (Auth.isAuth(request)) {
			
		  if(funcId!=null){
			  bjFunc=func.getFuncInfo(funcId);
			  if(bjFunc!=null){
				  returnJson.setState(0);
				  returnJson.setMessage("操作成功");
				  returnJson.setObject(bjFunc);
			  }else{
				  returnJson.setState(-1);
				  returnJson.setMessage("对不起!数据获取失败");  
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
public String upFunc(
		@AjaxParam("funcName") String funcName,
		@AjaxParam("funcUrl") String funcUrl,
		@AjaxParam("funcId") String funcId,
		@AjaxParam("isLeaf") String isLeaf,
		@AjaxParam("funcAlias") String funcAlias,
		@AjaxParam("funcOrder") String funcOrder,
		@AjaxParam("styleImg") String styleImg,
		ServletRequest request) {
	L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	BjFunc bjFunc = null;
	funcName=F.isNull(funcName);
	funcUrl=F.isNull(funcUrl);
	funcId=F.isNull(funcId);
	isLeaf=F.isNull(isLeaf);
	funcAlias=F.isNull(funcAlias);
	funcOrder=F.isNull(funcOrder);
	styleImg=F.isNull(styleImg);
	try {
		if (Auth.isAuth(request)) {
			if(funcId!=null && funcName!=null){
				
				bjFunc=new 	BjFunc();
				bjFunc.setFuncAlias(funcAlias);
				bjFunc.setFuncName(funcName);
				bjFunc.setFuncOrder(funcOrder);
				bjFunc.setFuncUrl(funcUrl);
				bjFunc.setIsLeaf(isLeaf);
				bjFunc.setRegMan(Auth.getAuthUserId(request));
				bjFunc.setStyleImg(styleImg);
				bjFunc.setFuncId(funcId);
				if(func.upFunc(bjFunc)>0){
					returnJson.setState(0);
					returnJson.setMessage("数据更新成功");	
				}else{
					returnJson.setState(-1);
					returnJson.setMessage("对不起!数据保存失败");	
				}
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!数据错误错误");	
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
	L.opLog(Thread.currentThread() .getStackTrace(), request, "更新功能", returnJson.getMessage());
	return returnJson.getJson();
}

//删除
public String delFunc(@AjaxParam("funcId") String funcId,
		ServletRequest request) {
	L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	funcId=F.isNull(funcId);
	try {
		if (Auth.isAuth(request)) {
			
		  if(funcId!=null){
			
            if(func.getFuncIsChild(funcId)==0){
              if(func.delFunc(funcId)>0){
            	//删除用户功能表void
            	  UserFun userFun=ContextLoader.getCurrentWebApplicationContext().getBean(UserFun.class);		
            	  if(userFun.delFunIdToUserFunc(funcId)==0){
            		  L.p("清除用户功能表数量为0");
            	  }
            	  RoleFun roleFun=ContextLoader.getCurrentWebApplicationContext().getBean(RoleFun.class);		
            	//删除角色功能表void
            	  if(roleFun.delFunIdToRoleFun(funcId)==0){
            		  L.p("清除角色功能表数量为0");
            	  }
            	  UserButton userButton=ContextLoader.getCurrentWebApplicationContext().getBean(UserButton.class);		
            	//删除人员按钮表void
            	  if(userButton.delFunIdToUserButton(funcId)==0){
            		  L.p("清除人员按钮表数量为0"); 
            	  }
            	  Button button=ContextLoader.getCurrentWebApplicationContext().getBean(Button.class);		
            	//删除按钮表void
            	  if(button.delButtonForFuncId(funcId)==0){
            		  L.p("清除按钮表数量为0"); 
            	  }
            	  
            	  returnJson.setState(0);
            	  returnJson.setMessage("功能已删除");    
              }else{
            	  returnJson.setState(-1);
            	  returnJson.setMessage("对不起!功能删除失败");  
              }
            }else{
            	returnJson.setState(-1);
            	returnJson.setMessage("对不起!有下级功能,暂不能删除");
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
	L.opLog(Thread.currentThread() .getStackTrace(), request, "删除功能", returnJson.getMessage());
	return returnJson.getJson();
}


}
