package cn.yfyue.yyzt.ajax;

import java.util.List;
import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.yyzt.db.bll.OOrge;
import cn.yfyue.yyzt.db.model.OpOrge;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value="OpOrgeAjax")
public class OpOrgeAjax{
	
private OOrge oOrge=ContextLoader.getCurrentWebApplicationContext().getBean(OOrge.class);		

// 取列表
public String getOrgeList(@AjaxParam("qkey") String qkey,
		@AjaxParam("page") String page,
		@AjaxParam("rows") String rows,
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	qkey=F.isNull(qkey);
	int nPage = F.fPage(page);
	int nRowNum = F.fRow(rows);
	List<OpOrge> dataList = null;
	try {
		if (Auth.isAuth(request)) {
			dataList = oOrge.getOrgeList(qkey, (nPage - 1) * nRowNum, nRowNum);
			returnJson.setState(0);
			returnJson.setMessage("操作成功");
			returnJson.setObject(dataList);
		} else {
			returnJson.setState(-997);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		returnJson.setState(-1);
		returnJson.setMessage(e.toString());
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//统计
public String getOrgeListCount(@AjaxParam("qkey") String qkey,
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	int dataTotalRowNum=0;
	qkey=F.isNull(qkey);
	try {
		if (Auth.isAuth(request)) {
			// 取最大行数
			dataTotalRowNum = oOrge.getOrgeListCount(qkey);
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
//取单个
public String getOrgeInfo(@AjaxParam("orgeId") String orgeId,
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	orgeId = F.isNull(orgeId);
	OpOrge opOrge = null;
	try {
		if (Auth.isAuth(request)) {
			if(orgeId!=null){	
			  opOrge=oOrge.getOrgeInfo(orgeId);
			  if(opOrge!=null){
				 returnJson.setState(0);
				 returnJson.setMessage("操作成功");
				 returnJson.setObject(opOrge);
			  }else{
				 returnJson.setState(-1);
				 returnJson.setMessage("对不起!获取数据失败");    
			  }
		   }else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!数据格式错误");  
		   }
		} else {
			returnJson.setState(-997);
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
public String upOrge(@AjaxParam("orgeId") String orgeId,
		@AjaxParam("orgeName") String orgeName,
		@AjaxParam("orgeFullName") String orgeFullName,
		@AjaxParam("orgeAddr") String orgeAddr,
		@AjaxParam("orgeTel") String orgeTel,
		@AjaxParam("email") String email,
		@AjaxParam("linkMan") String linkMan,	
		ServletRequest request) {
	L.printRequest(null, request);
	ReturnJson returnJson=new ReturnJson();
	orgeId = F.isNull(orgeId);
	orgeName = F.isNull(orgeName);
	orgeFullName = F.isNull(orgeFullName);
	orgeAddr = F.isNull(orgeAddr);
	orgeTel = F.isNull(orgeTel);
	email = F.isNull(email);
	linkMan = F.isNull(linkMan);
	OpOrge opOrge=new OpOrge();
	OpOrge myOrge=null;
	int nflag = 0;
	try {
		if (Auth.isAuth(request)) {
			if(orgeId!=null && orgeName!=null){	
				myOrge=oOrge.getOrgeInfo(orgeId);
				if(myOrge != null){ 	
					if(myOrge.getOrgeName() != null &&
							!myOrge.getOrgeName().equals(orgeName)){
						if(oOrge.isOrgeName(orgeName)==0) {
							opOrge.setOrgeName(orgeName);
						} else {
							nflag = 1;
						}
					}
					if(nflag == 1){
						returnJson.setState(-1);
						returnJson.setMessage("对不起!组织名称已存在"); 
					}else{
					  	opOrge.setOrgeId(orgeId);
	                 	opOrge.setEmail(email);
	                 	opOrge.setLinkMan(linkMan);
	                 	opOrge.setOrgeAddr(orgeAddr);
	                 	opOrge.setOrgeFullName(orgeFullName);
	                 	opOrge.setOrgeTel(orgeTel);
	                 	if(oOrge.upOrge(opOrge)>0){
	                 		returnJson.setState(0);
	                 		returnJson.setMessage("数据更新成功"); 
	                 	}else{
	                 		returnJson.setState(-1);
	                 		returnJson.setMessage("对不起!数据更新失败");    
	                 	}
					}
				}else{
					 returnJson.setState(-1);
					 returnJson.setMessage("对不起!获取组织信息失败");    
				}
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起！数据格式错误");				
			}
		} else {
			returnJson.setState(-997);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		returnJson.setState(-1);
		returnJson.setMessage(e.toString());  
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "更新组织", returnJson.getMessage());
	return returnJson.getJson();
}
//删除
public String delOrge(@AjaxParam("orgeId") String orgeId,
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	orgeId = F.isNull(orgeId);
	try {
		if (Auth.isAuth(request)) {
			if(orgeId!=null){	
              if(oOrge.getOrgeIsUse(orgeId)==0){
            	  if(oOrge.getOrgeIsChild(orgeId)==0){
            		  if(oOrge.delOrge(orgeId)>0){
                			returnJson.setState(0);
                  		    returnJson.setMessage("数据已删除");      
            		  }else{
              			returnJson.setState(-1);
              		    returnJson.setMessage("对不起!删除失败");      
            		  }
            	  }else{
        			returnJson.setState(-1);
          		    returnJson.setMessage("对不起!有下级组织,不能删除");      
            	  }
              }else{
  				returnJson.setState(-1);
  				returnJson.setMessage("对不起!该组织存在登录账号，不能删除");    
              }
		   }else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起!数据格式错误");  
		   }
		} else {
			returnJson.setState(-997);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		returnJson.setState(-1);
		returnJson.setMessage(e.toString());  
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "删除组织", returnJson.getMessage());
	return returnJson.getJson();
}
}