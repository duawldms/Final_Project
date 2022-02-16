package com.jhta.project.controller.user;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.Greeting;
import com.jhta.project.vo.user.HelloMessage;
import com.jhta.project.vo.user.InSearchOrdersVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OrderMessengerController {
	private final SimpMessagingTemplate messagingTemplate;
	@Autowired private SearchService service;
	@MessageMapping("/order")
	public void greeting(HelloMessage message,Principal principal) throws Exception {
		String name=principal.getName();
		String r_id=service.getRidOrnum(message.getOr_num());
		messagingTemplate.convertAndSend("/topic/"+r_id, new Greeting(message.getOr_num(),0));
	}
	@MessageMapping("/callback")
	public void callback(HelloMessage message,Principal principal) {
		InSearchOrdersVo vo=service.getOrder(message.getOr_num());
		messagingTemplate.convertAndSend("/topic/"+vo.getUi_id(),new Greeting(message.getOr_num(),message.getDeltime()));
	}
}






