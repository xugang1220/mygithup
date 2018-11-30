package cn.yfyue.lxc.bll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yfyue.lxc.db.inter.HangzhouMapper;
import cn.yfyue.lxc.db.model.Hangzhou;

@Service
public class HangZhou {
	@Autowired
	private HangzhouMapper hangzhouMapper;
	
	//查询杭州全部
	public List<Hangzhou> getHangZhouList(String qkey,int startRow,int rownum){
		List<Hangzhou> list=hangzhouMapper.getHangZhouList(qkey, startRow, rownum);
		return list;
	}
	
	//添加杭州面试记录
	public int insertAddHangZhou(Hangzhou hangzhou){
		return hangzhouMapper.insertHangzhou(hangzhou);
	}
}
