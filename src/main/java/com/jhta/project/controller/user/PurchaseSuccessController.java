package com.jhta.project.controller.user;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.CartDetailVo;
import com.jhta.project.vo.user.CartVo;

@RestController
public class PurchaseSuccessController {
	@Autowired private SearchService service;
	
	@GetMapping(value="/user/purchase",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> purSuccess(Principal principal,String addr,@RequestParam(value="or_request",defaultValue = "")String or_request,
			int or_totalcost,String or_paymethod){
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<CartVo> cartlist=service.selectcart(principal.getName());
		if(cartlist.size()>0) {
			int or_num=service.incOrseq();
			
			for(int i=0;i<cartlist.size();i++) {
				CartVo cvo=cartlist.get(i);
				
				List<CartDetailVo> cdlist=service.selectcd(cvo.getCart_num());
				for(int j=0;j<cdlist.size();j++) {
					CartDetailVo cdvo=cdlist.get(j);
					
				}
			}
		}
		map.put("result", "success");
		map.put("cartlist", cartlist);
		return map;
	}
}











