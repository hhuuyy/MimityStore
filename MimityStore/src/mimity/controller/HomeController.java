package mimity.controller;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mimity.entity.Category;
import mimity.entity.Product;

import mimity.util.HibernateUtils;
import mimity.entity.Supplier;

@Transactional
@Controller
@RequestMapping("user/home")
public class HomeController {

	@Autowired
	SessionFactory factory;

	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();

//		model.addAttribute("cates", getCategories());

		String hql2 = "FROM Supplier";
		Query query2 = session.createQuery(hql2);
		List<Supplier> supps = query2.list();
		model.addAttribute("supps", supps);
		// Hiện hàng đặc biệt Special
		String hql3 = "From Product WHERE latest=true";
		Query query3 = session.createQuery(hql3);
		List<Product> list3 = query3.list();
		model.addAttribute("specials", list3);
		// Hiện hàng
		String hql4 = "From Product ";
		Query query4 = session.createQuery(hql4);
		List<Product> list4 = query4.list();
		model.addAttribute("prods", list4);
		return "user/home/index";
	}

	private List<Category> getCategories() {
		String hql = "From Category";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}
}
