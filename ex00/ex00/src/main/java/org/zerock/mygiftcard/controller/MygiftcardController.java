package org.zerock.mygiftcard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/mygiftcard")
public class MygiftcardController {

	@GetMapping("/list.do")
	public String reviewPage() {
	    log.info("리뷰 페이지 호출됨!");
	    return "mygiftcard/list";
	}
}
