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
import com.jhta.project.vo.user.InSearchOrdersVo;
import com.jhta.project.vo.user.OrdersDetailVo;
import com.jhta.project.vo.user.OrdersOptionVo;

@RestController
public class PurchaseSuccessController {
	@Autowired private SearchService service;
	
	@GetMapping(value="/user/purchase",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> purSuccess(Principal principal,String addr,@RequestParam(value="or_request",defaultValue = "")String or_request,
			int or_totalcost,String or_paymethod){
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<CartVo> cartlist=service.selectcart(principal.getName());
		try {
			if(cartlist.size()>0) {
				int or_num=service.incOrseq();
				map.put("or_num", or_num);
				InSearchOrdersVo orvo=new InSearchOrdersVo(or_num, principal.getName(),
						or_request, 0, 0, or_totalcost, addr, or_paymethod,null,0);
				System.out.println(orvo);
				service.insertOrders(orvo);
				for(int i=0;i<cartlist.size();i++) {
					CartVo cvo=cartlist.get(i);
					int od_num=service.incOdseq();
					OrdersDetailVo odvo=new OrdersDetailVo(od_num, or_num, cvo.getFood_num());
					service.insertOD(odvo);
					List<CartDetailVo> cdlist=service.selectcd(cvo.getCart_num());
					for(int j=0;j<cdlist.size();j++) {
						CartDetailVo cdvo=cdlist.get(j);
						OrdersOptionVo oovo=new OrdersOptionVo(0, od_num, cdvo.getFo_num(), cdvo.getCd_count());
						service.insertOO(oovo);
						service.deletecd(cdvo.getCart_num());
					}
					service.delcartnum(cvo.getCart_num());
				}
				map.put("or_num", or_num);
			}
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		map.put("result", "success");
		
		return map;
	}
}











