package cn.yfyue.lxc.db.model;

import java.util.Date;
//套餐充值
public class TLxcPackageRecharge {
    
    private Integer id;//标识

    private Boolean remove;//订单状态（已删除）

    private Date createTime;//创建时间

    private Date updateTime;//更新时间

    private Integer packageDiscountId;//套餐标识

    private Float rechareMoney;//充值金额
    
    private Float givingMoney;//赠送金额

    private Integer consumerId;//客户标识
    
    private String orderStatus;//充值状态:己支付,待支付
    
    private String orderStatusStr;

    
    public String getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus == null ? null : orderStatus.trim();
		// this.orderStatus = orderStatus;
		if("ORDERSTATUS_UNPAID".equals(this.orderStatus)){
			this.orderStatusStr="待支付";
		}else if("ORDERSTATUS_PAID".equals(this.orderStatus)){
			this.orderStatusStr="已支付";
		}else{
			this.orderStatus=this.orderStatusStr;
		}
	}


	public Integer getId() {
        return id;
    }

    
    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getRemove() {
        return remove;
    }

   
    public void setRemove(Boolean remove) {
        this.remove = remove;
    }

    
    public Date getCreateTime() {
        return createTime;
    }

    
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_lxc_package_recharge.update_time
     *
     * @param updateTime the value for t_lxc_package_recharge.update_time
     *
     * @mbggenerated
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_lxc_package_recharge.package_discount_id
     *
     * @return the value of t_lxc_package_recharge.package_discount_id
     *
     * @mbggenerated
     */
    public Integer getPackageDiscountId() {
        return packageDiscountId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_lxc_package_recharge.package_discount_id
     *
     * @param packageDiscountId the value for t_lxc_package_recharge.package_discount_id
     *
     * @mbggenerated
     */
    public void setPackageDiscountId(Integer packageDiscountId) {
        this.packageDiscountId = packageDiscountId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_lxc_package_recharge.giving_money
     *
     * @return the value of t_lxc_package_recharge.giving_money
     *
     * @mbggenerated
     */
    public Float getGivingMoney() {
        return givingMoney;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_lxc_package_recharge.giving_money
     *
     * @param givingMoney the value for t_lxc_package_recharge.giving_money
     *
     * @mbggenerated
     */
    public void setGivingMoney(Float givingMoney) {
        this.givingMoney = givingMoney;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_lxc_package_recharge.rechare_money
     *
     * @return the value of t_lxc_package_recharge.rechare_money
     *
     * @mbggenerated
     */
    public Float getRechareMoney() {
        return rechareMoney;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_lxc_package_recharge.rechare_money
     *
     * @param rechareMoney the value for t_lxc_package_recharge.rechare_money
     *
     * @mbggenerated
     */
    public void setRechareMoney(Float rechareMoney) {
        this.rechareMoney = rechareMoney;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_lxc_package_recharge.consumer_id
     *
     * @return the value of t_lxc_package_recharge.consumer_id
     *
     * @mbggenerated
     */
    public Integer getConsumerId() {
        return consumerId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_lxc_package_recharge.consumer_id
     *
     * @param consumerId the value for t_lxc_package_recharge.consumer_id
     *
     * @mbggenerated
     */
    public void setConsumerId(Integer consumerId) {
        this.consumerId = consumerId;
    }


	public String getOrderStatusStr() {
		return orderStatusStr;
	}


	public void setOrderStatusStr(String orderStatusStr) {
		this.orderStatusStr = orderStatusStr;
	}
    
    
}