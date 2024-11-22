package org.zerock.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.member.vo.LoginVO;
import org.zerock.qna.service.QnaService;
import org.zerock.qna.vo.QnaVO;
import org.zerock.util.file.FileUtil;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna")
public class QnaController {

	//서비스 선언
	@Qualifier("qnaServiceImpl")
	@Autowired
	private QnaService service;
	
	
	// 파일 저장 경로
	String path = "/upload/qna";
	
	// QNA 리스트
	@SuppressWarnings("unused")
	@GetMapping("/list.do")
	public String list(Model model,QnaVO vo, HttpServletRequest request,HttpSession session) {
		
		PageObject pageObject = PageObject.getInstance(request);
		
		// id, gradeNo - session에서 가져오기
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		String id = loginVO.getId();
		Integer gradeNo = loginVO.getGradeNo();
		model.addAttribute("id", id);
		model.addAttribute("gradeNo", gradeNo);
		
		model.addAttribute("list", service.list(pageObject));
		
		
		model.addAttribute("pageObject", pageObject);
		
		
		
		return "qna/list";
	}
	
	// QNA 글보기
	@GetMapping("/view.do")
	public String view(Model model, Long no, Long rno, QnaVO vo, HttpSession session) {
		
		// 로그인 정보 받기
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		if(loginVO == null) return "redirect:/member/loginForm.do";
		
		// service 실행후 id, gradeNo - model에 담기 (페이지처리를 위해)
		vo = service.view(no);
		if(vo.getAns() == 1) {
			model.addAttribute("rvo", service.view(vo.getRno()));
		}
		model.addAttribute("vo", service.view(no));
		model.addAttribute("id", loginVO.getId());
		model.addAttribute("gradeNo", loginVO.getGradeNo());
		
		return "qna/view";
	}
	
	// QNA 글쓰기 폼
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
		
		// 비어있을때 들어가는 기본값 -> null로 변경
		if(vo.getFilename().equals("/upload/qna/noImage.jpg")) {
			vo.setFilename(null);
		}
		if(vo.getSecret() == null) {
			vo.setSecret(0l);
		}
		
		service.write(vo);
		return "redirect:/qna/list.do";
	}
	
	// QnA 글수정 폼
	@GetMapping("/updateForm.do")
	public String updateForm(Long no, Model model, @ModelAttribute(name="pageObject") PageObject pageObject){
		log.info("/qna/updateForm.do");
		
		// 글 정보 가져와 model에 담기
		model.addAttribute("vo", service.view(no));
		return "/qna/updateForm";
	}
	
	// QNA 글수정 처리
	@PostMapping("/update.do")
	public String update(QnaVO vo, MultipartFile imageName, HttpServletRequest request,
			PageObject pageObject) throws Exception {
		
			// 파일이 있으면 새파일로, 없으면 기존 파일로
			if (imageName != null && !imageName.isEmpty()) {
		        vo.setFilename(FileUtil.upload(path, imageName, request));
		    } else {
		        // 새 파일이 없으면 기존 파일 경로 유지
		        vo.setFilename(service.view(vo.getNo()).getFilename());
		    }
			
			// 이미지가 없을때 filename = null 로 변경
			if(vo.getFilename().equals("/upload/qna/noImage.jpg")) {
				vo.setFilename(null);
			}
			
			if(vo.getSecret() == null) {
				vo.setSecret(0l);
			}
			log.info("=== filename = " + vo.getFilename() + "===========");
			service.update(vo);
			
		return "redirect:/qna/view.do?no="+vo.getNo()+"&"+pageObject.getPageQuery();
	}
	
	// QNA 글삭제 처리
	@PostMapping("/delete.do")
	public String delete(QnaVO vo, PageObject pageObject) throws Exception {
		
		service.delete(vo);
		return "redirect:/qna/list.do?"+pageObject.getPageQuery();
	}
	// MultipartFile filename
	//vo.setFilename(FileUtil.upload(path, imageMain, request));
	
	// QNA 답변 작성 폼
	@GetMapping("/writeReplyForm.do")
	public String writeReplyForm(Long no, Model model) {
		
		// 답변 작성할 글 보여주기
		model.addAttribute("vo", service.view(no));
		return "qna/writeReplyForm";
	}
	
	// QNA 답변 작성 처리
	@PostMapping("/writeReply.do")
	public String writeReply(String writer, HttpSession session, Long no,
			QnaVO vo, MultipartFile imageName, HttpServletRequest request) throws Exception {
		
		if (writer == null) {
			// 로그인정보 가져와 writer에 id 넣기
			LoginVO loginVO = (LoginVO) session.getAttribute("login");
			writer = loginVO.getId();
			vo.setWriter(writer);
		}
		vo.setParent_writer(service.view(no).getWriter());
		// QnaVO의 file 필드가 null이 아니고 비어 있지 않다면 파일 저장을 수행
		vo.setFilename(FileUtil.upload(path, imageName, request));
		if(vo.getFilename().equals("/upload/qna/noImage.jpg")) {
			vo.setFilename(null);
		}
		if(vo.getSecret() == null) {
			vo.setSecret(0l);
		}
		service.writeReply(vo);
		
		return "redirect:/qna/list.do";
	}
	
	// QNA 글 상태 처리(view안의 버튼)
	@GetMapping("/changeStatus.do")
	public String changeStatus (Model model, HttpServletRequest request,QnaVO vo,
			RedirectAttributes rttr) throws Exception {
		
		PageObject pageObject = PageObject.getInstance(request);
		
		model.addAttribute("vo", service.changeStatus(vo));
		
		rttr.addFlashAttribute("msg", "글 처리상태 변경 성공");
		
		return "redirect:view.do?no="+vo.getNo()+"&"+pageObject.getPageQuery();
	}
	
}
