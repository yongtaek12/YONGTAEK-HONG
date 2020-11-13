package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/SearchResult.do")
	public String searchResultPage(String query, Model model) {
		model.addAttribute("query", query);
		return "SearchResult";
	}
}