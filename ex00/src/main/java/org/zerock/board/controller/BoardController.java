package org.zerock.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.board.service.BoardService;
import org.zerock.board.vo.BoardVO;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService service;

	// 1. 일반 게시판 리스트
	@GetMapping("/list.do")
	public String list(Model model, HttpServletRequest request) {

		log.info("list() =======");
		

		PageObject pageObject = PageObject.getInstance(request);
		
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		return "board/list";

	}
	
	// 2. 일반 게시판 글보기
	@GetMapping("/view.do")

	public String view(Model model, Long no, int inc) {
		log.info("view() ======");
		model.addAttribute("vo", service.view(no, inc));
		return "board/view";
	}
	
	// 3-1. 일반 게시판 글쓰기 폼

	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("writeForm() =======");
		//service.write();
		return "board/write";
	}
	
	// 3-2. 일반 게시판 글쓰기 처리
	@PostMapping("/write.do")
	public String write(BoardVO vo, RedirectAttributes rttr) {
		log.info("write() =======");
		
		service.write(vo);
		
		rttr.addFlashAttribute("msg", "일반게시판에 글등록이 되었습니다.");
		
		return "redirect:list.do";
	}
	
	// 4-1. 일반 게시판 글수정 폼
	@GetMapping("/updateForm.do")

	public String updateForm(Model model, Long no) {
		log.info("updateForm() ======== ");
		
		model.addAttribute("vo", service.view(no, 0));
		
		return "board/update";
	}
	
	// 4-1. 일반 게시판 글수정 처리
	@PostMapping("/update.do")
	public String update(BoardVO vo, RedirectAttributes rttr) {
		log.info("update() =========");
		log.info(vo);
		
		if (service.update(vo) == 1) {

			rttr.addFlashAttribute("msg",
				"일반 게시판" + vo.getNo() + "번 글이 수정되었습니다.");
		}
		else {

			rttr.addFlashAttribute("msg",
				"일반 게시판 글수정이 되지 않았습니다."
				+ "비밀번호가 맞지 않습니다."
				+ "다시 확인하시고 시도해 주세요.");
		}
		

		return "redirect:view.do?no=" + vo.getNo() + "&inc=0";
	}
	
	
	// 5. 일반 게시판 글삭제 처리
	@PostMapping("delete.do")
 	public String delete(BoardVO vo, RedirectAttributes rttr) {
		log.info("delete() =========");
		
		if (service.delete(vo) == 1) {

			rttr.addFlashAttribute("msg",
				"일반게시판 " + vo.getNo() + "번글이 삭제되었습니다." );
		

			return "redirect:list.do";
		}
		else {

			rttr.addFlashAttribute("msg",
				"일반게시판 글삭제가 되지 않았습니다."
				+ "비밀번호를 확인하시고 다시시도해 주세요");
		

			return "redirect:view.do?no=" + vo.getNo() + "&inc=0";
		}
	
	}
}










