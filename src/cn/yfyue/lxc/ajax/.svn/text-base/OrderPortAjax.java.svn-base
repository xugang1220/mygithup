package cn.yfyue.lxc.ajax;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.JsonUtil;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.lxc.bll.Order;
import cn.yfyue.lxc.db.model.TLxcOrder;
import cn.yfyue.sysauth.bll.Init;
import cn.yfyue.sysauth.db.model.BjInitData;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value = "OrderPortAjax")
public class OrderPortAjax {
	private Order order = ContextLoader.getCurrentWebApplicationContext().getBean(Order.class);
	
	private Init init = ContextLoader.getCurrentWebApplicationContext().getBean(Init.class);
	// 进入查询所有订单
	public String getOrderPortList(@AjaxParam("startDate") String startDate,@AjaxParam("endDate")String endDate,@AjaxParam("typeCode")String typeCode,@AjaxParam("page") String page,
			@AjaxParam("rows") String rows, ServletRequest request) {
		List<TLxcOrder> orders = null;
		List<TLxcOrder> tLxcOrders = null;
		String q_b_time = null;
		String q_e_time = null;
		int nPage = F.fPage(page);
		int nRowNum = F.fRow(rows);
		startDate=F.isNull(startDate);
		endDate=F.isNull(endDate);
		typeCode=F.isNull(typeCode);
		ReturnJson returnJson = new ReturnJson();
		try {
			if (Auth.isAuth(request)) {
				if (startDate != null) {
					q_b_time = startDate.trim() + " 00:00:00";
				}
				if (endDate != null) {
					q_e_time = endDate.trim() + " 23:59:59";
				}
				orders = order.getOrderPortList(q_b_time,q_e_time,typeCode, (nPage - 1) * nRowNum, nRowNum);
				tLxcOrders = order.getOrderSumMoney(q_b_time,q_e_time, typeCode);
				if (orders != null || tLxcOrders!=null) {
					returnJson.setState(0);
					returnJson.setMessage("操作成功");
					returnJson.setObject(new Object[]{orders,tLxcOrders});
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("获取数据失败");
				}
			} else {
				returnJson.setState(-997);
				returnJson.setMessage("请登录,再操作");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnJson.getJson();
	}

	// 订单列表统计
	public String getOrderPortCount(@AjaxParam("startDate") String startDate,@AjaxParam("endDate")String endDate,@AjaxParam("typeCode")String typeCode,@AjaxParam("page") String page,
			@AjaxParam("rows") String rows,ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();
		int dataTotalRowNum = 0;
		startDate = F.isNull(startDate);
		endDate = F.isNull(endDate);
		typeCode=F.isNull(typeCode);
		int nPage = F.fPage(page);
		int nRowNum = F.fRow(rows);
		String q_b_time = null;
		String q_e_time = null;
		try {
			if (Auth.isAuth(request)) {
				if (startDate != null) {
					q_b_time = startDate.trim() + " 00:00:00";
				}
				if (endDate != null) {
					q_e_time = endDate.trim() + " 23:59:59";
				}
				dataTotalRowNum = order.getOrderPortCount(q_b_time,q_e_time,typeCode,(nPage - 1) * nRowNum, nRowNum);
				returnJson.setObject(dataTotalRowNum);
				returnJson.setState(0);
				returnJson.setMessage("操作成功");
			} else {
				returnJson.setState(-997);
				returnJson.setMessage("请登录后,再操作...");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnJson.getJson();
	}
	
	//配置小区类型列表
	public String getTypeCode(ServletRequest request) {
		ReturnJson returnJson=new ReturnJson();
		List<BjInitData> lxcOrder=null;
		try {
			if (Auth.isAuth(request)) {
			lxcOrder = init.getInittypecode();
			System.out.println("lxcder----:" + JsonUtil.toJson(lxcOrder));
			returnJson.setState(0);
			returnJson.setMessage("操作成功");
	        returnJson.setObject(lxcOrder);
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
