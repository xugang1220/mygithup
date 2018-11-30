package cn.yfyue.yyzt.db.bll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yfyue.yyzt.db.inter.OpUserMapper;
import cn.yfyue.yyzt.db.model.OpUser;

@Service
public class OUser {
@Autowired
private OpUserMapper opUserMapper;
//用户列表
public List<OpUser> getUserList(String orgeId,String qkey,int startRow,int rowNum) {
	return opUserMapper.getUserList(orgeId, qkey, startRow, rowNum);
}
// 用户列表统计
public int getUserListCount(String orgeId,String qkey) {
	return opUserMapper.getUserListCount(orgeId, qkey);
}	
//初始化密码
public int initPasswd(String userId, String passwd) {
	return opUserMapper.initPasswd(userId, passwd);
}
//用户名是否存在
public int isLoginName(String loginName) {
	return opUserMapper.isLoginName(loginName);
}
//启用账户
public int enabledUser(String userId) {
	return opUserMapper.enabledUser(userId);
}
//禁用账户
public int disabledUser(String userId) {
	return opUserMapper.disabledUser(userId);
}
//取自己的信息
public OpUser getUserInfo(String userId) {
	return opUserMapper.getUserInfo(userId);
}	
//更新账户信息
public int upUser(OpUser opUser) {
	return opUserMapper.upUser(opUser);
}
//添加账户
public int addUser(OpUser opUser) {
	return opUserMapper.addUser(opUser);
}
}
