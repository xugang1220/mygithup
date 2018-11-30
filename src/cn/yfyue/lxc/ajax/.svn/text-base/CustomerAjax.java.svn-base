package cn.yfyue.lxc.ajax;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.lxc.bll.Customer;
import cn.yfyue.lxc.db.model.CustomerStatement;
import cn.yfyue.lxc.db.model.TLxcCustomer;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value = "CustomerAjax")
public class CustomerAjax {
	private Customer customer = ContextLoader.getCurrentWebApplicationContext().getBean(Customer.class);

	// 进入查询客户资金流水
	public String getCustomerStatementList(@AjaxParam("qkey") String qkey,
			@AjaxParam("startDate") String startDate,
			@AjaxParam("endDate") String endDate,
			@AjaxParam("page") String page,
			@AjaxParam("rows") String rows,
			@AjaxParam("type") String type,ServletRequest request) {
			qkey = F.isNull(qkey);
			int nPage = F.fPage(page);
			int nRowNum = F.fRow(rows);
			ReturnJson returnJson = new ReturnJson();
			List<CustomerStatement> customers = null;
			try {
				if (Auth.isAuth(request)) {
					endDate+=" 23:59:59";
					customers = customer.getCustomerStatementList(qkey, (nPage - 1) * nRowNum, nRowNum,startDate,endDate,type);
					CustomerStatement customersSum=customer.getCustomerStatementListSum(qkey, (nPage - 1) * nRowNum, nRowNum,startDate,endDate,type);
					
					if (customers != null) {
						returnJson.setState(0);
						returnJson.setMessage("操作成功");
						returnJson.setObject(new Object[]{customers,customersSum});
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
		
	// 进入查询客户
	public String getCustomerList(@AjaxParam("qkey") String qkey, @AjaxParam("page") String page,
			@AjaxParam("rows") String rows, ServletRequest request) {
		qkey = F.isNull(qkey);
		int nPage = F.fPage(page);
		int nRowNum = F.fRow(rows);
		ReturnJson returnJson = new ReturnJson();
		List<TLxcCustomer> customers = null;
		try {
			if (Auth.isAuth(request)) {
				customers = customer.getCustomerList(qkey, (nPage - 1) * nRowNum, nRowNum);
				if (customers != null) {
					returnJson.setState(0);
					returnJson.setMessage("操作成功");
					returnJson.setObject(customers);
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
	public String getCustomerListCount(@AjaxParam("qkey") String qkey, ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();

		int dataTotalRowNum = 0;
		qkey = F.isNull(qkey);
		try {
			if (Auth.isAuth(request)) {
				dataTotalRowNum = customer.getCustomerListCount(qkey);
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
	
	// 列表统计客户资金流水
		public String getCustomerStatementListCount(@AjaxParam("qkey") String qkey,@AjaxParam("startDate") String startDate,
				@AjaxParam("endDate") String endDate, 
				@AjaxParam("type") String type,
				ServletRequest request) {
			ReturnJson returnJson = new ReturnJson();

			int dataTotalRowNum = 0;
			qkey = F.isNull(qkey);
			try {
				if (Auth.isAuth(request)) {
					endDate+=" 23:59:59";
					dataTotalRowNum = customer.getCustomerStatementListCount(qkey,startDate,endDate,type);
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

	// 根据id删除客户
	public String delCustomerById(@AjaxParam("id") String id, ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();
		id = F.isNull(id);
		try {
			if (Auth.isAuth(request)) {
				if (id != null) {
					if (customer.delCustomerById(id) == 0) {
						returnJson.setState(0);
						returnJson.setMessage("数据已删除");
					}
				}
			} else {
				returnJson.setState(-997);
				returnJson.setMessage("请登录,再操作");
			}
		} catch (Exception e) {
			returnJson.setState(-1);
			returnJson.setMessage(e.toString());
			e.printStackTrace();
		}
		L.opLog(Thread.currentThread().getStackTrace(), request, "删除客户", returnJson.getMessage());
		return returnJson.getJson();
	}

	// 取消管理员
	public String CancleCustomerById(@AjaxParam("admin") String admin, @AjaxParam("id") String id, ServletRequest request) {
		L.printRequest(Thread.currentThread().getStackTrace(), request);
		ReturnJson returnJson = new ReturnJson();
		int cid = F.StrToInt(id);
		boolean adminid = admin == null || "false".equals(admin) ? true : false;
		try {
			if (Auth.isAuth(request)) {
				if (customer.upCustomerById(cid, adminid) == 1) {
					returnJson.setState(0);
					returnJson.setMessage("取消成功！");
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("对不起,设置失败");
				}
			
			} else {
				returnJson.setState(-1);
				returnJson.setMessage("请登录后,再操作...");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		L.opLog(Thread.currentThread().getStackTrace(), request, "取消管理员", returnJson.getMessage());
		return returnJson.getJson();
	}
	// 设置管理员
		public String upCustomerById(@AjaxParam("admin") String admin, @AjaxParam("id") String id, ServletRequest request) {
			L.printRequest(Thread.currentThread().getStackTrace(), request);
			ReturnJson returnJson = new ReturnJson();
			int cid = F.StrToInt(id);
			boolean adminid = admin == null || "false".equals(admin) ? true : false;
			try {
				if (Auth.isAuth(request)) {
					if (customer.upCustomerById(cid, adminid) == 1) {
						returnJson.setState(0);
						returnJson.setMessage("设置成功!---------true");
					} else {
						returnJson.setState(-1);
						returnJson.setMessage("对不起,设置失败");
					}
				
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("请登录后,再操作...");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			L.opLog(Thread.currentThread().getStackTrace(), request, "设置管理员", returnJson.getMessage());
			return returnJson.getJson();
		}
		//新增客户
		public String addCustomer(@AjaxParam("cname") String cname, @AjaxParam("remove") String remove,
				@AjaxParam("createTime") String createTime, @AjaxParam("updateTime") String updateTime,
				@AjaxParam("wechatId") String wechatId, @AjaxParam("admin") String admin,
				@AjaxParam("rechargeMoney") String rechargeMoney, @AjaxParam("givingMoney") String givingMoney,
				ServletRequest request) {
			ReturnJson returnJson = new ReturnJson();
			cname = F.isNull(cname);
			remove = F.isNull(remove);
			createTime = F.isNull(createTime);
			updateTime = F.isNull(updateTime);
			wechatId = F.isNull(wechatId);
			admin = F.isNull(admin);
			rechargeMoney = F.isNull(rechargeMoney);
			givingMoney = F.isNull(givingMoney);
			TLxcCustomer tLxcCustomer = null;
			try {
				if (Auth.isAuth(request)) {
					tLxcCustomer = new TLxcCustomer();
					tLxcCustomer.setCname(cname);
					tLxcCustomer.setRemove(Boolean.getBoolean(remove));
					tLxcCustomer.setCreateTime(F.stringToDate(createTime,"yyyy-MM-dd HH:mm:ss"));
					tLxcCustomer.setUpdateTime(F.stringToDate(updateTime,"yyyy-MM-dd HH:mm:ss"));
					tLxcCustomer.setWechatId(wechatId);
					tLxcCustomer.setAdmin(Boolean.getBoolean(admin));
					tLxcCustomer.setRechargeMoney(F.strToFloat(rechargeMoney));
					tLxcCustomer.setGivingMoney(F.strToFloat(rechargeMoney));
					if (customer.addCustomer(tLxcCustomer) > 0) {
						returnJson.setState(0);
						returnJson.setMessage("添加客户成功");
					} else {
						returnJson.setState(-1);
						returnJson.setMessage("对不起!添加客户失败");
					}
				} else {
					returnJson.setState(-997);
					returnJson.setMessage("请登录后,再操作...");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			L.opLog(Thread.currentThread().getStackTrace(), request, "添加客户", returnJson.getMessage());
			return returnJson.getJson();
		}
}
