package mimity.intercepter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import mimity.entity.Category;
import mimity.entity.Supplier;

@Transactional
public class StoreInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	SessionFactory factory;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		Session session = factory.getCurrentSession();

		String hql1 = "FROM Category";
		Query query1 = session.createQuery(hql1);
		List<Category> cates = query1.list();
		modelAndView.addObject("cates", cates);

		String hql2 = "FROM Supplier";
		Query query2 = session.createQuery(hql2);
		List<Supplier> supps = query2.list();
		modelAndView.addObject("supps", supps);

	}
}