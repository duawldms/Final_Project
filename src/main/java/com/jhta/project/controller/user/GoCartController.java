package com.jhta.project.controller.user;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.CartDetailVo;
import com.jhta.project.vo.user.CartVo;

@RestController
public class GoCartController {
	@Autowired private SearchService service;
	
	@GetMapping(value="/user/gocart",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> gocart(@RequestParam(value="checkbox[]",defaultValue = "") List<String> checkbox,
			@RequestParam(value="optionscnt[]",defaultValue = "") List<String> optionscnt,int foodnum,
			@RequestParam(value="necoptions[]",defaultValue = "") List<String> nec,Model model,Principal principal) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		try {
			String ui_id=principal.getName();
			CartVo cvo=new CartVo(0, ui_id, foodnum);
			service.insertcart(cvo);
			int seq=service.getcartseq();
			System.out.println(cvo);
			for(String s:nec) {
				CartDetailVo cdvo=new CartDetailVo(0,seq,Integer.parseInt(s),1);
				service.insertcartdetail(cdvo);
			}
			for(int i=0;i<checkbox.size();i++) {
				CartDetailVo cdvo=new CartDetailVo(0, seq, Integer.parseInt(checkbox.get(i)), Integer.parseInt(optionscnt.get(i)));
				service.insertcartdetail(cdvo);
				System.out.println(checkbox.get(i)+","+optionscnt.get(i));
			}
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		map.put("result", "success");	
		return map;
	}
}




