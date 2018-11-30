package cn.yfyue.sysauth.bll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.yfyue.sysauth.db.inter.BjLogMapper;
import cn.yfyue.sysauth.db.model.BjLog;

@Service
public class Log {
@Autowired	
private BjLogMapper bjLogMapper;
//添加LOG
public int addLog(BjLog bjLog ) {
	return bjLogMapper.addLog(bjLog);
}	
//分页总数
public int logListCount(String adminLevel,String query_key, String loginName,String log_type,
		String b_time,String e_time) {
	return bjLogMapper.logListCount(adminLevel, query_key, loginName, log_type, b_time, e_time);
}
//列表分页
public List<BjLog> logList(String adminLevel,String query_key,String loginName, 
		String log_type,String b_time,String e_time,int startRow,int rowNum) {
	return bjLogMapper.logList(adminLevel, query_key, loginName, log_type, b_time, e_time, startRow, rowNum);
}	
}
