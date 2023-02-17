package kr.spring.main.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	

	@RequestMapping("/")
	public String main() {
		return "redirect:/main/main.do";
	}
	
	@RequestMapping("/main/main.do")
	public String main(Model model) {

		return "memberHome";//타일스 설정값
	}
	
	@RequestMapping("/main/admin.do")
	public String adminMain(Model model) {
		
		return "admin";
	}
	
}





