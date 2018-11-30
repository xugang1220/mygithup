package cn.yfyue.lxc.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.request.WebRequest;

import com.google.common.base.Strings;
import com.google.common.math.DoubleMath;

import cn.yfyue.comm.ReturnJson;
import cn.yfyue.comm.SetSys;
import cn.yfyue.lxc.ajax.CodeToStr;
import cn.yfyue.lxc.bll.ClassifyDataFindName;
import cn.yfyue.lxc.bll.Customer;
import cn.yfyue.lxc.bll.Order;
import cn.yfyue.lxc.bll.Recharge;
import cn.yfyue.lxc.db.inter.TLxcCustomerMapper;
import cn.yfyue.lxc.db.inter.TLxcOrderMapper;
import cn.yfyue.lxc.db.inter.TLxcPackageRechargeMapper;
import cn.yfyue.lxc.db.model.TLxcCustomer;
import cn.yfyue.lxc.db.model.TLxcOrder;
import cn.yfyue.lxc.db.model.TLxcPackageRecharge;

@Controller
public class OrderController {
	@Resource TLxcCustomerMapper tLxcCustomerMapper;
	@Resource TLxcPackageRechargeMapper tLxcPackageRechargeMapper;
	@Resource TLxcOrderMapper lxcOrderMapper;
	@Resource ClassifyDataFindName classifyDataFindName;
	// 订单接口
	private Order order = ContextLoader.getCurrentWebApplicationContext().getBean(Order.class);
	//客户
	private Customer cust = ContextLoader.getCurrentWebApplicationContext().getBean(Customer.class);
	//充值
	private Recharge reharge = ContextLoader.getCurrentWebApplicationContext().getBean(Recharge.class);
	
	//只需要加上下面这段即可，注意不能忘记注解
		@InitBinder
		public void initBinder(WebDataBinder binder, WebRequest request) {
			//转换日期
			DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");
			binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// CustomDateEditor为自定义日期编辑器
		}

	// APP订单接单接口
	@Transactional
	@RequestMapping(value = "/order/addOrder", method = { RequestMethod.POST })
	@ResponseBody
	public ReturnJson addOrder(TLxcOrder txorder,HttpServletResponse response,@RequestParam(value="openId") String openId,@RequestParam(value = "orderNo", required = false) String orderNo) {//传递请求参数openId已获取客户id
		//跨域请求
		CodeToStr co=new CodeToStr();
		co.setScoreHttp(response);
		ReturnJson result = new ReturnJson();
		if(!Strings.isNullOrEmpty(orderNo)){
			txorder=order.getMyOrderByid(Integer.parseInt(orderNo)).get(0);
		}
		
		TLxcCustomer customer= cust.findCustomerByopenId(openId).get(0);
		//设置订单的consumerId标识
		txorder.setConsumerId(customer.getId());
		
		//获取客户的余额
		Float ms = (float) cust.getCustomermoney(openId);
		//订单金额
		float os=txorder.getOrderMoney();
		//客户余额减去订单的金额
		//float money = ms-os - 10;
		float money = ms-os;
		System.out.println("查询的客户账户id为："+openId);
		if(txorder.getCarNumber()==null || txorder.getCarNumber()==""){
			result.setState(-1);
			result.setMessage("车牌号不能为空");
		}else if(txorder.getPhone() == null || txorder.getPhone().length() < 11){
			result.setState(-1);
			result.setMessage("手机号码不能为空");
		}else if(txorder.getCommunityName()==null || txorder.getCommunityName()==""){
			result.setState(-1);
			result.setMessage("小区名称不能为空");
		}else if(txorder.getCarLocation()==null || txorder.getCarLocation()==""){
			result.setState(-1);
			result.setMessage("请输入车辆位置");
		}else if(txorder.getWashType()==null || txorder.getWashType()==""){
			result.setState(-1);
			result.setMessage("请选择洗车类型");
		}else if(txorder.getUseCarTime()==null){
			result.setState(-1);
			result.setMessage("请选择用车时间");
		}
//		else if(txorder.getPayType()==null || txorder.getPayType()==""){
//			result.setState(-1);
//			result.setMessage("请选择支付方式：现付或余额");
//		}
		//如果客户的个人余额小于订单余额就使用现金
		else if(ms<os){
			result.setState(0);
			result.setMessage("余额不足请使用现金支付或者微信支付!");
			//加一个待支付状态
			txorder.setOrderStatus("ORDERSTATUS_UNPAID");
			txorder.setPayType("PAYTYPE_CASH");
			if(Strings.isNullOrEmpty(orderNo)){
				order.addOrder(txorder);
			}else{
				lxcOrderMapper.updateOrderStatusAndPayType(orderNo, txorder.getOrderStatus(), txorder.getPayType());
			}
			
			result.setObject("获取订单的主键id："+txorder.getId());
			result.setObject(txorder);
		}else if(ms>=os){
		//如果客户的个人余额不小于订单余额就使用账户余额
			result.setState(0);
			result.setMessage("调用微信支付接口支付!");
			result.setObject("获取订单的主键id："+txorder.getId());
			result.setObject(txorder);
		//修改订单的金额
			if(DoubleMath.fuzzyCompare(customer.getGivingMoney(), os, 0.001)>0){
				cust.upCustomermoney(openId, customer.getRechargeMoney(), customer.getGivingMoney()-os);
			}else{
				cust.upCustomermoney(openId,customer.getRechargeMoney()-(os-customer.getGivingMoney()),0f);	
			}
			
			if(result.getState()!=-1){
				//设置订单的consumerId标识
				//txorder.setConsumerId(custid);
				//下单成功设置订单状态(已支付订单状态)
				txorder.setOrderStatus("ORDERSTATUS_PAID");
				txorder.setPayType("PAYTYPE_BALANCE");
				if(Strings.isNullOrEmpty(orderNo)){
					order.addOrder(txorder);
				}else{
					lxcOrderMapper.updateOrderStatusAndPayType(orderNo, txorder.getOrderStatus(), txorder.getPayType());
				}
				result.setMessage("下单成功!");								
				result.setObject(txorder);
			}else{
				result.setObject(-1);
				result.setMessage("下单失败。。。。");
			}	
		}
		return result;
	}
	
	//根据微信openId判断是否是管理员来查询订单状态
	@RequestMapping(value = "/order/findOrderstate/{orderStatus}/{nPage}/{nRowNum}", method = { RequestMethod.GET })
	@ResponseBody
	public ReturnJson findOrderstate(HttpServletResponse response,@RequestParam(value="openId") String openId,@PathVariable("orderStatus") String orderStatus,@PathVariable("nPage")int nPage, @PathVariable("nRowNum")int nRowNum){
		//跨域请求
		CodeToStr co=new CodeToStr();
		co.setScoreHttp(response);
		ReturnJson result=new ReturnJson();
		//查询openId是否是管理员
		String admin = cust.findCustomerAdminByid(openId);
		int customerId=cust.findCustomerByid(openId).get(0).getId();
		nRowNum = nRowNum > 0 ? nRowNum:10;
		int startRow =  (nPage = nPage > 0 ? nPage:0) * nRowNum;
		//如果是admin就查询全部
		if("1".equals(admin)){
			//查询状态为0完成的订单
			if("0".equals(orderStatus)){
				List<TLxcOrder> tx= order.findOrdercompletedList(orderStatus, startRow, nRowNum,null);
				result.setObject(tx);
				result.setState(0);
				result.setMessage("查询未完成的订单");
			//查询状态为1已完成的订单
			}else if("1".equals(orderStatus)){
				List<TLxcOrder> tw= order.findOrderunfinishedList(orderStatus, startRow, nRowNum,null);
				result.setObject(tw);
				result.setState(0);
				result.setMessage("查询已完成的订单");
			}else{
				result.setMessage("数据异常");
				return result;
			}
		//如果不是就只查询用户订单
		}else if("0".equals(admin) || Strings.isNullOrEmpty(admin)){ 
			//只查询用户未完成的订单
			if("0".equals(orderStatus)){
				List<TLxcOrder> tx= order.findOrdercompletedList(orderStatus,startRow, nRowNum,customerId+"");
				result.setObject(tx);
				result.setState(0);
				result.setMessage("查询未完成的订单");
			//只查询用户未完成的订单	
			}else if("1".equals(orderStatus)){
				List<TLxcOrder> tw= order.findOrderunfinishedList(orderStatus,startRow, nRowNum,customerId+"");
				result.setObject(tw);
				result.setState(0);
				result.setMessage("查询已完成的订单");
			}else{
				result.setMessage("数据异常");
				return result;
			}
		}else{
			result.setMessage("openId非法");
		}
		return result;
	}
		
	//订单状态处理{orderId 订单号，state 处理类型（取消=0，待支付=1，已支付=2，已接单 = 3，已完成=4}
//	@RequestMapping(value = "/order/updateOrder/{orderId}/{state}", method = { RequestMethod.POST })
//	@ResponseBody
//	public ReturnJson handlerDiscount(HttpServletResponse response,@PathVariable("orderId") Integer orderId, @PathVariable("state") int state){
//		//跨域请求
//		CodeToStr co=new CodeToStr();
//		co.setScoreHttp(response);
//		
//		ReturnJson result=new ReturnJson();
//		//如果订单状态小于0和大于4都是异常，不能直接等于2已支付状态，
//		if(state < 0 || state > 4 ){
//			result.setState(-1);
//			result.setMessage("订单数据异常");
//			return result;
//		}
//		if(order.updateOrder(orderId, String.valueOf(state)) ==1){
//			result.setState(0);
//			result.setMessage("成功");
//		}else{
//			result.setState(-1);
//			result.setMessage("失败");
//		}
//		return result;
//
//	}
	
	//订单状态处理{orderId 订单号，state 修改订单状态（取消=ORDERSTATUS_CANCEL，待支付=ORDERSTATUS_UNPAID，
	//已支付=ORDERSTATUS_PAID，已接单 =ORDERSTATUS_HAVEORDER，已完成=ORDERSTATUS_SUCCESS}
	@RequestMapping(value = "/order/updateOrder/{id}/{orderStatus}", method = { RequestMethod.POST })
	@ResponseBody
	public ReturnJson updateOrder(HttpServletResponse response,@PathVariable("id") String id, @PathVariable("orderStatus") String orderStatus,@RequestParam(value = "operateFee", required = false) Integer operateFee,@RequestParam(value="openId", required = false) String openId){
		//跨域请求
		CodeToStr co=new CodeToStr();
		co.setScoreHttp(response);
		
		ReturnJson result=new ReturnJson();
		//微信套餐充值通知
		if(id.startsWith("CZ")){
			id=id.replaceAll("CZ", "");
			TLxcPackageRecharge recharge=tLxcPackageRechargeMapper.findByPrimaryKey(Integer.parseInt(id)+"");
			boolean repeatNotice="ORDERSTATUS_PAID".equals(recharge.getOrderStatus());
			if(repeatNotice){
				System.out.println("repeat notice recharge:"+id);
				result.setState(0);
				result.setMessage("修改充值状态成功");
				return result;
			}else{
				System.out.println("first notice recharge:"+id);
			}
			
			recharge.setOrderStatus(orderStatus);
			TLxcCustomer customer=tLxcCustomerMapper.findByPrimaryKey(recharge.getConsumerId().toString());
			
			if(reharge.updateRecharge(customer, recharge) ==1){
				result.setState(0);
				result.setMessage("修改充值状态成功");
			}else{
				result.setState(-1);
				result.setMessage("修改充值状态失败");
			}
			return result;
		}
		
		//微信订单支付或退款通知
		if(id.startsWith("DD")){
			id=id.replaceAll("DD", "");
		}
		
		if(order.updateOrder(Integer.parseInt(id), String.valueOf(orderStatus),operateFee,openId) ==1){
			result.setState(0);
			result.setMessage("修改订单状态成功");
		}else{
			result.setState(-1);
			result.setMessage("修改订单状态失败");
		}
		return result;

	}
	//APP根据输入的订单id查询订单结果接口
	@RequestMapping(value = "/order/getMyOrderByid/{id}", method = { RequestMethod.GET })
	@ResponseBody
	public ReturnJson getMyOrderByid(HttpServletResponse response,@PathVariable("id") Integer id){
		//跨域请求
		CodeToStr co=new CodeToStr();
		co.setScoreHttp(response);
		ReturnJson result=new ReturnJson();
		
		List<TLxcOrder> os= order.getMyOrderByid(id);
		for(TLxcOrder order:os){
			order.setCommunityName(classifyDataFindName.findName("XIAOQUTYPE", order.getCommunityName()));
		    order.setWashType(classifyDataFindName.findName("XICHETYPE", order.getWashType()));
		}
		result.setObject(os);
		result.setState(0);
		result.setMessage("根据订单id查询订单");
		return result;
	}
	//APP添加订单评论接口
	@RequestMapping(value = "/order/addOrderServiceNote", method = { RequestMethod.POST })
	@ResponseBody
	public ReturnJson addOrderServiceNote(TLxcOrder tx,HttpServletResponse response) {
		//跨域请求
		CodeToStr co=new CodeToStr();
		co.setScoreHttp(response);
		ReturnJson result = new ReturnJson();
		if(tx.getServiceNote()==null || tx.getServiceNote()==""){
			result.setState(-1);
			result.setMessage("请输入评论在操作！");
		}
		if(result.getState() != -1){
			order.addOrderServiceNote(tx);
			result.setMessage("添加评论成功!");
		}
		return result;
	}
	
	    //APP订单余额退款接口
		@RequestMapping(value = "/order/refundForBalance", method = { RequestMethod.POST })
		@ResponseBody
		public ReturnJson refundForBalance(@RequestParam("openId") String openId,@RequestParam("outTradeNo") String outTradeNo,@RequestParam("refundFee") Integer refundFee,HttpServletResponse response) {
			//跨域请求
			CodeToStr co=new CodeToStr();
			co.setScoreHttp(response);
			ReturnJson result = new ReturnJson();
			//余额支付的更新帐户的金额及订单状态及退款额
			cust.updateRefundForBalance(openId, outTradeNo, refundFee);
			result.setMessage("退款成功!");
			return result;
		}
		
		/**
		 * 获取最近一次订单用于洗车下单初始信息
		 */
		@RequestMapping(value = "/order/last", method = { RequestMethod.GET })
		@ResponseBody
		public ReturnJson orderForLast(@RequestParam("openId") String openId ,HttpServletResponse response) {
			//跨域请求
			CodeToStr co=new CodeToStr();
			co.setScoreHttp(response);
			ReturnJson result = new ReturnJson();
			result.setObject(lxcOrderMapper.findOrderForLast(openId));
			result.setMessage("成功!");
			return result;
		}
	
	
	
}
