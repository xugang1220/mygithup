package cn.yfyue.lxc.db.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.yfyue.lxc.db.model.TLxcPackageRecharge;

public interface TLxcPackageRechargeMapper {
	//查询全部充值情况
	List<TLxcPackageRecharge> getRechargeList(@Param("qkey")String qkey,@Param("startRow") int startRow,@Param("rownum")int rownum);
	//统计客户充值
	int getRechargeListCount(@Param("qkey") String qkey);
	//删除充值记录
	int delRechargeById(String RechargeId);	
	//添加充值记录
	int addRecharge(TLxcPackageRecharge tLxcPackageRecharge);
	//根据openId查询自己的充值记录
	List<TLxcPackageRecharge> findRechargeList(@Param("consumerId")String consumerId,@Param("startRow")int startRow,@Param("rownum")int rownum);
	
	int updateRecharge(@Param("id") Integer id,@Param("orderStatus") String orderStatus);
	
	TLxcPackageRecharge findByPrimaryKey(@Param("id") String id);

	//充值报表
	List<TLxcPackageRecharge> getRechargePortList(@Param("startDate")String startDate,@Param("endDate")String endDate, @Param("startRow") int startRow,@Param("rownum")int rownum);

	//统计客户充值
	int getRechargePortCount(@Param("startDate")String startDate,@Param("endDate")String endDate);
	
	//统计总充值金额和赠送金额
	List<TLxcPackageRecharge> getRechargeSumoney(@Param("startDate")String startDate,@Param("endDate")String endDate);
	
}