package cn.yfyue.lxc.ajax;

import javax.servlet.http.HttpServletResponse;

public class CodeToStr {
	
	// 套餐数据状态
	public static String bjDiscounToState(String code) {
		String reStr = "";
		try {
			if (code != null) {
				if (code.equals("0")) {
					reStr = "禁止";
				} else if (code.equals("1")) {
					reStr = "正常";
				} else {
					reStr = "";
				}
			} else {
				reStr = "";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reStr;
	}
	//跨域请求
	public void setScoreHttp(HttpServletResponse httpServletResponse){
		httpServletResponse.setHeader("Access-Control-Allow-Origin","*");
		httpServletResponse.setHeader("Access-Control-Allow-Methods","POST");
		httpServletResponse.setHeader("Access-Control-Allow-Headers","Access-Control");
		httpServletResponse.setHeader("Allow","POST");
	}
}
