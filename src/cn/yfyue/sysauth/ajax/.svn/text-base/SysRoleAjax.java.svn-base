package cn.yfyue.sysauth.ajax;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.sysauth.bll.Role;
import cn.yfyue.sysauth.db.model.BjRole;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;
@AjaxClass(value="SysRoleAjax")
public class SysRoleAjax {
private Role role=ContextLoader.getCurrentWebApplicationContext().getBean(Role.class);
//列表
public String getRoleList(@AjaxParam("qkey") String qkey,
		@AjaxParam("page") String page,
		@AjaxParam("rows") String rows,
		ServletRequest request) {
	List dataList = null;
	ReturnJson returnJson=new ReturnJson();
	int nPage = F.fPage(page);
	int nRowNum=F.fRow(rows);	
	qkey=F.isNull(qkey);
	try {
		if (Auth.isAuth(request)) {
		// 取最大行数
		dataList = role.getRoleList(qkey, (nPage-1)* nRowNum, nRowNum);
		returnJson.setState(0);
		returnJson.setMessage("操作成功");
		returnJson.setObject(dataList);
		}else{
			returnJson.setState(-977);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}  
//统计
public String getRoleListNum(@AjaxParam("qkey") String qkey,
		ServletRequest request) {
  //L.printRequest(Thread.currentThread() .getStackTrace(), request);
  ReturnJson returnJson=new ReturnJson();
  int dataTotalRowNum=0;
  qkey=F.isNull(qkey);
	try {
		if (Auth.isAuth(request)) {
		// 取最大行数
		  dataTotalRowNum = role.getRoleListNum(qkey);
		  returnJson.setState(0);
		  returnJson.setMessage("操作成功");
		  returnJson.setObject(dataTotalRowNum);
		}else{
			returnJson.setState(-997);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//添加解色
public String addRole(@AjaxParam("roleName") String roleName,
		@AjaxParam("roleKey") String roleKey, 
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	roleName = F.isNull(roleName);
	roleKey = F.isNull(roleKey);
	try {
		if (Auth.isAuth(request)) {
		  if(roleName!=null){	
			  BjRole bjRole=new BjRole();
			  bjRole.setRoleKey(roleKey);
			  bjRole.setRoleName(roleName);
			 if (role.addRole(bjRole) > 0) {
				returnJson.setState(0);
				returnJson.setMessage("角色添加成功");
			 } else {
				returnJson.setState(-1);
				returnJson.setMessage("角色数据保存失败");
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
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "添加角色", returnJson.getMessage());
	return returnJson.getJson();
}
//删除角色
public String delRole(@AjaxParam("roleId") String roleId,
		 ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	roleId = F.isNull(roleId);
	try {
		if (Auth.isAuth(request)) {
		  if(roleId!=null){
			 if(role.isRoleToUser(roleId)==0){
			   if(role.isFuncToRole(roleId)==0){
				 if (role.delRole(roleId) > 0) {
						returnJson.setState(0);
						returnJson.setMessage("角色已删除");
				  } else {
					   returnJson.setState(-1);
					   returnJson.setMessage("角色删除失败");
				  }				   
			   }else{
				   returnJson.setState(-1);
				   returnJson.setMessage("请先删除掉角色分配的功能");   
			   }
			 }else{
				 returnJson.setState(-1);
				 returnJson.setMessage("角色已分配给用户，请先收回");  			 
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
		e.printStackTrace();
	}
	L.opLog(Thread.currentThread() .getStackTrace(), request, "删除角色", returnJson.getMessage());
	return returnJson.getJson();
}

}
