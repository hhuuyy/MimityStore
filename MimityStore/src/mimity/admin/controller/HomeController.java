package mimity.admin.controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller("adminHomeController")
@RequestMapping("admin/home")
public class HomeController {
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		
		return "admin/home/index";
	}
	
}
