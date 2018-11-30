package cn.yfyue.sysauth.db.inter;

import cn.yfyue.sysauth.db.model.BjHelpDoc;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BjHelpDocMapper {
//列表
List<BjHelpDoc> getHelpDocList(@Param("query_key")String query_key,
		@Param("b_time")String b_time,@Param("e_time")String e_time,
		@Param("startRow")int startRow,@Param("rowNum")int rowNum);
//统计
int getHelpDocListCount(@Param("query_key")String query_key,
		@Param("b_time")String b_time,@Param("e_time")String e_time);
//取单个	
BjHelpDoc getHelpDocInfo(String docId);
//添加
int addHelpDoc(BjHelpDoc bjHelpDoc);
//删除
int delHelpDoc(String docId);
//更新
int upHelpDoc(BjHelpDoc bjHelpDoc); 
//验证码是否存在
int isDocCode(String docCode);
}