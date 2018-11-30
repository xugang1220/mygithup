package cn.yfyue.sysauth.ajax;

import java.util.List;
import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;
import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.sysauth.bll.Log;

@AjaxClass(value="LogAjax")
public class LogAjax{
	
private Log log=ContextLoader.getCurrentWebApplicationContext().getBean(Log.class);		

//列表
public String logList(@AjaxParam("query_key") String query_key,
		@AjaxParam("log_type") String log_type,
		@AjaxParam("b_time") String b_time,
		@AjaxParam("e_time") String e_time,
		@AjaxParam("page") String page,
		@AjaxParam("rows") String rows,
		ServletRequest request) {
   
	List dataList = null;
	ReturnJson returnJson=new ReturnJson();
	int nPage = F.fPage(page);
	int nRowNum=F.fRow(rows);
	String q_b_time = null;
	String q_e_time = null;
	query_key=F.isNull(query_key);
	log_type=F.isNull(log_type);
	b_time=F.isNull(b_time);
	e_time=F.isNull(e_time);
	try {
		if (b_time != null) {
			q_b_time = b_time.trim() + " 00:00:00";
		}
		if (e_time != null) {
			q_e_time = e_time.trim() + " 23:59:59";
		}
		if (Auth.isAuth(request)) {
		
		// 取最大行数
		dataList = log.logList(Auth.getAuthUserLevel(request), query_key, Auth.getAuthLoginName(request), 
				log_type, q_b_time, q_e_time, (nPage-1)* nRowNum, nRowNum);
		returnJson.setState(0);
		returnJson.setMessage("操作成功");
		returnJson.setObject(dataList);
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}	
//统计
public String logListCount(@AjaxParam("query_key") String query_key,
		@AjaxParam("log_type") String log_type,
		@AjaxParam("b_time") String b_time,
		@AjaxParam("e_time") String e_time,
		ServletRequest request) {
   // L.printRequest(Thread.currentThread() .getStackTrace(), request);
	ReturnJson returnJson=new ReturnJson();
    int dataTotalRowNum=0;
	query_key=F.isNull(query_key);
	log_type=F.isNull(log_type);
	b_time=F.isNull(b_time);
	e_time=F.isNull(e_time);
	String q_b_time = null;
	String q_e_time = null;
	try {
		if (b_time != null) {
			q_b_time = b_time.trim() + " 00:00:00";
		}
		if (e_time != null) {
			q_e_time = e_time.trim() + " 23:59:59";
		}
		if (Auth.isAuth(request)) {
		
		// 取最大行数
		dataTotalRowNum = log.logListCount(Auth.getAuthUserLevel(request), query_key, Auth.getAuthLoginName(request), 
				log_type, q_b_time, q_e_time);
		returnJson.setState(0);
		returnJson.setMessage("操作成功");
		returnJson.setObject(dataTotalRowNum);
		}else{
			returnJson.setState(-1);
			returnJson.setMessage("请登录,再操作");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return returnJson.getJson();
}
}
