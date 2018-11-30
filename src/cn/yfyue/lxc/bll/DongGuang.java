package cn.yfyue.lxc.bll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yfyue.lxc.db.inter.DongguanMapper;
import cn.yfyue.lxc.db.model.Dongguan;

@Service
public class DongGuang {
	@Autowired
	private DongguanMapper dongguanMapper;
	
	//查询全部带分页条件
	public List<Dongguan> getDongGuangList(String qkey,int startRow,int rownum){
		return dongguanMapper.getDongGuangList(qkey, startRow, rownum);
	}
}
