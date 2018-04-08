package mimity.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import mimity.entity.security.Master;

public class AuthorizeInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession httpSession = request.getSession();
		if(httpSession.getAttribute("user") == null){
			String cpath = request.getContextPath();
			// quay lại đường dẫn
			// vd: EShop/cart/index.php --> cart/index.php
			String returnUrl = request.getRequestURI().replace(cpath, "");
			// cất 
			httpSession.setAttribute("returnUrl", returnUrl);
			response.sendRedirect(cpath + "/account/login.php");
			return false;
		}
		return true;
	}
}
