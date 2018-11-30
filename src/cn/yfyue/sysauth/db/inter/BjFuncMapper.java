package cn.yfyue.sysauth.db.inter;

import cn.yfyue.sysauth.db.model.BjFunc;
import java.util.List;

public interface BjFuncMapper {
//取所有功能
List<BjFunc> getFuncAllList();
//添加
int addFunc(BjFunc bjFunc);
//获取单个
BjFunc getFuncInfo(String funcId);
//更新
int upFunc(BjFunc bjFunc);
//删除
int delFunc(String funcId);
//是否有子节点
int getFuncIsChild(String funcId); 
}