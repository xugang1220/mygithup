package cn.yfyue.lxc.ajax;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.lxc.bll.Order;
import cn.yfyue.lxc.db.model.TLxcOrder;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass(value = "OrderAjax")
public class OrderAjax {
	private Order order = ContextLoader.getCurrentWebApplicationContext().getBean(Order.class);
	// 进入查询所有订单
	public String getOrderList(@AjaxParam("qkey") String qkey, @AjaxParam("page") String page,
			@AjaxParam("rows") String rows, ServletRequest request) {
		qkey = F.isNull(qkey);
		int nPage = F.fPage(page);
		int nRowNum = F.fRow(rows);
		ReturnJson returnJson = new ReturnJson();
		List<TLxcOrder> orders = null;
		try {
			if (Auth.isAuth(request)) {
				orders = order.getOrderList(qkey, (nPage - 1) * nRowNum, nRowNum);
				if (orders != null) {
					returnJson.setState(0);
					returnJson.setMessage("操作成功");
					returnJson.setObject(orders);
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

	// 订单列表统计
	public String getOrderListCount(@AjaxParam("qkey") String qkey, ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();

		int dataTotalRowNum = 0;
		qkey = F.isNull(qkey);
		try {
			if (Auth.isAuth(request)) {
				dataTotalRowNum = order.getOrderListCount(qkey);
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

	// 添加订单记录
	public String addOrder(@AjaxParam("consumer_id") String consumer_id, @AjaxParam("name") String name,
			@AjaxParam("remove") String remove, @AjaxParam("create_time") String create_time,
			@AjaxParam("update_time") String update_time, @AjaxParam("community_name") String community_name,
			@AjaxParam("car_location") String car_location, @AjaxParam("car_number") String car_number,
			@AjaxParam("wash_type") String wash_type, @AjaxParam("phone") String phone,
			@AjaxParam("use_car_time") String use_car_time, @AjaxParam("room_number") String room_number,
			@AjaxParam("note") String note, @AjaxParam("accept_time") String accept_time,
			@AjaxParam("finish_time") String finish_time, @AjaxParam("accept_note") String accept_note,
			@AjaxParam("order_status") String order_status, @AjaxParam("order_money") String order_money,
			@AjaxParam("back_money") String back_money, @AjaxParam("service_rate") String service_rate,
			@AjaxParam("accept_user_name") String accept_user_name, @AjaxParam("wash_user_name") String wash_user_name,
			ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();
		consumer_id = F.isNull(consumer_id);
		name = F.isNull(name);
		remove = F.isNull(remove);
		create_time = F.isNull(create_time);
		update_time = F.isNull(update_time);
		community_name = F.isNull(community_name);
		car_location = F.isNull(car_location);
		car_number = F.isNull(car_number);
		wash_type = F.isNull(wash_type);
		phone = F.isNull(phone);
		use_car_time = F.isNull(use_car_time);
		room_number = F.isNull(room_number);
		note = F.isNull(note);
		accept_time = F.isNull(accept_time);
		finish_time = F.isNull(finish_time);
		accept_note = F.isNull(accept_note);
		order_status = F.isNull(order_status);
		order_money = F.isNull(order_money);
		back_money = F.isNull(back_money);
		service_rate = F.isNull(service_rate);
		accept_user_name = F.isNull(accept_user_name);
		wash_user_name = F.isNull(wash_user_name);
		TLxcOrder lxcOrder = null;
		try {
			if (Auth.isAuth(request)) {
				lxcOrder = new TLxcOrder();
				lxcOrder.setConsumerId(Integer.getInteger(consumer_id));
				lxcOrder.setName(name);
				lxcOrder.setRemove(Boolean.getBoolean(remove));
				lxcOrder.setCreateTime(F.stringToDate(create_time, "yyyy-MM-dd HH:mm:ss"));
				lxcOrder.setUpdateTime(F.stringToDate(update_time, "yyyy-MM-dd HH:mm:ss"));
				lxcOrder.setCommunityName(community_name);
				lxcOrder.setCarLocation(car_location);
				lxcOrder.setCarNumber(car_number);
				lxcOrder.setWashType(wash_type);
				lxcOrder.setPhone(phone);
				lxcOrder.setUseCarTime(F.stringToDate(use_car_time, "yyyy-MM-dd HH:mm:ss"));
				lxcOrder.setRoomNumber(room_number);
				lxcOrder.setNote(note);
				lxcOrder.setAcceptTime(F.stringToDate(accept_time, "yyyy-MM-dd HH:mm:ss"));
				lxcOrder.setFinishTime(F.stringToDate(finish_time, "yyyy-MM-dd HH:mm:ss"));
				lxcOrder.setAcceptNote(accept_note);
				lxcOrder.setOrderStatus(order_status);
				lxcOrder.setOrderMoney(F.strToFloat(order_money));
				lxcOrder.setServiceRate(Integer.getInteger(service_rate));
				lxcOrder.setAcceptUserName(accept_user_name);
				lxcOrder.setWashUserName(wash_user_name);
				if (order.addOrder(lxcOrder) > 0) {
					returnJson.setState(0);
					returnJson.setMessage("添加订单成功");
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("对不起!添加订单失败");
				}

			} else {
				returnJson.setState(-997);
				returnJson.setMessage("请登录后,再操作...");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		L.opLog(Thread.currentThread().getStackTrace(), request, "添加订单", returnJson.getMessage());
		return returnJson.getJson();
	}
	//根据id删除订单
	public String delOrderById(
			 @AjaxParam("id") String id,
			ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();
		id = F.isNull(id);
		try {
			if (Auth.isAuth(request)) {
				if(id!=null){	
	              if(order.delOrderById(id)==0){
	            	  	returnJson.setState(0);
	            	  	returnJson.setMessage("数据已删除"); 
	              }else{
	            	  returnJson.setIsRollback(-1);
	            	  returnJson.setMessage("数据异常，删除失败");
	              }
				}
	               else {
				returnJson.setState(-997);
				returnJson.setMessage("请登录,再操作");
	           }
			}
		} catch (Exception e) {
			returnJson.setState(-1);
			returnJson.setMessage(e.toString());  
			e.printStackTrace();
		}
		L.opLog(Thread.currentThread() .getStackTrace(), request, "删除订单", returnJson.getMessage());
		return returnJson.getJson();
	}
	//配置数据根据id取记录
//	public String getMyLayout(
//			@AjaxParam("id") String id,
//			ServletRequest request) {
//		ReturnJson returnJson = new ReturnJson();
//	    id=F.isNull(id);
//	    TLxcOrder lxcOrder=null;
//		try {
//			if (Auth.isAuth(request)) {
//				lxcOrder=order.getMyLayout(id);
//				if(lxcOrder!=null){
//					returnJson.setState(0);
//					returnJson.setMessage("操作成功");
//					returnJson.setObject(lxcOrder);
//				}else{
//					returnJson.setState(-1);
//					returnJson.setMessage("对不起,获取数据信息失败");
//				}
//			}else{
//				returnJson.setState(-997);
//				returnJson.setMessage("请登录后,再操作...");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return returnJson.getJson();
//	}
	//修改配置数据
	public String upLayoutDate(	
			@AjaxParam("id") String id,
			 @AjaxParam("communityName") String communityName,
			 @AjaxParam("washType") String washType,	
			 @AjaxParam("remove") String remove,
			ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();
		id=F.isNull(id);
		communityName = F.isNull(communityName);
		washType =F.isNull(washType);
		remove =F.isNull(remove);
		TLxcOrder lxcOrder= new TLxcOrder();
		try {
			if (Auth.isAuth(request)) {
				if(id!=null){	
				order = new Order();
				lxcOrder.setId(F.StrToInt(id));
				lxcOrder.setCommunityName(communityName);
				lxcOrder.setWashType(washType);
				lxcOrder.setRemove(Boolean.valueOf(remove));						
				  if(order.upLayoutDate(lxcOrder)>0){
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
		L.opLog(Thread.currentThread() .getStackTrace(), request, "配置数据更新", returnJson.getMessage());
		return returnJson.getJson();
	}
	//配置洗车类型下拉
	public String getLayoutTypeCount(@AjaxParam("qkey") String qkey,
			@AjaxParam("wash_type") String wash_type,
			ServletRequest request) {
	  ReturnJson returnJson=new ReturnJson();
	  int wash_typeCount=0;
	  qkey=F.isNull(qkey);
	  wash_type=F.isNull(wash_type);
	  try{
		 if (Auth.isAuth(request)) {
			// 取最大行数
			 wash_typeCount =order.getLayoutTypeCount(qkey);
			returnJson.setState(0);
			returnJson.setMessage("操作成功");
			returnJson.setObject(wash_typeCount);
		   }else{
			   returnJson.setState(-1);
			   returnJson.setMessage("请登录,再操作");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnJson.getJson();
	}
}
