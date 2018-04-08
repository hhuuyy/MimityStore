package mimity.intercepter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import mimity.entity.Category;
import mimity.entity.security.Master;

@Transactional
public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	SessionFactory factory;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		Session session = factory.getCurrentSession();

		String hql = "Select count(id) from Supplier";
		Query query = session.createQuery(hql);
		Long c = (Long) query.uniqueResult();
		modelAndView.addObject("suppss", c);

		String hql1 = "Select count(id) from Category";
		Query query1 = session.createQuery(hql1);
		Long c1 = (Long) query1.uniqueResult();
		modelAndView.addObject("catess", c1);

		String hql2 = "Select count(id) from Customer";
		Query query2 = session.createQuery(hql2);
		Long c2 = (Long) query2.uniqueResult();
		modelAndView.addObject("custss", c2);

		String hql3 = "Select count(id) from Product";
		Query query3 = session.createQuery(hql3);
		Long c3 = (Long) query3.uniqueResult();
		modelAndView.addObject("prodss", c3);

		String hql4 = "Select count(id) from Order";
		Query query4 = session.createQuery(hql4);
		Long c4 = (Long) query4.uniqueResult();
		modelAndView.addObject("orderss", c4);

		String hql5 = "Select count(id) from OrderDetail";
		Query query5 = session.createQuery(hql5);
		Long c5 = (Long) query5.uniqueResult();
		modelAndView.addObject("orddss", c5);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		String cpath = request.getContextPath();
		String returnUrl = uri.replace(cpath, "");

		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute("master") == null) {
			httpSession.setAttribute("returnUrl", returnUrl);
			response.sendRedirect(cpath + "/role/login/login.php");
			
			return false;
		}
		String[] paths = uri.split("/");
		/*
		 * String string = "004-034556"; String[] parts = string.split("-");
		 * String part1 = parts[0]; // 004 String part2 = parts[1]; // 034556
		 */
//		String action = paths[3] + "/" + paths[4].replace(".php", "");
		String action = paths[2] + "/" + paths[3].replace(".php", "");
		/*
		 * Nếu không nhập action vào WebAction thì được truy cập
		 */
		String hql = "SELECT COUNT(a) FROM WebAction a WHERE name=:name";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("name", action);
		Long count = (Long) query.uniqueResult();
		if (count == 0) {
			
			return true;
		}

		Master master = (Master) httpSession.getAttribute("master");

		String hql2 = "SELECT COUNT(ar) FROM ActionRole ar " + " WHERE ar.webAction.name=:aname "
				+ " AND ar.role.id IN (SELECT mr.role.id FROM MasterRole mr " + " WHERE mr.master.id=:mid)";
		Query query2 = session.createQuery(hql2);
		query2.setParameter("aname", action);
		query2.setParameter("mid", master.getId());
		Long count2 = (Long) query2.uniqueResult();
		if (count2 > 0) {
			
			return true;
		}

		response.sendRedirect(cpath + "/admin/home/error.php");
		
		return false;
	}
}
