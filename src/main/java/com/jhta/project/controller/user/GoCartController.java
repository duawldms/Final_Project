package com.jhta.project.controller.user;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GoCartController {
	@GetMapping(value="/user/gocart",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> gocart(@RequestParam(value="checkbox[]") List<String> checkbox,Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		for(String s:checkbox) {
			System.out.println(s);
		}
		map.put("result", "success");
		return map;
	}
}
