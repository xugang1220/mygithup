package cn.yfyue.lxc.ajax;


import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.lxc.bll.DongGuang;
import cn.yfyue.lxc.db.model.Dongguan;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass("DongGuangAjax")
public class DongGuangAjax {
	private DongGuang dongGuang = ContextLoader.getCurrentWebApplicationContext().getBean(DongGuang.class);
	
	public String getGongGuanList(@AjaxParam("qkey")String qkey,@AjaxParam("page")String page,@AjaxParam("rows")String rows,ServletRequest request){
		qkey = F.isNull(qkey);
		int nPage = F.fPage(page);
		int nRowNum = F.fRow(rows);
		ReturnJson returnJson = new ReturnJson();
		List<Dongguan> list = null;
		try {
			if(Auth.isAuth(request)){
				list =  dongGuang.getDongGuangList(qkey, (nPage - 1) * nRowNum, nRowNum);
				if(list != null){
					returnJson.setState(0);
					returnJson.setMessage("操作成功");
					returnJson.setObject(list);
				}else{
					returnJson.setState(-1);
					returnJson.setMessage("获取数据失败");
				}
			}else{
				returnJson.setState(-997);
				returnJson.setMessage("请登录后，再操作");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return returnJson.getJson();
	}
}
