package cn.yfyue.sysauth.ajax;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.sysauth.bll.Role;
import cn.yfyue.sysauth.bll.UserRole;
import cn.yfyue.sysauth.db.model.BjRole;
import cn.yfyue.sysauth.db.model.BjUserRole;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value="UserRoleAjax")
public class UserRoleAjax {
private Role role=ContextLoader.getCurrentWebApplicationContext().getBean(Role.class);	
private UserRole userRole=ContextLoader.getCurrentWebApplicationContext().getBean(UserRole.class);	
//取出用户的拥有的角色
public String getUserRoleList(
		@AjaxParam("userId") String userId,
		ServletRequest request) {
	ReturnJson returnJson=new ReturnJson();
	userId=F.isNull(userId);
	List<UserRoleCheckbox> userRoleCheckBoxList = null;
	List<BjUserRole> userRoleList=null;
	List<BjRole> allRoleList = null;
	try {
		if (Auth.isAuth(request)) {
		  if(userId!=null){
			allRoleList = role.getAllRoleList(null);
			userRoleList=userRole.getUserRoleList(userId);
			if(allRoleList!=null && !allRoleList.isEmpty()){
			  userRoleCheckBoxList=new ArrayList<UserRoleCheckbox>(); 
			   for(int i=0;i<allRoleList.size();i++){
				   BjRole bjRole=(BjRole)allRoleList.get(i); 
				 if(bjRole!=null){
					 UserRoleCheckbox userRoleCheckbox=new UserRoleCheckbox(); 
					 userRoleCheckbox.setCheckboxChecked(checkbox(userRoleList,""+bjRole.getRoleId()));
					 userRoleCheckbox.setCheckboxId(""+bjRole.getRoleId());
					 userRoleCheckbox.setCheckboxName(bjRole.getRoleName());
					 userRoleCheckbox.setCheckboxValue(""+bjRole.getRoleId());
					 userRoleCheckbox.setOrgeFullName(bjRole.getOrgeFullName());
					 userRoleCheckBoxList.add(userRoleCheckbox);
				 }
			   }
			}
			if(userRoleCheckBoxList!=null && !userRoleCheckBoxList.isEmpty()){
				returnJson.setState(0);
				returnJson.setMessage("系统角色获取成功");
				returnJson.setObject(userRoleCheckBoxList);
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("对不起！暂未获取到角色配置");			
			}
		  }else{
			returnJson.setState(-1);
			returnJson.setMessage("对不起！数据格式错误");	
		  }
		}else{
			returnJson.setState(-997);
			returnJson.setMessage("请登录,再操作");
		}		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
//更新用户角色
public String upUserRole(
		@AjaxParam("userId") String userId,
		@AjaxParam("userRoles") String userRoles,
		ServletRequest request) {
	userId=F.isNull(userId);
	userRoles=F.isNull(userRoles);
	ReturnJson returnJson=new ReturnJson();
	L.p("userId["+userId+"] userRoles["+userRoles+"]");
	try {
		if (Auth.isAuth(request)) {
		  if(userId!=null){
			if(userRoles!=null && !userRoles.isEmpty()){
			   String roleArr[]=userRoles.split(",");
			   if(roleArr!=null && roleArr.length>0){
				 if(userRole.delUserRole(userId)==0){
                    L.p("删除用户已分配角色失败");
				 }	 
				  for(int i=0;i<roleArr.length;i++){
						if(roleArr[i]!=null && !roleArr[i].isEmpty()){
							BjUserRole bjUserRole=new BjUserRole();
							bjUserRole.setUserId(F.strToLong(userId));
							bjUserRole.setRoleId(F.strToLong(roleArr[i]));
						   //存入数据库
						   if(userRole.addUserRole(bjUserRole)==0){
							   L.p("用户角色分配数据保存失败 userId["+userId+"] roleId["+roleArr[i]+"]");
						   }
						 }
					 }	
					returnJson.setState(0);
					returnJson.setMessage("用户角色已更新");	
			   }else{
				 returnJson.setState(-1);
				 returnJson.setMessage("对不起！角色解析失败");	   
			   }				
			}else{
			  if(userRole.delUserRole(userId)>0){
				  returnJson.setState(0);
				  returnJson.setMessage("用户角色已全部收回");	
			  }else{
				  returnJson.setState(-1);
				  returnJson.setMessage("对不起！收回用户角色失败");			
			  }
			}
		 }else{
			returnJson.setState(-1);
			returnJson.setMessage("对不起!数据格式错误");
		  }
		}else{
			returnJson.setState(-997);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}

//字符串与LIST值相比较
public String checkbox(List<BjUserRole> userRoleList,String biDuiValue){
String checkValue="";
String roleId=null;
try{
	if(userRoleList!=null && !userRoleList.isEmpty()){
	   for(int i=0;i<userRoleList.size();i++){
		   BjUserRole bjUserRole=(BjUserRole)userRoleList.get(i);
		   if(bjUserRole!=null){
			 if(bjUserRole.getRoleId()!=null){
				 roleId=""+bjUserRole.getRoleId();	 
			   if(roleId.equals(biDuiValue)){
				   checkValue="checked"; 
			   }
			 }
		   }
	   }
	}
}catch(Exception e){e.printStackTrace();}
return checkValue;
}
}
