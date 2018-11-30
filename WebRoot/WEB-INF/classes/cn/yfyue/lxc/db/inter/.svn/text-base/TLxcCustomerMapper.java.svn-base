package cn.yfyue.lxc.db.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.yfyue.lxc.db.model.CustomerStatement;
import cn.yfyue.lxc.db.model.TLxcCustomer;

public interface TLxcCustomerMapper {
	//查询全部客户
	List<TLxcCustomer> getCustomerList(@Param("qkey")String qkey,@Param("startRow") int startRow,@Param("rownum")int rownum);
	//查询全部客户
	List<CustomerStatement> getCustomerStatementList(@Param("qkey")String qkey,@Param("startRow") int startRow,@Param("rownum")int rownum,@Param("beginTime") String beginTime,@Param("endTime") String endTime, @Param("type") String type);
	CustomerStatement getCustomerStatementListSum(@Param("qkey")String qkey,@Param("startRow") int startRow,@Param("rownum")int rownum,@Param("beginTime") String beginTime,@Param("endTime") String endTime, @Param("type") String type);
	
	//统计客户
	int getCustomerListCount(@Param("qkey") String qkey);
	
	//统计客户
	int getCustomerStatementListCount(@Param("qkey") String qkey, @Param("beginTime") String beginTime,@Param("endTime") String endTime,@Param("type") String type);
		
	//根据id删除客户
	int delCustomerById(@Param("id")String id);
	//设置管理员
	int upCustomerById(@Param("id")int id,@Param("admin") boolean admin);
	//新增客户
	int addCustomer(TLxcCustomer tLxcCustomer);
	//根据前台的id查询客户的充值情况(返回单个客户)
	List<TLxcCustomer> findCustomerByid(@Param("wechatId")String wechatId);
	//查询客户是否是admin
	String findCustomerAdminByid(@Param("openId")String openId);
	//根据客户id统计客户的余额
	int getCustomermoney(@Param("openId")String openId);
	
	//根据下单成功的openId来修改客户的余额
	int upCustomermoney(@Param("openId")String openId,@Param("rechargeMoney") Float rechargeMoney,@Param("givingMoney") Float givingMoney);
	
	//根据openId查询客户的客户
	List<TLxcCustomer> findCustomerByopenId(@Param("openId")String openId);
	
	int updateRefundForBalance(@Param("openId")String openId,@Param("refundFee") Integer refundFee);
	
	TLxcCustomer findByPrimaryKey(@Param("id") String id);
	//查询客户的WechatId
	String findCustomerWechatId(@Param("openId")String openId);

	List<String> findAdminOpenid();
	//统计客户报表
	List<TLxcCustomer> getCustomerPort(@Param("startDate")String startDate,@Param("endDate")String endDate, @Param("startRow") int startRow,@Param("rownum")int rownum);
		
	// 统计报表多少条客户
	int getCustomerPortCount(@Param("startDate")String startDate,@Param("endDate")String endDate); 
		
	//显示客户总充值和赠送金额
	List<TLxcCustomer> getCustomerSumMoney(@Param("startDate")String startDate,@Param("endDate")String endDate);
}