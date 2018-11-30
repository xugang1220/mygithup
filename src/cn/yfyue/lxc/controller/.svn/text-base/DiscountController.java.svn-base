package cn.yfyue.lxc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.ResponseResult;
import cn.yfyue.lxc.ajax.CodeToStr;
import cn.yfyue.lxc.bll.Customer;
import cn.yfyue.lxc.bll.Discount;
import cn.yfyue.lxc.bll.Recharge;
import cn.yfyue.lxc.db.inter.TLxcPackageDiscountMapper;
import cn.yfyue.lxc.db.model.TLxcCustomer;
import cn.yfyue.lxc.db.model.TLxcPackageDiscount;
import cn.yfyue.lxc.db.model.TLxcPackageRecharge;

//套餐接口
@Controller
public class DiscountController {
	@Resource TLxcPackageDiscountMapper tLxcPackageDiscountMapper;
	private Discount discount = ContextLoader.getCurrentWebApplicationContext().getBean(Discount.class);
	private Recharge recharge = ContextLoader.getCurrentWebApplicationContext().getBean(Recharge.class);
	//客户
	private Customer cust = ContextLoader.getCurrentWebApplicationContext().getBean(Customer.class);

	// APP查看套餐接口
	@RequestMapping(value = "/discount/findDiscount", method = { RequestMethod.GET })
	@ResponseBody
	public ResponseResult findDiscount(HttpServletResponse response, TLxcPackageDiscount tx) {
		//跨域请求
		CodeToStr co=new CodeToStr();
		co.setScoreHttp(response);
		
		int nPage=1;
		int nRowNum=Integer.MAX_VALUE;
		List<TLxcPackageDiscount> discounts = tLxcPackageDiscountMapper.getDiscountListUnremove(null, (nPage - 1) * nRowNum, nRowNum);
		ResponseResult result=new ResponseResult();
		result.setSuccess(discounts);
		result.setMessage("套餐查询成功");
		return result;

	}
	
	// APP套餐充值接口
		@RequestMapping(value = "/discount/discountRecharge", method = { RequestMethod.POST })
		@ResponseBody
		public ResponseResult discountRecharge(@RequestParam(value="openId") String openId,TLxcPackageRecharge  tLxcPackageRecharge,HttpServletRequest req,HttpServletResponse response ) {
			//跨域请求
			CodeToStr co=new CodeToStr();
			co.setScoreHttp(response);
			ResponseResult result=new ResponseResult();
			TLxcCustomer customer=cust.findCustomerByid(openId).get(0);
			tLxcPackageRecharge.setConsumerId(customer.getId());
			tLxcPackageRecharge.setOrderStatus("ORDERSTATUS_UNPAID");
			recharge.addRecharge(tLxcPackageRecharge,customer);
			result.setMessage("套餐充值成功");
			result.setData(tLxcPackageRecharge.getId());
			return result;
		}

}
