package cn.yfyue.lxc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.ResponseResult;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.lxc.ajax.CodeToStr;
import cn.yfyue.lxc.bll.Customer;
import cn.yfyue.lxc.db.inter.TLxcCustomerMapper;
import cn.yfyue.lxc.db.model.TLxcCustomer;

//客户接口
@Controller
public class CustomerController {
	@Resource TLxcCustomerMapper tLxcCustomerMapper;
	private Customer customer=ContextLoader.getCurrentWebApplicationContext().getBean(Customer.class);
	//APP添加客户接口
	@RequestMapping(value = "/customer/addCustomer",method = { RequestMethod.POST})
	@ResponseBody
	public ReturnJson addCustomer(TLxcCustomer tx,HttpServletResponse response) {
		ReturnJson result = new ReturnJson();
		//跨域请求
		CodeToStr co=new CodeToStr();
		co.setScoreHttp(response);
		//获取用户的wechatId
		String weid=tx.getWechatId();
		//根据openId获取用户的wechatId
		String weopid=customer.findCustomerWechatId(weid);
		
		System.out.println("界面获取的wechatid--------"+weid);
		System.out.println("数据库查询的wechatid--------"+weopid);
		if(weopid==null || weopid==""){
			tx.setAdmin(false);
		}
		if(weid.equals(weopid)){
			result.setState(-1);
			result.setMessage("您已注册！！！！！");
		}else if(customer.addCustomer(tx)==1){
			result.setState(0);
			result.setMessage("客户添加成功");
		}else{
			result.setState(-1);
			result.setMessage("客户添加失败");
		}
		return result;
	}
		
	//APP查询客户充值余额接口(全部)
	@RequestMapping(value = "/customer/findCustomer/",method = { RequestMethod.GET})
	@ResponseBody
	public ResponseResult findCustomer(TLxcCustomer tx,HttpServletResponse response) {
		//跨域请求
		CodeToStr co=new CodeToStr();
		co.setScoreHttp(response);
		
		ResponseResult result = new ResponseResult();
		int nPage=1;
		int nRowNum=Integer.MAX_VALUE;
		List<TLxcCustomer> discounts = customer.getCustomerList(null, (nPage - 1) * nRowNum, nRowNum);
		result.setSuccess(discounts);
		result.setMessage("查询客户余额信息成功");
		return result;
	}
	//APP查询单个客户----充值余额接口
		@RequestMapping(value = "/customer/findCustomerByid/{wechatId}",method = { RequestMethod.GET})
		@ResponseBody
		public ResponseResult findCustomerByid(TLxcCustomer tx,HttpServletResponse response,@PathVariable("wechatId") String wechatId) {
			//跨域请求
			System.out.println("查询客户ID为："+wechatId);
			CodeToStr co=new CodeToStr();
			co.setScoreHttp(response);
			ResponseResult result = new ResponseResult();
			List<TLxcCustomer> custList=customer.findCustomerByid(wechatId);
			result.setSuccess(custList);
			result.setMessage("查询客户充值余额成功");
			return result;
		}
		
		/**
		 * 查找管理员openid用于发送新的可接单(己支付)消息
		 */
		@RequestMapping(value = "/customer/findAdminOpenid",method = { RequestMethod.GET})
		@ResponseBody
		public ResponseResult findAdminOpenid(HttpServletResponse response) {
			//跨域请求
			CodeToStr co=new CodeToStr();
			co.setScoreHttp(response);
			
			ResponseResult result = new ResponseResult();
			List<String> adminOpenid=tLxcCustomerMapper.findAdminOpenid();
			result.setSuccess(adminOpenid);
			result.setMessage("查询管理员openid成功");
			return result;
		}
		
		
	
}
