package mimity.admin.controller;

import java.util.List; 

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import mimity.entity.Order;
import mimity.entity.OrderDetail;

@Transactional
@Controller
@RequestMapping("admin/order-detail")
public class OrderDetailMgrController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("delete")
	public String delete(ModelMap model, OrderDetail orderDetail) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(orderDetail);
			t.commit();
			model.addAttribute("message", "Xóa thành công !");
			model.addAttribute("model", new OrderDetail());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xóa thất bại !");
			model.addAttribute("model", orderDetail);
		}
		finally {
			session.close();
		}
		model.addAttribute("items", getOrderDetails());
		return "admin/order-detail";
	}
	
	@RequestMapping("update")
	public String update(ModelMap model, OrderDetail orderDetail) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(orderDetail);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại !");
		}
		finally {
			session.close();
		}
		model.addAttribute("model", orderDetail);
		model.addAttribute("items", getOrderDetails());
		return "admin/order-detail";
	}
	
	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		OrderDetail orderDetail = (OrderDetail) session.get(OrderDetail.class, id);
		Hibernate.initialize(orderDetail.getOrder());
		model.addAttribute("model", orderDetail);
		model.addAttribute("items", getOrderDetails());
		return "admin/order-detail";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model, OrderDetail orderDetail) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(orderDetail);
			t.commit();
			model.addAttribute("message", "Thêm mới thành công !");
			model.addAttribute("model", new OrderDetail());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Thêm mới thất bại !");
			model.addAttribute("model", orderDetail);
		}
		finally {
			session.close();
		}
		model.addAttribute("items", getOrderDetails());
		return "admin/order-detail";
	}
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		OrderDetail orderDetail = new OrderDetail();
		model.addAttribute("model", orderDetail);
		
		model.addAttribute("items", getOrderDetails());
		return "admin/order-detail";
	}
	
	@SuppressWarnings("unchecked")
	private List<OrderDetail> getOrderDetails() {
		String hql = "FROM OrderDetail";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<OrderDetail> list = query.list();
		return list;
	}
}
