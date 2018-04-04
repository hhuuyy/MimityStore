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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mimity.entity.Category;
import mimity.entity.Product;
import mimity.entity.SubCategory;
import mimity.util.HibernateUtils;

@Transactional
@Controller
@RequestMapping("user/home")
public class HomeController {

	@Autowired
	SessionFactory factory;

//	@RequestMapping("list-by-category/{id}")
//	public String listByCategory(ModelMap model, @PathVariable("id") Integer id) {
//		String hql = "FROM Category WHERE category.id=:cid";
//		Session session = factory.getCurrentSession();
//		Query query = session.createQuery(hql);
//		query.setParameter("cid", id);
//		List<SubCategory> list = query.list();
//		model.addAttribute("prods", list);
//
//		return "user/product/list";
//	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "From Category";
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		model.addAttribute("cates", showCate());
		model.addAttribute("product", showProduct());
		
		return "user/home/index";
	}
	
	public List<Category> showHotDeals() {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "Select top 10 From Category";
			Query query = session.createQuery(hql);
			List<Category> list = query.list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return null;
	}

	public List<Category> showCate() {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "From Category";
			Query query = session.createQuery(hql);
			List<Category> list = query.list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return null;
	}

	public List<SubCategory> showSubCateByCate(Integer id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "From SubCategory WHERE category.id =" + id;
			Query query = session.createQuery(hql);
			List<SubCategory> list = query.list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return null;
	}
	
	public List<Product> showProduct() {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "From Product";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return null;
	}

}
