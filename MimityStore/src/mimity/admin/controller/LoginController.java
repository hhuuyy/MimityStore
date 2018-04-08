package mimity.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
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

import mimity.entity.security.Master;

@Transactional
@Controller
@RequestMapping("role/login")
public class LoginController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("login")
	public String login() {
		return "role/login/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(ModelMap model, @RequestParam("id") String id, @RequestParam("password") String pw,
			HttpSession httpSession, HttpServletResponse response) {
		Session session = factory.getCurrentSession();
		String url = "";
		try {
			Master master = (Master) session.get(Master.class, id);
			if (!master.getPassword().equals(pw)) {
				model.addAttribute("message", "Invalid password !");
				url = "role/login/login";
			} else {
				model.addAttribute("message", "Login successfully");
				httpSession.setAttribute("master", master);
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
				url = "admin/home/index";
			}
		} catch (Exception e) {
			model.addAttribute("message", "Invalid username !");
			url = "role/login/login";
		}
		return url;
	}
	@RequestMapping("logoff")
	public String logoff(HttpSession httpSession) {
		httpSession.removeAttribute("master");
		return "redirect:/role/login/login.php";
	}
}
