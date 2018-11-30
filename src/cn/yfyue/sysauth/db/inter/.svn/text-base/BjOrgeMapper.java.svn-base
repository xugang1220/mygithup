package cn.yfyue.sysauth.db.inter;

import cn.yfyue.sysauth.db.model.BjOrge;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BjOrgeMapper {
//取所有部门
List<BjOrge> getOrgeList(@Param("orgeState")String orgeState);
//添加
int addOrge(BjOrge bjOrge);
//取单个
BjOrge getOrgeInfo(String orgeId);
//更新
int upOrge(BjOrge bjOrge);
//删除
int delOrge(String orgeId);
//是否下级
int getOrgeIsChild(String orgeId); 
//是否已使用
int getOrgeIsUse(String orgeId);
}