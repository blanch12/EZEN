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
	
	// 1. 카테고리 리스트
	@GetMapping("/list.do")
	public String list(@RequestParam(defaultValue = "0") Integer woman_cate_code1, Model model) {
	
		log.info("woman_cate_code1 = " + woman_cate_code1);
		
		List<WomanCategoryVO> listBig = service.list(0);
		
		
		
		if (woman_cate_code1 == 0 && (listBig != null && listBig.size() != 0)) {

			woman_cate_code1 = listBig.get(0).getWoman_cate_code1();
		}
		
		List<WomanCategoryVO> listMid = service.list(woman_cate_code1);
		

		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);
		
		model.addAttribute("woman_cate_code1", woman_cate_code1);
		
		log.info("woman_cate_code1 = " + woman_cate_code1 );
		
		return "womancategory/list";
	}
	
	
	
	// 2. 카테고리 등록
	// 2-1 카테고리 등록 폼
	// 등록항목이 분류명 밖에 없어서, 리스트에 모달창으로 처리합니다.
	
	// 2-2 카테고리 등록 처리
	@PostMapping("/write.do")
	public String write(WomanCategoryVO vo, RedirectAttributes rttr) {
		service.write(vo);
		
		// 카테고리 등록 후 메시지 표출
		rttr.addFlashAttribute("msg", "카테고리가 등록 되었습니다.");
		
		return "redirect:list.do?woman_cate_code1=" + vo.getWoman_cate_code1();
	}
	
	// 3. 카테고리 수정
	// 3-1. 카테고리 수정폼 - 리스트 모달창이용
	// 3-2. 카테고리 수정처리
	@PostMapping("/update.do")
	public String update(WomanCategoryVO vo, RedirectAttributes rttr) {
		
		Integer result = service.update(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("msg", "카테고리가 수정되었습니다.");
		}
		else {
			rttr.addFlashAttribute("msg", "카테고리가 수정되지 않았습니다.");
		}
		
		return "redirect:list.do?woman_cate_code1=" + vo.getWoman_cate_code1();
	}
	
	// 카테고리 삭제 처리
	@PostMapping("/delete.do")
	public String delete(WomanCategoryVO vo, RedirectAttributes rttr) {
		
		Integer result = service.delete(vo);
		
		if (result >= 1) {
			// 대분류가 삭제될때는 중분류도 같이 삭제가 되어서
			// 처리결과가 1이상의 값이 리턴됩니다.
			rttr.addFlashAttribute("msg", "카테고리가 삭제되었습니다.");
		}
		else {
			rttr.addFlashAttribute("msg", "카테고리가 삭제되지 않았습니다.");
		}
		
		
		return "redirect:list.do?woman_cate_code1=" + vo.getWoman_cate_code1();
	}
	
	
}











