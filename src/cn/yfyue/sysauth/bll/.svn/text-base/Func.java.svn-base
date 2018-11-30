package cn.yfyue.sysauth.bll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.yfyue.sysauth.db.inter.BjFuncMapper;
import cn.yfyue.sysauth.db.model.BjFunc;

@Service
public class Func {
@Autowired	
private BjFuncMapper bjFuncMapper;
//取所有功能
public List<BjFunc> getFuncAllList() {
  return bjFuncMapper.getFuncAllList();
}	
//添加
public int addFunc(BjFunc bjFunc ) {
	return bjFuncMapper.addFunc(bjFunc);
}	
//获取单个
public BjFunc getFuncInfo(String funcId) {
	return bjFuncMapper.getFuncInfo(funcId);
}
//更新
public int upFunc(BjFunc bjFunc) {
	return bjFuncMapper.upFunc(bjFunc);
}
//删除
public int delFunc(String funcId) {
	return bjFuncMapper.delFunc(funcId);
}
//是否有子节点
public int getFuncIsChild(String funcId) {
	return bjFuncMapper.getFuncIsChild(funcId);
}	


//删除用户功能表void
//删除角色功能表void
//删除人员按钮表void
//删除按钮表void

}
