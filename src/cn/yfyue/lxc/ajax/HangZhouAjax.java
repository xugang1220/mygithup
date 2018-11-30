package cn.yfyue.lxc.ajax;


import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.web.context.ContextLoader;

import cn.yfyue.comm.Auth;
import cn.yfyue.comm.F;
import cn.yfyue.comm.L;
import cn.yfyue.comm.ReturnJson;
import cn.yfyue.lxc.bll.HangZhou;
import cn.yfyue.lxc.db.model.Hangzhou;
import jajax.annotation.AjaxClass;
import jajax.annotation.AjaxParam;

@AjaxClass("HangZhouAjax")
public class HangZhouAjax {
	private HangZhou hangZhous = ContextLoader.getCurrentWebApplicationContext().getBean(HangZhou.class);
	
	public String getHangZhouList(@AjaxParam("qkey")String qkey,@AjaxParam("page")String page,@AjaxParam("rows")String rows,ServletRequest request){
		qkey = F.isNull(qkey);
		int nPage = F.fPage(page);
		int nRowNum = F.fRow(rows);
		ReturnJson returnJson = new ReturnJson();
		List<Hangzhou> lists = null;
		try {
			if(Auth.isAuth(request)){
				lists =  hangZhous.getHangZhouList(qkey, (nPage - 1) * nRowNum, nRowNum);
				if(lists != null){
					returnJson.setState(0);
					returnJson.setMessage("操作成功");
					returnJson.setObject(lists);
				}else{
					returnJson.setState(-1);
					returnJson.setMessage("获取数据失败");
				}
			}else{
				returnJson.setState(-997);
				returnJson.setMessage("请登录后，再操作");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return returnJson.getJson();
	}
	public String addHangZhou(
			 @AjaxParam("mName") String mName,
			 @AjaxParam("mAddress") String mAddress,
			 @AjaxParam("mMdate") String mMdate,
			 @AjaxParam("mType") String mType, 
			 @AjaxParam("mEducation") String mEducation,
			 @AjaxParam("mDistance") String mDistance, 
			 @AjaxParam("mPhone") String mPhone,
			 @AjaxParam("mResult") String mResult, 
			 @AjaxParam("mFeel") String mFeel,
			 ServletRequest request) {
		ReturnJson returnJson = new ReturnJson();
		mName = F.isNull(mName);
		mAddress = F.isNull(mAddress);
		mMdate = F.isNull(mMdate);
		mType = F.isNull(mType);
		mEducation = F.isNull(mEducation);
		mDistance = F.isNull(mDistance);
		mPhone = F.isNull(mPhone);
		mResult = F.isNull(mResult);
		mFeel = F.isNull(mFeel);
		
		Hangzhou hangzhou = null;
		try {
			if (Auth.isAuth(request)) {
				hangzhou = new Hangzhou();
				hangzhou.setmName(mName);
				hangzhou.setmAddress(mAddress);
				hangzhou.setmMdate(F.stringToDate(mMdate, "yyyy-MM-dd HH:mm:ss"));
				hangzhou.setmType(mType);
				hangzhou.setmEducation(mEducation);
				hangzhou.setmDistance(mDistance);
				hangzhou.setmPhone(mPhone);
				hangzhou.setmResult(mResult);
				hangzhou.setmFeel(mFeel);
				if (hangZhous.insertAddHangZhou(hangzhou) > 0) {
					returnJson.setState(0);
					returnJson.setMessage("添加面试记录成功");
				} else {
					returnJson.setState(-1);
					returnJson.setMessage("对不起!添加面试记录失败");
				}

			} else {
				returnJson.setState(-997);
				returnJson.setMessage("请登录后,再操作...");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		L.opLog(Thread.currentThread().getStackTrace(), request, "添加面试记录", returnJson.getMessage());
		return returnJson.getJson();
	}
}
