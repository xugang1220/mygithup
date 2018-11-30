package cn.yfyue.lxc.bll;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.google.common.base.Strings;

/**
 * session应用拦截
 */
public class SessionApplicationInterceptor extends HandlerInterceptorAdapter{
//	private Customer customer=ContextLoader.getCurrentWebApplicationContext().getBean(Customer.class);
//	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		String openId=request.getParameter("openId");
//		System.out.println("Interceptor openId:"+openId);
//		
//		//1.openId必须非空
//		if(Strings.isNullOrEmpty(openId)){
//			throw new Exception("openid null");
//		}
//		
//		//2.内部请求不拦截
//		if("local".equals(openId)){
//			return super.preHandle(request, response, handler);
//		}
//		
//		//3.openId必须合法存在
//		if(Strings.isNullOrEmpty(customer.findCustomerWechatId(openId))){
//			throw new Exception("openid invalid");
//		}
//		
//		return super.preHandle(request, response, handler);
//	}
	
}
