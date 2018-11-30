package cn.yfyue.sysauth.bll;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.yfyue.sysauth.db.inter.BjUserMapper;
import cn.yfyue.sysauth.db.model.BjUser;

@Service
public class Login {
@Autowired	
private BjUserMapper bjUserMapper;
//登录
public int isLogin(String login_name, String passwd) {
	return bjUserMapper.isLogin(login_name, passwd);
}	

//取登录数据
public BjUser getUserLoginInfo(String login_name) {
	return bjUserMapper.getUserLoginInfo(login_name);
}	
}
