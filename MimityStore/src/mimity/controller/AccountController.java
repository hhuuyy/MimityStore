package mimity.controller;

import java.io.File;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mimity.entity.Customer;

@Transactional
@Controller
@RequestMapping("account")
public class AccountController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext app;
//	
	@Autowired
	JavaMailSender mailler;
	
	@RequestMapping("register")
	public String register(ModelMap model) {
		Customer user = new Customer();
		model.addAttribute("user", user);
		return "user/account/register";
	}
//	
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(ModelMap model,  
			@ModelAttribute("user") Customer user,
			@RequestParam("upphoto") MultipartFile upphoto) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			// upload images
			if(!upphoto.isEmpty()){
				user.setPhoto(upphoto.getOriginalFilename());
				String path = app.getRealPath("/images/customers/"+user.getPhoto());
				upphoto.transferTo(new File(path));
			}
			else{
				user.setPhoto("user.png");
			}
			
			// Đăng kí
			session.save(user);
			t.commit();
			model.addAttribute("message", "Đăng ký thành công !");
			
			// gửi mail sau khi đăng kí
				try{
					MimeMessage mail = mailler.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(mail,"utf-8");
					helper.setFrom("hellonguyenquochuy@gmail.com","Nguyễn Quốc Huy");
					helper.setTo(user.getEmail());
					helper.setSubject("Welcome mail");
					// kích hoạt tài khoản
					String body = "<a href='http://localhost:9999/MimityStore/account/activate/"+user.getId()+".php'>Activate</a> your account !";
//					String body = "<a href='http://bootshop.mssql.somee.com/account/activate/"+user.getId()+".php'>Activate</a> your account !";
					helper.setText(body,true);
					helper.setReplyTo("hellonguyenquochuy@gmail.com");
					
					// bỏ vào bưu điện
					mailler.send(mail);
				}
				catch(Exception e){
				}
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Đăng ký thất bại !");
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return "user/account/register";
	}
//	
//	
	@RequestMapping("activate/{id}")
	public String activate(@PathVariable("id") String id){
		Session session = factory.getCurrentSession();
		Customer user = (Customer)session.get(Customer.class, id);
		user.setActivated(true);
		return "redirect:/account/login.php";
	}
	
	
	@RequestMapping("login")
	public String login(ModelMap model){
		return "user/account/login";
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(ModelMap model,
			@RequestParam("id")String id,@RequestParam("password")String pw,
			@RequestParam(value="remember", defaultValue="false") Boolean rm,
			HttpSession httpSession, HttpServletResponse response){
		Session session = factory.getCurrentSession();
		String url = "";
		try{
			Customer user = (Customer)session.get(Customer.class, id);
			if(!user.getPassword().equals(pw)){
				model.addAttribute("message", "Đăng nhập thất bại !");
				url = "user/account/login";
			}
			else if(!user.getActivated()){
				model.addAttribute("message", "Tài khoản chưa kích hoạt! Vui lòng check mail!");
				// gửi mail sau khi đăng kí
				try{
					MimeMessage mail = mailler.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(mail,"utf-8");
					helper.setFrom("hellonguyenquochuy@gmail.com","Nguyễn Quốc Huy");
					helper.setTo(user.getEmail());
					helper.setSubject("Welcome mail");
					// kích hoạt tài khoản
					String body = "<a href='http://localhost:9999/MimityStore/account/activate/"+user.getId()+".php'>Activate</a> your account !";
//					String body = "<a href='http://bootshop.mssql.somee.com/account/activate/"+user.getId()+".php'>Activate</a> your account !";
					helper.setText(body,true);
					helper.setReplyTo("hellonguyenquochuy@gmail.com");
					
					// bỏ vào bưu điện
					mailler.send(mail);
				}
				catch(Exception e){
				}
				url = "user/account/login";
			}
			else{
				model.addAttribute("message", "Đăng nhập thành công!");
				httpSession.setAttribute("user", user);
				
				// Ghi nhớ tài khoản bằng cookie
				Cookie chkId = new Cookie("uid", user.getId());
				Cookie chkPw = new Cookie("pwd", user.getPassword());
				if(rm==true){
					chkId.setMaxAge(30*24*60*60);
					chkPw.setMaxAge(30*24*60*60);
				}
				else{
					chkId.setMaxAge(0);
					chkPw.setMaxAge(0);
				}
				response.addCookie(chkId);
				response.addCookie(chkPw);
				
//				// kiểm tra sau khi đăng nhập xong --> để quay lại trang trước đó trước khi đăng nhập
//				if(httpSession.getAttribute("returnUrl") != null){
//					// nêu không có trở về
//					return "redirect:/" + httpSession.getAttribute("returnUrl");
//					
//				}
				url = "redirect:/user/home/index.php";
			}
		}
		catch(Exception e){
			model.addAttribute("message", "Sai tên đăng nhập!");
			url = "user/account/login";
		}
		return url;
	}
//	
	@RequestMapping("logoff")
	public String logoff(HttpSession httpSession){
		httpSession.removeAttribute("user");
		return "redirect:/user/home/index.php";
	}
//	
//	
	@RequestMapping("forgot")
	public String forgot() {
		return "user/account/forgot";
	}
//	
//	
	@RequestMapping(value="forgot",method=RequestMethod.POST)
	public String forgot(ModelMap model,
			@RequestParam("id")String id,@RequestParam("email")String email){
		Session session = factory.getCurrentSession();
		try{
			Customer user = (Customer)session.get(Customer.class, id);
			if(!user.getEmail().equals(email)){
				model.addAttribute("message", "Sai email!");
			}
			else{
				try{
					MimeMessage mail = mailler.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(mail,"utf-8");
					helper.setFrom("hellonguyenquochuy@gmail.com","Nguyễn Quốc Huy");
					helper.setTo(user.getEmail());
					helper.setSubject("Forgot password");
					// kích hoạt tài khoản
					String body = "Mật khẩu: " + user.getPassword();
					helper.setText(body,true);
					helper.setReplyTo("hellonguyenquochuy@gmail.com");
					
					// bỏ vào bưu điện
					mailler.send(mail);
					model.addAttribute("message", "Mật khẩu đã được gửi qua mail !");
				}
				catch(Exception e){
					model.addAttribute("message", "Gửi mail thất bại !");
				}
			}
		}
		catch(Exception e){
			model.addAttribute("message", "Sai tên đăng nhập!");
		}
		return "user/account/forgot";
	}
	
	@RequestMapping("change")
	public String change() {
		return "user/account/change";
	}
	
	@RequestMapping(value="change",method=RequestMethod.POST)
	public String change(ModelMap model,
			@RequestParam("id")String id,@RequestParam("password")String pw,
			@RequestParam("password1")String pw1,@RequestParam("password2")String pw2,
			HttpSession httpSession){
		Session session = factory.getCurrentSession();
		try{
			Customer user = (Customer)session.get(Customer.class, id);
			if(!user.getPassword().equals(pw)){
				model.addAttribute("message", "Sai mật khẩu!");
			}
			else if(!pw1.equals(pw2)){
				model.addAttribute("message", "Xác nhận mật khẩu không đúng!");
			}
			else{
				model.addAttribute("message", "Đổi mật khẩu thành công!");
				user.setPassword(pw1);
				httpSession.setAttribute("user", user);
			}
		}
		catch(Exception e){
			model.addAttribute("message", "Sai tên đăng nhập!");
		}
		return "user/account/change";
	}
	
	@RequestMapping("edit")
	public String edit(ModelMap model, HttpSession httpSession) {
		model.addAttribute("user", httpSession.getAttribute("user"));
		return "user/account/edit";
	}
	
	@RequestMapping(value="edit", method=RequestMethod.POST)
	public String edit(ModelMap model,  
			@ModelAttribute("user") @Validated Customer user,BindingResult errors,
			@RequestParam("upphoto") MultipartFile upphoto,
			HttpSession httpSession) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			errors.hasErrors();
			// Upload
			if(!upphoto.isEmpty()){
				user.setPhoto(upphoto.getOriginalFilename());
				String path = app.getRealPath("/images/customers/"+user.getPhoto());
				upphoto.transferTo(new File(path));
			}
			
			// Cập nhật
			session.update(user);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công !");
			httpSession.setAttribute("user", user);
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại !");
		}
		finally{
			session.close();
		}
		return "user/account/edit";
	}
	
}
