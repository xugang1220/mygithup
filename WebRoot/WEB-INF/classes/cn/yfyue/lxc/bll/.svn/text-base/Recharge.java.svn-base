package cn.yfyue.lxc.bll;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yfyue.lxc.db.inter.TLxcCustomerMapper;
import cn.yfyue.lxc.db.inter.TLxcPackageRechargeMapper;
import cn.yfyue.lxc.db.model.TLxcCustomer;
import cn.yfyue.lxc.db.model.TLxcPackageRecharge;

@Service
public class Recharge {
	@Autowired
	//充值
	private TLxcPackageRechargeMapper tLxcPackageRechargeMapper;
	@Autowired
	private TLxcCustomerMapper customerMapper;
	
	//查询全部充值情况
	public List<TLxcPackageRecharge> getRechargeList(@Param("qkey")String qkey,@Param("startRow") int startRow,@Param("rownum")int rownum){
	    return	tLxcPackageRechargeMapper.getRechargeList(qkey, startRow, rownum);
	}
	//统计充值记录
	public	int getRechargeListCount(@Param("qkey") String qkey){
		return tLxcPackageRechargeMapper.getRechargeListCount(qkey);
	}
	//删除充值记录
	public int delRechargeById(String RechargeId){
		return tLxcPackageRechargeMapper.delRechargeById(RechargeId);
	}
	//添加充值记录
	public int addRecharge(TLxcPackageRecharge recharge, TLxcCustomer customer)
	{
	    return tLxcPackageRechargeMapper.addRecharge(recharge);
	}
	//更新充值记录
	public int updateRecharge(TLxcCustomer customer,TLxcPackageRecharge recharge)
	{
		customerMapper.upCustomermoney(customer.getWechatId(), customer.getRechargeMoney() + recharge.getRechareMoney(), customer.getGivingMoney() + recharge.getGivingMoney());
		return tLxcPackageRechargeMapper.updateRecharge(recharge.getId(), recharge.getOrderStatus());
	}
	
	//根据openId查询自己的充值记录
	public List<TLxcPackageRecharge> findRechargeList(@Param("consumerId")String consumerId,@Param("startRow") int startRow,@Param("rownum")int rownum){
		return tLxcPackageRechargeMapper.findRechargeList(consumerId,startRow,rownum);
	}
	//充值报表
	public List<TLxcPackageRecharge> getRechargePortList(String startDate,String endDate,int startRow,int rownum){
	    return	tLxcPackageRechargeMapper.getRechargePortList(startDate,endDate,startRow, rownum);
	}
	public	int getRechargePortCount(String startDate,String endDate){
		return tLxcPackageRechargeMapper.getRechargePortCount(startDate,endDate);
	}
	
	//统计总充值金额和赠送金额
	public List<TLxcPackageRecharge> getRechargeSumoney(String startDate,String endDate){
		return tLxcPackageRechargeMapper.getRechargeSumoney(startDate, endDate);
	}
	
}
