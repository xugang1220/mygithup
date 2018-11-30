package cn.yfyue.sysauth.bll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.yfyue.sysauth.db.inter.BjUserFuncMapper;
import cn.yfyue.sysauth.db.model.BjUserFunc;

@Service
public class UserFun {
@Autowired	
private BjUserFuncMapper bjUserFuncMapper;
//取用户的权限
public List<BjUserFunc> getUserFuncList(String userId,String adminLevel) {
	return bjUserFuncMapper.getUserFuncList(userId, adminLevel);
}
//添加分配权限
public int addUserFunc(BjUserFunc bjUserFunc ) {
	return bjUserFuncMapper.addUserFunc(bjUserFunc);
}
//按功能ID清掉权限
public int delFunIdToUserFunc(String funcId) {
	return bjUserFuncMapper.delFunIdToUserFunc(funcId);
}
//按用户ID清掉权限
public int delUserIdToUserFunc(String userId) {
	return bjUserFuncMapper.delUserIdToUserFunc(userId);
}
//验证是否有权使用
public int isUserFunc(String userId,String funcId) {
	return bjUserFuncMapper.isUserFunc(userId, funcId);
}
}
