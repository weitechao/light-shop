package com.light.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import RespCode.RespCode;

import com.light.shop.exception.BizException;
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
	public String index(Model m){
		m.addAttribute("name", "heool");
		
		return "index";
	}
	@RequestMapping("/products")
	public String product(){
		return "products";
	}
	@ResponseBody
	@RequestMapping(value = "/user", method = RequestMethod.GET)
    public String index(String name,Model model) {
        model.addAttribute("message", "hello");
        model.addAttribute("name", name);
        int a = 0;
		if(a == 0)
		throw new BizException(200,"ddd");
        return "66";
    }
}
