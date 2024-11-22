package org.zerock.myreview.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.member.vo.LoginVO;
import org.zerock.myreview.service.MyreviewService;
import org.zerock.myreview.vo.MyreviewVO;
import org.zerock.util.file.FileUtil;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/myreview")
public class MyreviewController {

	@Qualifier("myreviewServiceImpl")
	@Autowired
	private MyreviewService service;
	
	String path = "/upload/myreview";
	
	@GetMapping("/list.do")
	public String myList() {
		log.info("리뷰 페이지 호출됨!");
		
		return "myreview/list";
	}
	
	@GetMapping("/allList.do")
	public String list(HttpServletRequest request, Model model, MyreviewVO vo) {
	    
	    PageObject pageObject = PageObject.getInstance(request);
	    
		
	    model.addAttribute("list", service.list(pageObject));
	    model.addAttribute("pageObject", pageObject);
	    
	    return "myreview/allList";
	}
	
	@GetMapping("/writeForm.do")
	public String writeForm() {
		return "myreview/writeForm";
	}
	@PostMapping("/write.do")
	public String write(MultipartFile imageFile,
			HttpServletRequest request, MyreviewVO vo, HttpSession session, String id) throws Exception {
		
		if (id == null) {
			// 로그인정보 가져와 id 넣기
			LoginVO loginVO = (LoginVO) session.getAttribute("login");
			id = loginVO.getId();
			vo.setId(id);
		}
		
		vo.setFilename(FileUtil.upload(path, imageFile, request));
		
		// 비어있을때 들어가는 기본값 -> null로 변경
		if(vo.getFilename().equals("/upload/qna/noImage.jpg")) {
			vo.setFilename(null);
		}
        vo.setNo(1l);
		service.write(vo);
        
		return "redirect:/myreview/allList.do";
	}
}
