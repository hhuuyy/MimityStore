package mimity.controller;

import java.util.List;

import mimity.entity.Category;

public class Test {

	public static void main(String[] args) {
		
		HomeController homeC = new HomeController();
		List<Category> list = homeC.showCate();
		for(Category c:list) {
			System.out.println(c.getId());
		}
		
	}

}
