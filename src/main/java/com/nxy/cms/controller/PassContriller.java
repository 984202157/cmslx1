package com.nxy.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("passport")
@Controller
public class PassContriller {
	
	@RequestMapping("reg")
	public String red(){
		return "passport/reg";
	}
}
