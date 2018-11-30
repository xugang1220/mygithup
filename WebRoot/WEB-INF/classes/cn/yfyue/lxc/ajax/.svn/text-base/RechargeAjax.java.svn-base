package cn.yfyue.lxc.ajax;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.lxc.bll.Recharge;
import cn.yfyue.lxc.db.model.TLxcPackageRecharge;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value = "RechargeAjax")
public class RechargeAjax {
	private Recharge recharge = ContextLoader.getCurrentWebApplicationContext().getBean(Recharge.class);

	// 进入查询充值
	public String getRechargeList(@AjaxParam("qkey") String qkey, @AjaxParam("page") String page,
			@AjaxParam("rows") String rows, ServletRequest request) {
		qkey = F.isNull(qkey);
		int nPage = F.fPage(page);
		int nRowNum = F.fRow(rows);
		ReturnJson returnJson = new ReturnJson();
		List<TLxcPackageRecharge> lxcPackageRecharges = null;
		try {
			if (Auth.isAuth(request)) {
				lxcPackageRecharges = recharge.getRechargeList(qkey, (nPage - 1) * nRowNum, nRowNum);
				if (lxcPackageRecharges != null) {
					returnJson.setState(0);
					returnJson.setMessage("操作成功");
					returnJson.setObject(lxcPackageRecharges);
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

	// 列表统计充值
	public String getRechargeListCount(@AjaxParam("qkey") String qkey, ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();
		int dataTotalRowNum = 0;
		qkey = F.isNull(qkey);
		try {
			if (Auth.isAuth(request)) {
				dataTotalRowNum = recharge.getRechargeListCount(qkey);
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

	// 根据id删除充值记录
	public String delRechargeById(@AjaxParam("id") String id, ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();
		id = F.isNull(id);
		try {
			if (Auth.isAuth(request)) {
				if (id != null) {
					if (recharge.delRechargeById(id) == 0) {
						returnJson.setState(0);
						returnJson.setMessage("数据已删除");
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
		L.opLog(Thread.currentThread().getStackTrace(), request, "删除充值记录", returnJson.getMessage());
		return returnJson.getJson();
	}
	/*
 <!-- 添加充值记录 -->
  <insert id="addRecharge" >
  	INSERT INTO t_lxc_package_recharge cname,remove,create_time,update_time,package_discount_id,giving_money,rechare_money,consumer_id
  	VALUES(#{cname,jdbcType=VARCHAR},#{remove,jdbcType=BIT},#{create_time,jdbcType=TIMESTAMP},#{update_time,jdbcType=TIMESTAMP},
  	#{package_discount_id,jdbcType=INTEGER},#{giving_money,jdbcType=REAL},#{rechare_money,jdbcType=REAL},#{consumer_id,jdbcType=INTEGER})
  </insert>
	 */
	//添加充值记录
//	public String addRecharge(@AjaxParam("remove") String remove,
//				@AjaxParam("create_time") String create_time, @AjaxParam("update_time") String update_time,
//				@AjaxParam("package_discount_id") String package_discount_id, @AjaxParam("giving_money") String giving_money,
//				@AjaxParam("rechare_money") String rechare_money, @AjaxParam("consumer_id") String consumer_id,
//				ServletRequest request) {
//			ReturnJson returnJson = new ReturnJson();
//			remove = F.isNull(remove);
//			create_time = F.isNull(create_time);
//			update_time = F.isNull(update_time);
//			package_discount_id = F.isNull(package_discount_id);
//			giving_money = F.isNull(giving_money);
//			rechare_money = F.isNull(rechare_money);
//			consumer_id = F.isNull(consumer_id);
//			TLxcPackageRecharge tLxcPackageRecharge = null;
//			try {
//				if (Auth.isAuth(request)) {
//					tLxcPackageRecharge = new TLxcPackageRecharge();
//					tLxcPackageRecharge.setRemove(Boolean.getBoolean(remove));
//					tLxcPackageRecharge.setCreateTime(F.stringToDate(create_time, "yyyy-MM-dd HH:mm:ss"));
//					tLxcPackageRecharge.setUpdateTime(F.stringToDate(update_time, "yyyy-MM-dd HH:mm:ss"));
//					tLxcPackageRecharge.setPackageDiscountId(Integer.getInteger(package_discount_id));
//					tLxcPackageRecharge.setGivingMoney(F.strToFloat(giving_money));
//					tLxcPackageRecharge.setRechareMoney(F.strToFloat(rechare_money));
//					tLxcPackageRecharge.setConsumerId(Integer.getInteger(consumer_id));
//					if (recharge.addRecharge(tLxcPackageRecharge) > 0) {
//						returnJson.setState(0);
//						returnJson.setMessage("添加充值记录成功");
//					} else {
//						returnJson.setState(-1);
//						returnJson.setMessage("对不起!添加充值记录失败");
//					}
//
//				} else {
//					returnJson.setState(-997);
//					returnJson.setMessage("请登录后,再操作...");
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			L.opLog(Thread.currentThread().getStackTrace(), request, "添加充值记录", returnJson.getMessage());
//			return returnJson.getJson();
//		}
}
