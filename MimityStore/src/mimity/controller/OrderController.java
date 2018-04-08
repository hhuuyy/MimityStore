package mimity.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mimity.controller.ShoppingCart;
import mimity.entity.Customer;
import mimity.entity.Order;
import mimity.entity.OrderDetail;
import mimity.entity.Product;

@Transactional
@Controller
@RequestMapping("order")
public class OrderController {
	
	// làm việc với database
	@Autowired
	SessionFactory factory;
	
	// lấy giỏ hàng
	@Autowired
	ShoppingCart cart;
	
	@RequestMapping("checkout")
	public String checkout(ModelMap model, HttpSession httpSession){
		Customer user = (Customer)httpSession.getAttribute("user");
		Order order = new Order();
		order.setOrderDate(new Date());
		order.setAmount(cart.getAmount());
		order.setCustomer(user);
		model.addAttribute("order", order);
		model.addAttribute("cart", cart);
		return "user/order/checkout";
	}
	
	@RequestMapping(value="checkout",method=RequestMethod.POST)
	public String checkout(ModelMap model,@ModelAttribute("order")Order order){
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.save(order);
			// chèn vào orderDetail
			// dùng vòng lặp để lấy các sp trong giỏ hàng ra
			for(Product p : cart.getItems()){
				// cứ 1 mặt hàng trong giỏ tạo ra 1 orderDetail --> chèn vào database
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrder(order);
				orderDetail.setProduct(p);
				orderDetail.setUnitPrice(p.getUnitPrice());
				orderDetail.setDiscount(p.getDiscount());
				orderDetail.setQuantity(p.getQuantity());
				
				session.save(orderDetail);
			}
			t.commit();
			cart.clear();
			model.addAttribute("message", "Đặt hàng thành công!");
		}
		catch(Exception e){
			model.addAttribute("cart", cart);
			t.rollback();
			model.addAttribute("message", "Đặt hàng thất bại!");
		}
		finally{
			session.close();
		}
		model.addAttribute("order", order);
		return "user/order/checkout";
	}
	
	// hiện tất cả đơn hàng của khách hàng
	@RequestMapping("list")
	public String list(ModelMap model, HttpSession httpSession){
		Customer user = (Customer)httpSession.getAttribute("user");
		// hql truy vấn theo mã khách hàng
		String hql = "From Order where customer.id =:userid";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("userid", user.getId());
		List<Order> list = query.list();
		model.addAttribute("orders",list);
		return "user/order/list";
	}
	
	@RequestMapping("detail/{id}")
	public String detail(ModelMap model, @PathVariable("id") int id){
		Session session = factory.getCurrentSession();
		Order order = (Order)session.get(Order.class, id);
		// nạp kèm dữ liệu
		Hibernate.initialize(order.getOrderDetails());
		model.addAttribute("order", order);
		return "user/order/detail";
	}
	
	// lấy ra tất cả mặt hàng mà kh mua từ trước tới giờ
	@RequestMapping("items")
	public String itemsPurchased(ModelMap model,HttpSession httpSession){
		Customer user = (Customer)httpSession.getAttribute("user");
		Session session = factory.getCurrentSession();
		// Distinct loại những mặt hàng trùng
		String hql = "Select Distinct d.product From OrderDetail d "
				+ " where d.order.customer.id =:userid";
		Query query = session.createQuery(hql);
		query.setParameter("userid", user.getId());
		List<Product> list = query.list();
		model.addAttribute("prods", list);
		return "user/product/list";
	}
	
}
