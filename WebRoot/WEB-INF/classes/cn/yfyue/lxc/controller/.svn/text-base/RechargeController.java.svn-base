package cn.yfyue.lxc.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.ReturnJson;
import cn.yfyue.lxc.ajax.CodeToStr;
import cn.yfyue.lxc.bll.Customer;
import cn.yfyue.lxc.bll.Recharge;
import cn.yfyue.lxc.db.model.TLxcCustomer;
import cn.yfyue.lxc.db.model.TLxcPackageRecharge;

@Controller
public class RechargeController {
	private Recharge reharge = ContextLoader.getCurrentWebApplicationContext().getBean(Recharge.class);
	private Customer cust = ContextLoader.getCurrentWebApplicationContext().getBean(Customer.class);

	//根据openid查询客户个人中心充值接口
	@RequestMapping(value = "/reharge/findRecharge/{nPage}/{nRowNum}", method = { RequestMethod.GET })
	@ResponseBody
	public ReturnJson findRecharge(HttpServletResponse response,@RequestParam(value="openId") String openId,@PathVariable("nPage")int nPage, @PathVariable("nRowNum")int nRowNum) {
		//跨域请求
		CodeToStr co=new CodeToStr();
		co.setScoreHttp(response);
		ReturnJson result=new ReturnJson();
		TLxcCustomer customer= cust.findCustomerByopenId(openId).get(0);
		
		nRowNum = nRowNum > 0 ? nRowNum:10;
		int startRow =  (nPage = nPage > 0 ? nPage:0) * nRowNum;
		List<TLxcPackageRecharge> discounts = reharge.findRechargeList(customer.getId().toString(), startRow, nRowNum);
		result.setState(0);
		result.setObject(discounts);
		result.setMessage("查询个人充值金额成功");
		return result;
	}
}
