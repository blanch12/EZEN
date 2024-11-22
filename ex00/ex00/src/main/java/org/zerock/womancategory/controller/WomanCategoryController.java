package org.zerock.womancategory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.zerock.womancategory.service.WomanCategoryService;
import org.zerock.womancategory.vo.WomanCategoryVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/womancategory")
public class WomanCategoryController {

	@Autowired
	@Qualifier("womancategoryServiceImpl")
	private WomanCategoryService service;
	
	// 1. 카테고리 리스트 조회
	@GetMapping("/list.do")
	public String list(@RequestParam(defaultValue = "0") Integer woman_cate_code1, Model model) {
	
		// 선택된 대분류 코드 출력 (디버그용)
		log.info("woman_cate_code1 = " + woman_cate_code1);
		
		// 대분류 목록 조회
		List<WomanCategoryVO> listBig = service.list(0);
		
		// 대분류 코드가 0일 경우 첫 번째 대분류 코드로 초기화
		if (woman_cate_code1 == 0 && (listBig != null && listBig.size() != 0)) {
			woman_cate_code1 = listBig.get(0).getWoman_cate_code1();
		}
		
		// 선택된 대분류 코드에 해당하는 중분류 목록 조회
		List<WomanCategoryVO> listMid = service.list(woman_cate_code1);
		
		// 모델에 대분류 및 중분류 목록 추가
		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);
		
		// 현재 선택된 대분류 코드 전달
		model.addAttribute("woman_cate_code1", woman_cate_code1);
		
		// 대분류 코드 출력 (디버그용)
		log.info("woman_cate_code1 = " + woman_cate_code1 );
		
		// 카테고리 리스트 화면 반환
		return "womancategory/list";
	}
	
	// 2. 카테고리 등록 처리
	// 2-1. 카테고리 등록 폼 (리스트에서 모달창으로 처리)
	
	// 2-2. 카테고리 등록 처리
	@PostMapping("/write.do")
	public String write(WomanCategoryVO vo, RedirectAttributes rttr) {
		// 카테고리 등록 서비스 호출
		service.write(vo);
		
		// 카테고리 등록 후 메시지 전달
		rttr.addFlashAttribute("msg", "카테고리가 등록 되었습니다.");
		
		// 카테고리 등록 후 대분류 코드에 해당하는 카테고리 리스트로 리다이렉트
		return "redirect:list.do?woman_cate_code1=" + vo.getWoman_cate_code1();
	}
	
	// 3. 카테고리 수정 처리
	// 3-1. 카테고리 수정 폼 (리스트에서 모달창으로 처리)
	// 3-2. 카테고리 수정 처리
	@PostMapping("/update.do")
	public String update(WomanCategoryVO vo, RedirectAttributes rttr) {
		
		// 카테고리 수정 서비스 호출
		Integer result = service.update(vo);
		
		// 수정 결과에 따라 메시지 처리
		if (result == 1) {
			rttr.addFlashAttribute("msg", "카테고리가 수정되었습니다.");
		}
		else {
			rttr.addFlashAttribute("msg", "카테고리가 수정되지 않았습니다.");
		}
		
		// 수정 후 대분류 코드에 해당하는 카테고리 리스트로 리다이렉트
		return "redirect:list.do?woman_cate_code1=" + vo.getWoman_cate_code1();
	}
	
	// 카테고리 삭제 처리
	@PostMapping("/delete.do")
	public String delete(WomanCategoryVO vo, RedirectAttributes rttr) {
		
		// 카테고리 삭제 서비스 호출
		Integer result = service.delete(vo);
		
		// 삭제 결과에 따라 메시지 처리
		if (result >= 1) {
			// 대분류 삭제 시 중분류도 함께 삭제되므로 처리결과가 1 이상일 경우
			rttr.addFlashAttribute("msg", "카테고리가 삭제되었습니다.");
		}
		else {
			rttr.addFlashAttribute("msg", "카테고리가 삭제되지 않았습니다.");
		}
		
		// 삭제 후 대분류 코드에 해당하는 카테고리 리스트로 리다이렉트
		return "redirect:list.do?woman_cate_code1=" + vo.getWoman_cate_code1();
	}
	
}
