package cn.yfyue.lxc.db.model;

import java.text.SimpleDateFormat;
import java.util.Date;

//订单
public class TLxcOrder {

	private Integer id;// 标识

	private Integer consumerId;// 客户标识

	private String oname;// 名称

	private Boolean remove;// 已删除

	private Date createTime;// 创建时间
	
	private String createTimestr;//显示日期yyyy-MM-dd HH:mm

	private Date updateTime;// 更新时间

	private String communityName;// 小区名称
	
//	private String communitynameStr;//显示小区名称(另加)

	private String carLocation;// 车辆位置

	private String carNumber;// 车牌号

	private String washType;// 洗车类型
	
//	private String washTypestr;//显示洗车类型编码(另加)

	private String phone;// 电话

	private Date useCarTime;// 用车时间

	private String roomNumber;// 车主房号

	private String note;// 留言备注

	private Date acceptTime;// 接单开始时间

	private Date finishTime;// 接单结束时间

	private String acceptNote;// 接单备注

	private String orderStatus;// 订单状态

//	private String orderStatusStr;// 显示订单状态（另加）

	private Float orderMoney;// 订单金额

	private Float backMoney;// 退回金额

	private Integer serviceRate;// 服务评分

	private String serviceNote;// 服务评语

	private String acceptUserName;// 接单员标识

	private String washUserName;// 接单员标识

	private String payType;// 支付方式:现付或余额pay_type
	
//	private String paytypestr;//显示支付方式(另加)
	
	private String consumerOpenid;// 客户openid标识

	
	public Date getCreateTime(){
		
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		
		this.createTime = createTime;
		setCreateTimeToString(createTime);
		
	}
	
	//日期转字符串 yyyy-MM-dd HH:mm
	public void setCreateTimeToString(Date date) {
		if(date == null){
			this.createTimestr ="";
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			this.createTimestr = sdf.format(date);
		}
		
	}
	
	public String getPayType() {
		return payType;
	}
	
	public void setPayType(String payType) {
		this.payType = payType == null ? null : payType.trim();
//		if("PAYTYPE_CASH".equals(this.payType)){
//			this.paytypestr="现金支付";
//		}else if("PAYTYPE_BALANCE".equals(this.payType)){
//			this.paytypestr="余额支付";
//		}else{
//			this.paytypestr =this.payType;
//		}
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getConsumerId() {
		return consumerId;
	}

	public void setConsumerId(Integer consumerId) {
		this.consumerId = consumerId;
	}

	public String getName() {
		return oname;
	}

	public void setName(String name) {
		this.oname = oname == null ? null : oname.trim();
	}

	public Boolean getRemove() {
		return remove;
	}

	public void setRemove(Boolean remove) {
		this.remove = remove;
	}

	
		
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getCommunityName() {
		return communityName;
	}

	public void setCommunityName(String communityName) {
		this.communityName = communityName == null ? null : communityName.trim();
//		if("XIAOQUTYPE_YONGAN".equals(this.communityName)){
//			this.communitynameStr="永安小区";
//		}else if("XIAOQUTYPE_LUGU".equals(this.communityName)){
//			this.communitynameStr="麓谷小镇";
//		}else if("XIAOQUTYPE_XCKJY".equals(this.communityName)){
//			this.communitynameStr="芯城科技园";			
//		}else{
//			this.communityName=this.communitynameStr;
//		}
	}

	public String getCarLocation() {
		return carLocation;
	}

	public void setCarLocation(String carLocation) {
		this.carLocation = carLocation == null ? null : carLocation.trim();
	}

	public String getCarNumber() {
		return carNumber;
	}

	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber == null ? null : carNumber.trim();
	}

	public String getWashType() {
		return washType;
	}

	public void setWashType(String washType) {
		this.washType = washType == null ? null : washType.trim();
//		if("XICHETYPE_REFINED".equals(this.washType)){
//			this.washTypestr="精洗-50元";
//		}else if("XICHETYPE_STANDARD".equals(this.washType)){
//			this.washTypestr="标准洗-40元";
//		}else if("XICHETYPE_OUTER".equals(this.washType)){
//			this.washTypestr="只洗外面-20元";
//		}else if("XICHETYPE_INNER".equals(this.washType)){
//			this.washTypestr="内饰清洗-20元";
//		}else{
//			this.washTypestr=this.washType;
//		}
		
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public Date getUseCarTime() {
		return useCarTime;
	}

	public void setUseCarTime(Date useCarTime) {
		this.useCarTime = useCarTime;
	}

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber == null ? null : roomNumber.trim();
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note == null ? null : note.trim();
	}

	public Date getAcceptTime() {
		return acceptTime;
	}

	public void setAcceptTime(Date acceptTime) {
		this.acceptTime = acceptTime;
	}

	public Date getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}

	public String getAcceptNote() {
		return acceptNote;
	}

	public void setAcceptNote(String acceptNote) {
		this.acceptNote = acceptNote == null ? null : acceptNote.trim();
	}

	public String getOrderStatus() {

		return this.orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus == null ? null : orderStatus.trim();
//		if ("ORDERSTATUS_CANCEL".equals(this.orderStatus)) {
//			this.orderStatusStr = "已取消";
//		} else if ("ORDERSTATUS_UNPAID".equals(this.orderStatus)) {
//			this.orderStatusStr = "待支付";
//		} else if ("ORDERSTATUS_PAID".equals(this.orderStatus)) {
//			this.orderStatusStr = "已支付";
//		} else if ("ORDERSTATUS_HAVEORDER".equals(this.orderStatus)) {
//			this.orderStatusStr = "已接单";
//		} else if ("ORDERSTATUS_SUCCESS".equals(this.orderStatus)) {
//			this.orderStatusStr = "已完成";
//		} else {
//			this.orderStatusStr = this.orderStatus;
//		}
	}

	public Float getOrderMoney() {
		return orderMoney;
	}

	public void setOrderMoney(Float orderMoney) {
		this.orderMoney = orderMoney;
	}

	public Float getBackMoney() {
		return backMoney;
	}

	public void setBackMoney(Float backMoney) {
		this.backMoney = backMoney;
	}

	public Integer getServiceRate() {
		return serviceRate;
	}

	public void setServiceRate(Integer serviceRate) {
		this.serviceRate = serviceRate;
	}

	public String getServiceNote() {
		return serviceNote;
	}

	public void setServiceNote(String serviceNote) {
		this.serviceNote = serviceNote == null ? null : serviceNote.trim();
	}

	public String getAcceptUserName() {
		return acceptUserName;
	}

	public void setAcceptUserName(String acceptUserName) {
		this.acceptUserName = acceptUserName == null ? null : acceptUserName.trim();
	}

	public String getWashUserName() {
		return washUserName;
	}

	public void setWashUserName(String washUserName) {
		this.washUserName = washUserName == null ? null : washUserName.trim();
	}


	public String getConsumerOpenid() {
		return consumerOpenid;
	}

	public void setConsumerOpenid(String consumerOpenid) {
		this.consumerOpenid = consumerOpenid;
	}
	
	
}