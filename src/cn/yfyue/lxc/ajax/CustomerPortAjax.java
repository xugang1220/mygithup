package cn.yfyue.lxc.ajax;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.lxc.bll.Customer;
import cn.yfyue.lxc.db.model.TLxcCustomer;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value = "CustomerPortAjax")
public class CustomerPortAjax {
	private Customer customer = ContextLoader.getCurrentWebApplicationContext().getBean(Customer.class);
	//报表查询统计客户
	public String getCustomerPort(@AjaxParam("startDate") String startDate,@AjaxParam("endDate")String endDate,@AjaxParam("page") String page,
			@AjaxParam("rows") String rows, ServletRequest request) {
		List<TLxcCustomer> customers = null;
		List<TLxcCustomer> tLxcCustomer = null;
		String q_b_time = null;
		String q_e_time = null;
		int nPage = F.fPage(page);
		int nRowNum = F.fRow(rows);
		startDate=F.isNull(startDate);
		endDate=F.isNull(endDate);
		ReturnJson returnJson = new ReturnJson();
		System.out.println("startDate 1 :---------"+startDate);
		System.out.println("endDate 1:---------"+endDate);
		try {
			if (Auth.isAuth(request)) {
				if (startDate != null) {
					q_b_time = startDate.trim() + " 00:00:00";
				}
				if (endDate != null) {
					q_e_time = endDate.trim() + " 23:59:59";
				}
				customers = customer.getCustomerPort(q_b_time,q_e_time, (nPage - 1) * nRowNum, nRowNum);
				tLxcCustomer = customer.getCustomerSumMoney(q_b_time,q_e_time);
				if (customers != null || tLxcCustomer!=null) {
					returnJson.setState(0);
					returnJson.setMessage("操作成功");
					returnJson.setObject(new Object[]{customers,tLxcCustomer});
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
	// 列表统计客户
		public String getCustomerPortCount(@AjaxParam("startDate") String startDate,@AjaxParam("endDate")String endDate, ServletRequest request) {
			ReturnJson returnJson = new ReturnJson();
			int dataTotalRowNum = 0;
			startDate = F.isNull(startDate);
			endDate = F.isNull(endDate);
			
			String q_b_time = null;
			String q_e_time = null;
			System.out.println("startDate 2:---------"+startDate);
			System.out.println("endDate 2:---------"+endDate);
			try {
				if (Auth.isAuth(request)) {
					if (startDate != null) {
						q_b_time = startDate.trim() + " 00:00:00";
					}
					if (endDate != null) {
						q_e_time = endDate.trim() + " 23:59:59";
					}
					dataTotalRowNum = customer.getCustomerPortCount(q_b_time,q_e_time);
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
	//显示客户总充值和赠送金额
//		public String getCustomerSumMoney(@AjaxParam("startDate") String startDate,@AjaxParam("endDate")String endDate,@AjaxParam("page") String page,
//				@AjaxParam("rows") String rows,ServletRequest request){
//			ReturnJson returnJson = new ReturnJson();
//			List<TLxcCustomer> tLxcCustomer = null;
//			int nPage = F.fPage(page);
//			int nRowNum = F.fRow(rows);
//			startDate=F.isNull(startDate);
//			endDate=F.isNull(endDate);
//			try {
//				if (Auth.isAuth(request)) {
//					if (startDate != null) {
//						startDate = startDate.trim() + " 00:00:00";
//					}
//					if (endDate != null) {
//						endDate = endDate.trim() + " 23:59:59";
//					}
//					tLxcCustomer = customer.getCustomerSumMoney(startDate,endDate,(nPage - 1) * nRowNum, nRowNum);
//					returnJson.setObject(tLxcCustomer);
//					returnJson.setState(0);
//					returnJson.setMessage("操作成功");
//				} else {
//					returnJson.setState(-997);
//					returnJson.setMessage("请登录后,再操作...");
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return returnJson.getJson();
//		}
}
