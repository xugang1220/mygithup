package cn.yfyue.lxc.db.model;

import java.util.Date;

//套餐优惠
public class TLxcPackageDiscount {

	private Integer id;//标识

	private String dname;//名称

	private Integer remove;//已删除
	
	private String removestr;//显示套餐状态(另加)

	private Date createTime;//创建时间

	private Date updateTime;//更新时间

	private Float rechargeMoney;//充值金额

	private Float givingMoney;//赠送金额

	private Date packgeDiscountStart;//优惠开始时间

	private Date packgeDiscountEnd;//优惠结束时间

	private Date packageUseStart;//使用有效期开始时间

	private Date packageUseEnd;//使用有效期结束时间
	
	private String note;//服务说明

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname == null ? null : dname.trim();
	}

	public Integer getRemove() {
		return remove;
	}

	public void setRemove(Integer remove) {
		this.remove = remove == null ? null :remove.intValue();
		if(this.remove==1){
			this.removestr="禁用";
		}else if(this.remove==0){
			this.removestr="启用";
		}else{
			this.removestr=this.remove.toString();
		}
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_lxc_package_discount.remove
	 *
	 * @return the value of t_lxc_package_discount.remove
	 *
	 * @mbggenerated
	 */

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_lxc_package_discount.create_time
	 *
	 * @return the value of t_lxc_package_discount.create_time
	 *
	 * @mbggenerated
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_lxc_package_discount.create_time
	 *
	 * @param createTime
	 *            the value for t_lxc_package_discount.create_time
	 *
	 * @mbggenerated
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_lxc_package_discount.update_time
	 *
	 * @return the value of t_lxc_package_discount.update_time
	 *
	 * @mbggenerated
	 */
	public Date getUpdateTime() {
		return updateTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_lxc_package_discount.update_time
	 *
	 * @param updateTime
	 *            the value for t_lxc_package_discount.update_time
	 *
	 * @mbggenerated
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_lxc_package_discount.recharge_money
	 *
	 * @return the value of t_lxc_package_discount.recharge_money
	 *
	 * @mbggenerated
	 */
	public Float getRechargeMoney() {
		return rechargeMoney;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_lxc_package_discount.recharge_money
	 *
	 * @param rechargeMoney
	 *            the value for t_lxc_package_discount.recharge_money
	 *
	 * @mbggenerated
	 */
	public void setRechargeMoney(Float rechargeMoney) {
		this.rechargeMoney = rechargeMoney;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_lxc_package_discount.giving_money
	 *
	 * @return the value of t_lxc_package_discount.giving_money
	 *
	 * @mbggenerated
	 */
	public Float getGivingMoney() {
		return givingMoney;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_lxc_package_discount.giving_money
	 *
	 * @param givingMoney
	 *            the value for t_lxc_package_discount.giving_money
	 *
	 * @mbggenerated
	 */
	public void setGivingMoney(Float givingMoney) {
		this.givingMoney = givingMoney;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_lxc_package_discount.packge_discount_start
	 *
	 * @return the value of t_lxc_package_discount.packge_discount_start
	 *
	 * @mbggenerated
	 */
	public Date getPackgeDiscountStart() {
		return packgeDiscountStart;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_lxc_package_discount.packge_discount_start
	 *
	 * @param packgeDiscountStart
	 *            the value for t_lxc_package_discount.packge_discount_start
	 *
	 * @mbggenerated
	 */
	public void setPackgeDiscountStart(Date packgeDiscountStart) {
		this.packgeDiscountStart = packgeDiscountStart;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_lxc_package_discount.packge_discount_end
	 *
	 * @return the value of t_lxc_package_discount.packge_discount_end
	 *
	 * @mbggenerated
	 */
	public Date getPackgeDiscountEnd() {
		return packgeDiscountEnd;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_lxc_package_discount.packge_discount_end
	 *
	 * @param packgeDiscountEnd
	 *            the value for t_lxc_package_discount.packge_discount_end
	 *
	 * @mbggenerated
	 */
	public void setPackgeDiscountEnd(Date packgeDiscountEnd) {
		this.packgeDiscountEnd = packgeDiscountEnd;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_lxc_package_discount.package_use_start
	 *
	 * @return the value of t_lxc_package_discount.package_use_start
	 *
	 * @mbggenerated
	 */
	public Date getPackageUseStart() {
		return packageUseStart;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_lxc_package_discount.package_use_start
	 *
	 * @param packageUseStart
	 *            the value for t_lxc_package_discount.package_use_start
	 *
	 * @mbggenerated
	 */
	public void setPackageUseStart(Date packageUseStart) {
		this.packageUseStart = packageUseStart;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_lxc_package_discount.package_use_end
	 *
	 * @return the value of t_lxc_package_discount.package_use_end
	 *
	 * @mbggenerated
	 */
	public Date getPackageUseEnd() {
		return packageUseEnd;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_lxc_package_discount.package_use_end
	 *
	 * @param packageUseEnd
	 *            the value for t_lxc_package_discount.package_use_end
	 *
	 * @mbggenerated
	 */
	public void setPackageUseEnd(Date packageUseEnd) {
		this.packageUseEnd = packageUseEnd;
	}
}