package com.light.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.light.shop.service.UserInfoService;


@Controller
public class UsreInfoController {

	@Autowired
	private UserInfoService userInfoService;
	
	@RequestMapping("/hello")
	public void hello(){
		System.out.println("6666");
	}
	
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	@RequestMapping("/products")
	public String product(){
		return "products";
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
    public String index(String name,Model model) {
        model.addAttribute("message", "hello");
        model.addAttribute("name", name);
        return "/user";
    }
}
