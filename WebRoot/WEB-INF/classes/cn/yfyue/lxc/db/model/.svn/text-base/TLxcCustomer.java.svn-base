package cn.yfyue.lxc.db.model;

import java.util.Date;

//客户
public class TLxcCustomer {
   
    private Integer id;//标识

    private String cname;//默认手机号

    private Boolean remove;//以删除
    
    private Date createTime;//创建时间

    private Date updateTime;//更新时间

    private String wechatId;//微信标识

    private Boolean admin;//是否是管理员
    
    private String removeadmin;//是否是管理员(另加)
    
    private Float rechargeMoney;//充值金额

    private Float givingMoney;//赠送金额
    
    private String headimgurl;//头像地址
    
    private String nickname;//昵称

    private Float sunmoney;//总余额
	
	private String sumrechmoney;//显示客户充值总金额
	
	private String sumgivingmoney;//显示赠送客户总金额
    
	public String getHeadimgurl() {
		return headimgurl;
	}
	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
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

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
    public String getWechatId() {
        return wechatId;
    }

    public void setWechatId(String wechatId) {
        this.wechatId = wechatId == null ? null : wechatId.trim();
    }
  
    public Boolean getAdmin() {
    
        return admin;
    }
    public void setAdmin(Boolean admin) {
    	this.admin = admin;
    	 if(admin){
    		 this.removeadmin = "是";
    	 }else{
    		 this.removeadmin=	"否";
    	 }
    }

    public Float getRechargeMoney() {
        return rechargeMoney;
    }
    public void setRechargeMoney(Float rechargeMoney) {
        this.rechargeMoney = rechargeMoney;
    }

    public Float getGivingMoney() {
        return givingMoney;
    }

    public void setGivingMoney(Float givingMoney) {
        this.givingMoney = givingMoney;
    }
}