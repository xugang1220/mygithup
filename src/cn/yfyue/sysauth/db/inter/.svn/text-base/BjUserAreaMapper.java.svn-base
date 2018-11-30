package cn.yfyue.sysauth.db.inter;

import cn.yfyue.sysauth.db.model.BjUserArea;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BjUserAreaMapper {
//取用户的地区
List<BjUserArea> getUserAreaList(@Param("userId")String userId,
		@Param("adminLevel")String adminLevel);
//添加分配权限
int addUserArea(BjUserArea bjUserArea);
//按地区编码清掉权限
int delAreaCodeToUserArea(String areaCode);
//按用户ID清掉权限
int delUserIdToUserArea(String userId);
}