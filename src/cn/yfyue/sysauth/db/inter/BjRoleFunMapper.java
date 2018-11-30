package cn.yfyue.sysauth.db.inter;

import cn.yfyue.sysauth.db.model.BjRoleFun;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BjRoleFunMapper {
//取所有的权限 all
List<BjRoleFun> getAllFuncList();
//取接收角色已分配权限 sendeeRole List<String> roleId
List<BjRoleFun> getRoleFuncList(List<String> roleIds);
//添加分配权限
int addRoleFun(BjRoleFun bjRoleFun);
//按功能ID清掉权限
int delFunIdToRoleFun(String funcId);
//按角色清掉权限
int delRoleIdToRoleFun(String roleId); 
//验证是否有权使用
int isRoleFunc(@Param("roleIds")List<String> roleIds,@Param("funcId")String funcId);
}