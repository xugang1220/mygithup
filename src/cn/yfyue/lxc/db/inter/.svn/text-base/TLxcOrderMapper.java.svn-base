package cn.yfyue.lxc.db.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.yfyue.lxc.db.model.TLxcOrder;

public interface TLxcOrderMapper {
	// 查询全部订单
	List<TLxcOrder> getOrderList(@Param("qkey") String qkey, @Param("startRow") int startRow,
			@Param("rownum") int rownum);

	// 统计多少条订单
	int getOrderListCount(@Param("qkey") String qkey);

	// 添加订单
	int addOrder(TLxcOrder lxcOrder);

	// 删除订单
	int delOrderById(String initOrderId);

	// 根据订单号修改处理类型
	int updateOrder(@Param("id") Integer id, @Param("orderStatus") String orderStatus, @Param("operateFee") Integer operateFee,@Param("openId") String openId);

	// 根据客户的标识查询订单
	List<TLxcOrder> findOrderByid(@Param("consumerId") String consumerId,@Param("startRow") int startRow,@Param("rownum") int rownum);

	// 根据订单id取订单
	List<TLxcOrder> getMyOrderByid(@Param("id") Integer id);

	// 更新配置数据
	int upLayoutDate(TLxcOrder lxcOrder);

	// 配置洗车类型下拉
	int getLayoutTypeCount(@Param("qkey") String qkey);
	
	//查询已完成的订单
	List<TLxcOrder> findOrderunfinishedList(@Param("orderStatus") String orderStatus,@Param("startRow") int startRow,@Param("rownum") int rownum,@Param("customerId") String customerId);
	
	//查询未完成的订单
	List<TLxcOrder> findOrdercompletedList(@Param("orderStatus") String orderStatus,@Param("startRow") int startRow,@Param("rownum") int rownum,@Param("customerId") String customerId);
	
	//添加订单评论
	int addOrderServiceNote(TLxcOrder lxcOrder);
	
	//根据openId获取订单的余额
	int getOrdermoney(@Param("openId")Integer openId);
	
	int updateRefundForBalance(@Param("outTradeNo")String outTradeNo,@Param("refundFee") Integer refundFee);

	// 我的订单界面重新发起支付时根据订单号修改状态及支付类型
	public int updateOrderStatusAndPayType(@Param("outTradeNo") String outTradeNo, @Param("orderStatus") String orderStatus,@Param("payType") String payType) ;
	//最近一次订单
	TLxcOrder findOrderForLast(@Param("openId") String openId);
	
	//统计报表全部订单
	 List<TLxcOrder> getOrderPortList(@Param("startDate")String startDate,@Param("endDate")String endDate,@Param("typeCode")String typeCode,@Param("startRow")int startRow,@Param("rownum") int rownum);
		
	 // 统计订单报表多少条
	 int getOrderPortCount(@Param("startDate")String startDate,@Param("endDate")String endDate,@Param("typeCode")String typeCode,@Param("startRow")int startRow,@Param("rownum") int rownum);
			
	 //统计订单金额和退回金额
	 List<TLxcOrder> getOrderSumMoney(@Param("startDate")String startDate,@Param("endDate")String endDate,@Param("typeCode")String typeCode);
	 
}
