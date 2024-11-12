package org.zerock.qna.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

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
import org.zerock.qna.mapper.QnaMapper;
import org.zerock.qna.service.QnaService;
import org.zerock.qna.vo.QnaVO;
import org.zerock.util.file.FileUtil;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna")
public class QnaController {

	@Qualifier("qnaServiceImpl")
	@Autowired
	private QnaService service;
	
	
	// 파일 저장 경로
	String path = "/upload/qna";
	
	@GetMapping("/list.do")
	public String list(Model model, HttpServletRequest request,HttpSession session) {
		
		PageObject pageObject = PageObject.getInstance(request);
		
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		
		
		if (loginVO != null && loginVO.getGradeNo() == 9) {
			// 관리자는 list 전체 볼 수 있음
			model.addAttribute("list", service.list(pageObject));
		}
		else if (loginVO != null) {
			// 일반 회원은 본인작성글만 확인가능
			model.addAttribute("list", service.ownList(pageObject, loginVO.getId()));
		}
		else {
			return "redirect:/member/loginForm.do";
		}
		model.addAttribute("pageObject", pageObject);
		
		
		
		return "qna/list";
	}
	
	@GetMapping("/view.do")
	public String view(Model model, Long no, QnaVO vo, HttpSession session) {
		
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		if (loginVO.getGradeNo() == 9) {
			// 관리자 열람시 처리상태 변경
			service.viewStatus(vo);
			model.addAttribute("vo", service.view(no));
		}
		else {
			model.addAttribute("vo", service.view(no));
		}
		return "qna/view";
	}
	
	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("qna/writeForm");
		
		return "qna/writeForm";
	}
	
	// QnA 글쓰기
	@PostMapping("/write.do")
	public String write(QnaVO vo, String writer,MultipartFile imageName, HttpServletRequest request,
			HttpSession session) throws Exception {

		if (writer == null) {
			// 로그인정보 가져와 writer에 id 넣기
			LoginVO loginVO = (LoginVO) session.getAttribute("login");
			writer = loginVO.getId();
			vo.setWriter(writer);
		}
		// QnaVO의 file 필드가 null이 아니고 비어 있지 않다면 파일 저장을 수행
		vo.setFilename(FileUtil.upload(path, imageName, request));
		service.write(vo);
		return "redirect:/qna/list.do";
	}
	
	// MultipartFile filename
	//vo.setFilename(FileUtil.upload(path, imageMain, request));
}
