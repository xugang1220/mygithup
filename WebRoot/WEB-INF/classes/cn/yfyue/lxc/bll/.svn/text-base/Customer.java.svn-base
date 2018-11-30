package cn.yfyue.lxc.bll;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yfyue.lxc.db.inter.TLxcCustomerMapper;
import cn.yfyue.lxc.db.inter.TLxcOrderMapper;
import cn.yfyue.lxc.db.model.CustomerStatement;
import cn.yfyue.lxc.db.model.TLxcCustomer;

@Service
public class Customer {
	@Autowired
	private TLxcCustomerMapper customerMapper;
	@Resource
	private TLxcOrderMapper tLxcOrderMapper;

	// 查询全部客户
	public List<TLxcCustomer> getCustomerList(String qkey, int startRow, int rownum) {
		return customerMapper.getCustomerList(qkey, startRow, rownum);
	}
	
	// 查询全部客户资金流水
	public List<CustomerStatement> getCustomerStatementList(String qkey, int startRow, int rownum,String beginTime,String endTime,String type) {
			return customerMapper.getCustomerStatementList(qkey, startRow, rownum,beginTime,endTime,type);
	}
	public CustomerStatement getCustomerStatementListSum(String qkey, int startRow, int rownum,String beginTime,String endTime,String type) {
		return customerMapper.getCustomerStatementListSum(qkey, startRow, rownum,beginTime,endTime,type);
    }
	

	// 查询多少条客户
	public int getCustomerListCount(String qkey) {
		return customerMapper.getCustomerListCount(qkey);
	}
	
	public int getCustomerStatementListCount(String qkey,String beginTime,String endTime, String type) {
		return customerMapper.getCustomerStatementListCount(qkey,beginTime,endTime,type);
	}
	
	
	//根据id删除客户
	public int delCustomerById(String id){
		return customerMapper.delCustomerById(id);
	}
	//设置取消管理员
	public int upCustomerById(int id,boolean admin){
		return customerMapper.upCustomerById(id,admin);
	}
	//新增客户
	public int addCustomer(TLxcCustomer tLxcCustomer){
		return customerMapper.addCustomer(tLxcCustomer);
	}
	//根据前台的id查询客户的充值情况(返回单个客户)
	public List<TLxcCustomer> findCustomerByid(String wechatId){
		return customerMapper.findCustomerByid(wechatId);
	}
	
	//根据openId查询客户的客户
	public List<TLxcCustomer> findCustomerByopenId(String openId){
		return customerMapper.findCustomerByopenId(openId);
	}
	//查询客户是否是admin
	public String findCustomerAdminByid(String openId){
		return customerMapper.findCustomerAdminByid(openId);
	}
	//根据openId统计客户的余额
	public int getCustomermoney(String openId) {
		return customerMapper.getCustomermoney(openId);
	}
	//根据下单下单成功的openId来修改客户的余额
	public int upCustomermoney(String openId,Float rechargeMoney,Float givingMoney){
		
		return customerMapper.upCustomermoney(openId,rechargeMoney,givingMoney);
	}
	
	public void updateRefundForBalance(String openId,String outTradeNo,Integer refundFee){
		customerMapper.updateRefundForBalance(openId, refundFee);
		tLxcOrderMapper.updateRefundForBalance(outTradeNo, refundFee);
	}
	
	//查询客户的WechatId
	public String findCustomerWechatId(String openId){
		return customerMapper.findCustomerWechatId(openId);
	}

	//统计客户报表
	public List<TLxcCustomer> getCustomerPort(@Param("startDate")String startDate,@Param("endDate")String endDate, @Param("startRow") int startRow,@Param("rownum")int rownum) {
		return customerMapper.getCustomerPort(startDate,endDate,startRow, rownum);
	}
	
	// 统计报表多少条客户
	public int getCustomerPortCount(String startDate,String endDate) {
		
		return customerMapper.getCustomerPortCount(startDate,endDate);
	}
	//显示客户总充值和赠送金额
	public List<TLxcCustomer> getCustomerSumMoney(String startDate,String endDate){
		return customerMapper.getCustomerSumMoney(startDate,endDate);
	}
}
