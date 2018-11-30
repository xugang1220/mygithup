package cn.yfyue.lxc.ajax;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.lxc.bll.Discount;
import cn.yfyue.lxc.db.model.TLxcPackageDiscount;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value = "DiscountAjax")
public class DiscountAjax {
	private Discount discount = ContextLoader.getCurrentWebApplicationContext().getBean(Discount.class);

	// 进入查询所有套餐
	public String getDiscountList(@AjaxParam("qkey") String qkey, @AjaxParam("page") String page,
			@AjaxParam("rows") String rows, ServletRequest request) {
		qkey = F.isNull(qkey);
		int nPage = F.fPage(page);
		int nRowNum = F.fRow(rows);
		ReturnJson returnJson = new ReturnJson();
		List<TLxcPackageDiscount> tLxcList = null;
		try {
			if (Auth.isAuth(request)) {
				tLxcList = discount.getDiscountList(qkey, (nPage - 1) * nRowNum, nRowNum);
				if (tLxcList != null) {
					returnJson.setState(0);
					returnJson.setMessage("操作成功");
					returnJson.setObject(tLxcList);
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("获取数据失败");
				}
			} else {
				returnJson.setState(-997);
				returnJson.setMessage("请登录,再操作");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnJson.getJson();
	}

	// 套餐列表统计
	public String getDiscountListCount(@AjaxParam("qkey") String qkey, ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();
		int dataTotalRowNum = 0;
		qkey = F.isNull(qkey);
		try {
			if (Auth.isAuth(request)) {
				dataTotalRowNum = discount.getDiscountListCount(qkey);
				returnJson.setObject(dataTotalRowNum);
				returnJson.setState(0);
				returnJson.setMessage("操作成功");
			} else {
				returnJson.setState(-997);
				returnJson.setMessage("请登录后,再操作...");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnJson.getJson();
	}

	// 根据id删除优惠套餐(有外键暂时没写)
	public String delDiscountById(@AjaxParam("id") String id, ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();
		id = F.isNull(id);
		try {
			if (Auth.isAuth(request)) {
				if (id != null) {
					if (discount.delDiscountById(id) == 0) {
						returnJson.setState(0);
						returnJson.setMessage("数据已删除");
					} else {
						returnJson.setIsRollback(-1);
						returnJson.setMessage("数据异常，删除失败");
					}
				} else {
					returnJson.setState(-997);
					returnJson.setMessage("请登录,再操作");
				}
			}
		} catch (Exception e) {
			//returnJson.setState(-1);
			//returnJson.setMessage(e.toString());
			e.printStackTrace();
		}
		L.opLog(Thread.currentThread().getStackTrace(), request, "删除套餐", returnJson.getMessage());
		return returnJson.getJson();
	}
	//禁用套餐
	public String discountmanage(
			@AjaxParam("id") String id,
			ServletRequest request) {
	   L.printRequest(Thread.currentThread() .getStackTrace(), request);
	   ReturnJson returnJson=new ReturnJson();
	   id=F.isNull(id);
	   TLxcPackageDiscount tLscount=null;
		try {
			if (Auth.isAuth(request)) {
				
				tLscount=discount.getMyDiscount(id);
				if(tLscount!=null){
				  if(tLscount.getRemove()==0){
					 if(discount.disCountmanage(id)>0){
						returnJson.setState(0);
						returnJson.setMessage("套餐已禁止");   
					 }else{
						returnJson.setState(-1);
						returnJson.setMessage("对不起,套餐禁止失败");  
					 }
				  }else{
					returnJson.setState(-1);
					returnJson.setMessage("对不起,套餐是禁止状态");  
				  }
				}else{
					returnJson.setState(-1);
					returnJson.setMessage("对不起,获取套餐信息失败");
				}
			}else{
				returnJson.setState(-1);
				returnJson.setMessage("请登录后,再操作...");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		L.opLog(Thread.currentThread() .getStackTrace(), request, "禁用套餐", returnJson.getMessage());
		return returnJson.getJson();
	}
	//启用套餐
		public String startDisount(
				@AjaxParam("id") String id,
				ServletRequest request) {
		   L.printRequest(Thread.currentThread() .getStackTrace(), request);
		   ReturnJson returnJson=new ReturnJson();
		   id=F.isNull(id);
		   TLxcPackageDiscount tLscount=null;
			try {
				if (Auth.isAuth(request)) {
					
					tLscount=discount.getMyDiscount(id);
					if(tLscount!=null){
					  if(tLscount.getRemove()==1){
						 if(discount.disCountmanage(id)>0){
							returnJson.setState(0);
							returnJson.setMessage("套餐开启成功");   
						 }else{
							returnJson.setState(-1);
							returnJson.setMessage("对不起,开启套餐失败");  
						 }
					  }else{
						returnJson.setState(-1);
						returnJson.setMessage("对不起,套餐是开启状态");  
					  }
					}else{
						returnJson.setState(-1);
						returnJson.setMessage("对不起,获取套餐信息失败");
					}
				}else{
					returnJson.setState(-1);
					returnJson.setMessage("请登录后,再操作...");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			L.opLog(Thread.currentThread() .getStackTrace(), request, "启用套餐", returnJson.getMessage());
			return returnJson.getJson();
		}
		//取自己的套餐数据
		public String getMyDiscount(@AjaxParam("id") String id,
				ServletRequest request) {
			ReturnJson returnJson = new ReturnJson();
		    id=F.isNull(id);
		    TLxcPackageDiscount tLscount=null;
			try {
				if (Auth.isAuth(request)) {
					tLscount=discount.getMyDiscount(id);
					if(tLscount!=null){
						returnJson.setState(0);
						returnJson.setMessage("操作成功");
						returnJson.setObject(tLscount);
					}else{
						returnJson.setState(-1);
						returnJson.setMessage("对不起,获取数据信息失败");
					}
				}else{
					returnJson.setState(-997);
					returnJson.setMessage("请登录后,再操作...");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return returnJson.getJson();
		}
		
		//修改套餐       @AjaxParam("createTime") String createTime, @AjaxParam("updateTime") String updateTime,
		public String upDiscountDate(
				@AjaxParam("id") String id,
				@AjaxParam("dname") String dname,
				 @AjaxParam("remove") String remove,
				 @AjaxParam("rechargeMoney") String rechargeMoney,
				 @AjaxParam("givingMoney") String givingMoney,
				 @AjaxParam("packgeDiscountStart") String packgeDiscountStart,
				 @AjaxParam("packgeDiscountEnd") String packgeDiscountEnd,
				 @AjaxParam("packageUseStart") String packageUseStart,
				 @AjaxParam("packageUseEnd") String packageUseEnd,
				 @AjaxParam("note") String note,
				ServletRequest request) {
			ReturnJson returnJson = new ReturnJson();
			id=F.isNull(id);
			dname=F.isNull(dname);
			remove = F.isNull(remove);
			rechargeMoney =F.isNull(rechargeMoney);
			givingMoney =F.isNull(givingMoney);
			packgeDiscountStart =F.isNull(packgeDiscountStart);
			packgeDiscountEnd =F.isNull(packgeDiscountEnd);
			packageUseStart =F.isNull(packageUseStart);
			packageUseEnd =F.isNull(packageUseEnd);
			note=F.isNull(note);
			TLxcPackageDiscount tLxcount= new TLxcPackageDiscount();
			try {
				if (Auth.isAuth(request)) {
					if(tLxcount!=null){	
						tLxcount.setId(F.StrToInt(id));
						tLxcount.setDname(dname);
						tLxcount.setRemove(F.StrToInt(remove));
						tLxcount.setRechargeMoney(F.strToFloat(rechargeMoney));
						tLxcount.setGivingMoney(F.strToFloat(givingMoney));
						tLxcount.setPackgeDiscountStart(F.stringToDate(packgeDiscountStart,"yyyy-MM-dd HH:mm:ss"));
						tLxcount.setPackgeDiscountEnd(F.stringToDate(packgeDiscountEnd,"yyyy-MM-dd HH:mm:ss"));
						tLxcount.setPackageUseStart(F.stringToDate(packageUseStart,"yyyy-MM-dd HH:mm:ss"));
						tLxcount.setPackageUseEnd(F.stringToDate(packageUseEnd,"yyyy-MM-dd HH:mm:ss"));
						tLxcount.setNote(note);
					  if(discount.upDiscountDate(tLxcount) == 1){
						  returnJson.setState(0);
						  returnJson.setMessage("数据更新成功"); 
					  }else{
						  returnJson.setState(-1);
						  returnJson.setMessage("对不起!数据更新失败");    
					  }
				   }
				} else {
					returnJson.setState(-997);
					returnJson.setMessage("请登录,再操作");
				}
			} catch (Exception e) {
				returnJson.setState(-1);
				returnJson.setMessage(e.toString());  
				e.printStackTrace();
			}
			L.opLog(Thread.currentThread() .getStackTrace(), request, "更新套餐", returnJson.getMessage());
			return returnJson.getJson();
		}
		
		//添加套餐
		public String addDiscount(
				@AjaxParam("dname") String dname,
				@AjaxParam("remove") String remove,
				@AjaxParam("createTime") String createTime,
				@AjaxParam("rechargeMoney") String rechargeMoney,
				@AjaxParam("givingMoney") String givingMoney,
				@AjaxParam("packgeDiscountStart") String packgeDiscountStart,
				@AjaxParam("packgeDiscountEnd") String packgeDiscountEnd,
				@AjaxParam("packageUseStart") String packageUseStart,
				@AjaxParam("packageUseEnd") String packageUseEnd,
				@AjaxParam("note") String note,
				ServletRequest request) {
			ReturnJson returnJson = new ReturnJson();
			dname=F.isNull(dname);
			remove=F.isNull(remove);
			createTime=F.isNull(createTime);
			rechargeMoney=F.isNull(rechargeMoney);
			givingMoney=F.isNull(givingMoney);
			packgeDiscountStart=F.isNull(packgeDiscountStart);
			packgeDiscountEnd=F.isNull(packgeDiscountEnd);
			packageUseStart=F.isNull(packageUseStart);
			packageUseEnd=F.isNull(packageUseEnd);
			note=F.isNull(note);
			try {
				if (Auth.isAuth(request)) {
					TLxcPackageDiscount tlxck=new TLxcPackageDiscount();
					tlxck.setDname(dname);
					tlxck.setRemove(F.StrToInt(remove));
					tlxck.setCreateTime(F.stringToDate(createTime,"yyyy-MM-dd HH:mm:ss"));
					tlxck.setRechargeMoney(F.strToFloat(rechargeMoney));
					tlxck.setGivingMoney(F.strToFloat(givingMoney));
					tlxck.setPackgeDiscountStart(F.stringToDate(packgeDiscountStart,"yyyy-MM-dd HH:mm:ss"));
					tlxck.setPackgeDiscountEnd(F.stringToDate(packgeDiscountEnd,"yyyy-MM-dd HH:mm:ss"));
					tlxck.setPackageUseStart(F.stringToDate(packageUseStart,"yyyy-MM-dd HH:mm:ss"));
					tlxck.setPackageUseEnd(F.stringToDate(packageUseEnd,"yyyy-MM-dd HH:mm:ss"));
					tlxck.setNote(note);
					if(discount.addDiscount(tlxck)>0){
						returnJson.setState(0);
		            	returnJson.setMessage("添加套餐成功"); 
					}else{
		            	 returnJson.setState(-1);
		            	 returnJson.setMessage("对不起!添加套餐失败"); 
					}
		           }else{
		 				returnJson.setState(-997);
						returnJson.setMessage("请登录后,再操作...");
					}
			} catch (Exception e) {
				e.printStackTrace();
			}
			L.opLog(Thread.currentThread() .getStackTrace(), request, "添加套餐", returnJson.getMessage());
			return returnJson.getJson();
		}
}
