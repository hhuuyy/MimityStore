package mimity.admin.controller;

import java.util.List; 

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mimity.entity.Category;
import mimity.entity.security.Master;

@Transactional
@Controller
@RequestMapping("admin/home")
public class AdminHomeController {
	
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model){
		
		model.addAttribute("catess", getCates());
		model.addAttribute("suppss", getSupps());
		model.addAttribute("custss", getCust());
		model.addAttribute("orderss", getOrders());
		model.addAttribute("prodss", getProds());
		model.addAttribute("orddss", getOrdds());
		
		Session session = factory.getCurrentSession();
		String hql = "Select p.category.nameVN,"
				+ " sum(p.quantity),"
				+ " sum(p.quantity*p.unitPrice),"
				+ " min(p.unitPrice),"
				+ " max(p.unitPrice),"
				+ "	avg(p.unitPrice)"
				+ " From Product p group by p.category.nameVN";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		model.addAttribute("group", "Category");
		model.addAttribute("items", list);
		
		return "admin/home/index";
	}
	
	
	public long getCates(){
		Session session = factory.getCurrentSession();
		String hql = "Select count(id) from Category";
		Query query = session.createQuery(hql);
		Long c = (Long)query.uniqueResult();
		return c;
	}
	
	public long getSupps(){
		Session session = factory.getCurrentSession();
		String hql = "Select count(id) from Supplier";
		Query query = session.createQuery(hql);
		Long c = (Long)query.uniqueResult();
		return c;
	}
	
	public long getCust(){
		Session session = factory.getCurrentSession();
		String hql = "Select count(id) from Customer";
		Query query = session.createQuery(hql);
		Long c = (Long)query.uniqueResult();
		return c;
	}
	
	public long getOrders(){
		Session session = factory.getCurrentSession();
		String hql = "Select count(id) from Order";
		Query query = session.createQuery(hql);
		Long c = (Long)query.uniqueResult();
		return c;
	}
	
	public long getProds(){
		Session session = factory.getCurrentSession();
		String hql = "Select count(id) from Product";
		Query query = session.createQuery(hql);
		Long c = (Long)query.uniqueResult();
		return c;
	}
	
	public long getOrdds(){
		Session session = factory.getCurrentSession();
		String hql = "Select count(id) from OrderDetail";
		Query query = session.createQuery(hql);
		Long c = (Long)query.uniqueResult();
		return c;
	}
	
	@RequestMapping("error")
	public String error(){
		return "admin/home/error";
	}
	
	@RequestMapping("logoff")
	public String logoff(HttpSession httpSession){
		httpSession.removeAttribute("master");
		return "role/login/login";
	}
	
//	@RequestMapping("login")
//	public String login(){
//		return "admin/home/login";
//	}
	
//	@RequestMapping(value="login",method=RequestMethod.POST)
//	public String login(ModelMap model,
//			@RequestParam("id")String id, @RequestParam("password")String pw,
//			HttpSession httpSession){
//		Session session = factory.getCurrentSession();
//		try{
//			Master master = (Master)session.get(Master.class, id);
//			if(master.getPassword().equals(pw)){
//				model.addAttribute("message", "Login successful!");
//				httpSession.setAttribute("master", master);
//				// trở lại trang muốn vào khi chưa login vào
//				
//				String returnUrl = (String)httpSession.getAttribute("returnUrl");
//				if(returnUrl != null){
//					return "redirect:" + returnUrl;
//				}
//			}
//			else{
//				model.addAttribute("message", "Invalid password!");
//			}
//		}
//		catch(Exception e){
//			model.addAttribute("message", "Invalid username!");
//		}
//		return "admin/home/login";
//	}
	
	
}
