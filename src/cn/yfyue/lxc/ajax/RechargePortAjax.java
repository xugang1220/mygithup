package cn.yfyue.lxc.ajax;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.lxc.bll.Recharge;
import cn.yfyue.lxc.db.model.TLxcPackageRecharge;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value = "RechargePortAjax")
public class RechargePortAjax {
	private Recharge recharge = ContextLoader.getCurrentWebApplicationContext().getBean(Recharge.class);
	//报表查询统计客户
	public String getRechargePortList(@AjaxParam("startDate") String startDate,@AjaxParam("endDate")String endDate,@AjaxParam("page") String page,
			@AjaxParam("rows") String rows, ServletRequest request) {
		List<TLxcPackageRecharge> lxcPackageRecharges = null;
		List<TLxcPackageRecharge> lxcSumoney = null;
		String q_b_time = null;
		String q_e_time = null;
		int nPage = F.fPage(page);
		int nRowNum = F.fRow(rows);
		startDate=F.isNull(startDate);
		endDate=F.isNull(endDate);
		ReturnJson returnJson = new ReturnJson();
		try {
			if (Auth.isAuth(request)) {
				if (startDate != null) {
					q_b_time = startDate.trim() + " 00:00:00";
				}
				if (endDate != null) {
					q_e_time = endDate.trim() + " 23:59:59";
				}
				lxcPackageRecharges = recharge.getRechargePortList(q_b_time,q_e_time, (nPage - 1) * nRowNum, nRowNum);
				lxcSumoney = recharge.getRechargeSumoney(q_b_time,q_e_time);
				if (lxcPackageRecharges != null || lxcSumoney!=null) {
					returnJson.setState(0);
					returnJson.setMessage("操作成功");
					returnJson.setObject(new Object[]{lxcPackageRecharges,lxcSumoney});
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
		public String getRechargeListCount(@AjaxParam("startDate") String startDate,@AjaxParam("endDate")String endDate, ServletRequest request) {
			ReturnJson returnJson = new ReturnJson();
			int dataTotalRowNum = 0;
			startDate = F.isNull(startDate);
			endDate= F.isNull(endDate);
			
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
					dataTotalRowNum = recharge.getRechargePortCount(q_b_time,q_e_time);
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
}
