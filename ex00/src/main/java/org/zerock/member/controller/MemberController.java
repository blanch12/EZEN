package org.zerock.member.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.member.service.MemberService;
import org.zerock.member.vo.LoginVO;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member")
public class MemberController {

	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService service;
	
	// 로그인 폼
	@GetMapping("/loginForm.do")
	public String loginForm(HttpServletRequest request, HttpSession session) {
		log.info("========= loginForm.do ============");
		String referer = request.getHeader("Referer");
	    if (referer != null && !referer.contains("/loginForm.do")) { // 로그인 폼 페이지가 아닌 경우만 저장
	        session.setAttribute("prevPage", referer);
	    }
	    
		return "member/loginForm";
	}
	
	// 로그인 처리
	@PostMapping("/login.do")
	public String login(LoginVO vo,
			HttpSession session, RedirectAttributes rttr,Model model) {
		log.info("========= login.do =============");
		
		// DB에서 로그인 정보를 가져옵니다. - id, pw를 넘겨서
		LoginVO loginVO = service.login(vo);
		
		if (loginVO == null) {
			rttr.addFlashAttribute("msg",
				"로그인 정보가 맞지 않습니다.<br>정보를 확인하시고 다시 시도해 주세요");
			
			
			return "redirect:/member/loginForm.do";
		}
		// 로그인 정보를 찾았을때
		model.addAttribute("vo", service.conUpdate(loginVO.getId()));
		session.setAttribute("login", loginVO);
		rttr.addFlashAttribute("msg",
			loginVO.getName() + "님은 " + 
			loginVO.getGradeName() + "(으)로 로그인 되었습니다.");
		
		 // 이전 페이지로 리다이렉트
	    String prevPage = (String) session.getAttribute("prevPage");
	    session.removeAttribute("prevPage"); // 세션에서 제거하여 다시 사용되지 않도록 함
	    
	    return prevPage != null ? "redirect:" + prevPage : "redirect:/main/main.do"; // 이전 페이지가 없으면 기본 페이지로 이동
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request,
			RedirectAttributes rttr) {
		log.info("========= logout.do =============");
		
		session.removeAttribute("login");
		
		rttr.addFlashAttribute("msg",
				"로그 아웃이 되었습니다.<br>불편한 사항은 질문 답변 게시판을 이용해 주세요");
		
		// 이전 페이지 URL 가져오기
	    String referer = request.getHeader("Referer");
	    
	    // 이전 페이지로 리다이렉트, referer가 null일 경우 메인 페이지로 이동
	    return referer != null ? "redirect:" + referer : "redirect:/main/main.do";
	}
	
	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("writeForm()-------------------");
		return "member/writeForm";
	}
	
	@PostMapping("/write.do")
	public String write(LoginVO vo, RedirectAttributes rttr) {
		
		service.write(vo);
		
		rttr.addFlashAttribute("msg", "회원가입 완료");
		
		return "redirect:/main/main.do";
	}
	
	@GetMapping("/list.do")
	public String list(Model model, HttpServletRequest request) {
		
		log.info("list() =======");
		
		// 페이지 처리를 위한 객체 생성
		PageObject pageObject = PageObject.getInstance(request);
		// 1.
		//request.setAttribute("list", service.list());
		// 2. 처리된 데이터를 model 저장해서 넘긴다.
		// model에 담으면 request에 자동으로 담긴다.
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return "member/list";
	}
	
	@GetMapping("/view.do")
	public String view(Model model, String id, HttpSession session) {
		
		log.info("view() ======");
		
		if (id == null) {
			LoginVO loginVO = (LoginVO) session.getAttribute("login");
			id = loginVO.getId();
		}
		
		
		model.addAttribute("vo", service.view(id));
		
		return "member/view";
	}
	
	@GetMapping("/updateForm.do")
	public String updateForm(String id,Model model) {
		log.info("member/updateForm");
		model.addAttribute("vo", service.view(id));
		return "member/updateForm";
	}
	
	@PostMapping("/update.do")
	public String update(LoginVO vo, Model model,RedirectAttributes rttr) {
		log.info("/member/update.do");
		
		model.addAttribute("vo", service.update(vo));
		rttr.addFlashAttribute("msg", "회원정보 수정 완료");
		return "redirect:/member/view.do?id="+vo.getId();
	}
	
	@PostMapping("/delete.do")
	public String delete(LoginVO vo, Model model, RedirectAttributes rttr) {
		log.info("/member/delete.do");
		
		model.addAttribute("vo", service.delete(vo));
		
		rttr.addFlashAttribute("msg", "회원탈퇴 완료");
		return "redirect:/main/main.do";
	}
	
	@GetMapping("/changeStatus.do")
	public String changeStatus (Model model, HttpServletRequest request,LoginVO vo,
			RedirectAttributes rttr) throws Exception {
		
		PageObject pageObject = PageObject.getInstance(request);
		
		model.addAttribute("vo", service.changeStatus(vo));
		
		rttr.addFlashAttribute("msg", "회원 상태 변경 성공");
		
		return "redirect:list.do?" + pageObject.getPageQuery();
	}
	
	@GetMapping("/changeGradeNo.do")
	public String changeGradeNo (Model model, HttpServletRequest request,LoginVO vo,
			RedirectAttributes rttr) throws Exception {
		
		PageObject pageObject = PageObject.getInstance(request);
		
		model.addAttribute("vo", service.changeGradeNo(vo));
		
		rttr.addFlashAttribute("msg", "회원 등급 변경 성공");
		
		return "redirect:list.do?" + pageObject.getPageQuery();
	}
	
}






