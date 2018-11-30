package cn.yfyue.lxc.db.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.yfyue.lxc.db.model.Hangzhou;

public interface HangzhouMapper {
    
    int deleteByPrimaryKey(Integer mId);

    
    int insertHangzhou(Hangzhou record);

    
    Hangzhou selectByPrimaryKey(Integer mId);
    
    List<Hangzhou> selectAll();
   
    List<Hangzhou> getHangZhouList(@Param("qkey")String qkey,@Param("startRow")int startRow,@Param("rownum")int rownum);

    
    int updateByPrimaryKey(Hangzhou record);
}