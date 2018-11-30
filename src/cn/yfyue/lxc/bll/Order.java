package cn.yfyue.lxc.bll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yfyue.lxc.db.inter.TLxcOrderMapper;
import cn.yfyue.lxc.db.model.TLxcOrder;

@Service
public class Order {
	@Autowired
	private TLxcOrderMapper lxcOrderMapper;

	// 查询全部订单
	public List<TLxcOrder> getOrderList(String qkey,int startRow,int rownum) {
		return lxcOrderMapper.getOrderList(qkey, startRow, rownum);
	}

	// 统计多少条订单
	public int getOrderListCount(String qkey) {
		return lxcOrderMapper.getOrderListCount(qkey);
	}

	// 添加订单
	public int addOrder(TLxcOrder lxcOrder) {
		return lxcOrderMapper.addOrder(lxcOrder);
	}

	// 根据订单号修改处理类型
	public int updateOrder(Integer lxcOrder, String orderStatus,Integer operateFee,String openId) {
		return lxcOrderMapper.updateOrder(lxcOrder, orderStatus,operateFee,openId);
	}
	
	// 根据客户的标识查询订单
	public List<TLxcOrder> findOrderByid(String consumerId,int startRow,int rownum) {
		return lxcOrderMapper.findOrderByid(consumerId,startRow, rownum);
	}

	// 删除订单
	public int delOrderById(String initOrderId) {
		return lxcOrderMapper.delOrderById(initOrderId);
	}

	// 配置数据根据id取订单记录
	public List<TLxcOrder> getMyOrderByid(Integer id) {
		return lxcOrderMapper.getMyOrderByid(id);
	}

	// 更新配置数据
	public int upLayoutDate(TLxcOrder lxcOrder) {
		return lxcOrderMapper.upLayoutDate(lxcOrder);
	}

	// 配置洗车类型下拉
	public int getLayoutTypeCount(String qkey) {
		return lxcOrderMapper.getLayoutTypeCount(qkey);
	}
	
	//查询已完成的订单
	public	List<TLxcOrder> findOrderunfinishedList(String orderStatus, int startRow, int rownum,String customerId){
		return lxcOrderMapper.findOrderunfinishedList(orderStatus,startRow,rownum,customerId);
	}
	//查询未完成的订单
	public	List<TLxcOrder> findOrdercompletedList(String orderStatus,int startRow, int rownum,String customerId){
		return lxcOrderMapper.findOrdercompletedList(orderStatus,startRow,rownum, customerId);
	}
	//添加订单评论
	public int addOrderServiceNote (TLxcOrder lxcOrder) {
		return lxcOrderMapper.addOrderServiceNote(lxcOrder);
	}
	//根据openId获取订单的余额
	public int getOrdermoney(Integer openId) {
		return lxcOrderMapper.getOrdermoney(openId);
	}
	//统计报表全部订单
	public List<TLxcOrder> getOrderPortList(String startDate,String endDate,String typeCode,int startRow,int rownum) {
		return lxcOrderMapper.getOrderPortList(startDate,endDate,typeCode,startRow, rownum);
	}
	// 统计订单报表多少条
	public int getOrderPortCount(String startDate,String endDate,String typeCode,int startRow,int rownum) {
		return lxcOrderMapper.getOrderPortCount(startDate,endDate,typeCode,startRow, rownum);
	}
	
	//统计订单金额和退回金额
	public List<TLxcOrder> getOrderSumMoney(String startDate,String endDate,String typeCode){
		return lxcOrderMapper.getOrderSumMoney(startDate, endDate, typeCode);
	}		
}
