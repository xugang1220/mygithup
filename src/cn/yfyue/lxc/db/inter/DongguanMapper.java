package cn.yfyue.lxc.db.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.yfyue.lxc.db.model.Dongguan;

public interface DongguanMapper {   
    int deleteByPrimaryKey(Integer mid);   
    
    int insert(Dongguan record);  
    
    Dongguan selectByPrimaryKey(Integer mid);    
    
    List<Dongguan> selectAll();
    
    List<Dongguan> getDongGuangList(@Param("qkey")String qkey,@Param("startRow")int startRow,@Param("rownum")int rownum);
    
    int updateByPrimaryKey(Dongguan record);
}