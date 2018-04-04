package mimity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mimity.component.ShoppingCart;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	ShoppingCart cart;
	
	@RequestMapping("view")
	public String view(ModelMap model) {
		model.addAttribute("cart", cart);
		return "user/cart/view";
	}
	
	@RequestMapping("clear")
	public String clear(ModelMap model) {
		model.addAttribute("cart", cart);
		cart.clear();
		return "user/cart/view";
	}
	
	@ResponseBody
	@RequestMapping("update")
	public String update(@RequestParam("id") Integer id, 
			@RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		String json = String.format("{\"count\":%d, \"amount\":%.2f}", 
				cart.getCount(), cart.getAmount());
		return json;
	}
	
	@ResponseBody
	@RequestMapping("add/{id}")
	public String add(@PathVariable("id") int id) {
		cart.add(id);
		
		String json = String.format("{\"count\":\"%d\",\"amount\":\"%.2f\"}", cart.getCount(), cart.getAmount());
		return json;
	}
	
	@ResponseBody
	@RequestMapping("remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		String json = String.format("{\"count\":%d, \"amount\":%.2f}", 
				cart.getCount(), cart.getAmount());
		return json;
	}
}
