package org.zerock.brandscategory.controller;

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
import org.zerock.brandscategory.service.BrandsCategoryService;
import org.zerock.brandscategory.vo.BrandsCategoryVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/brandscategory")
public class BrandsCategoryController {

	@Autowired
	@Qualifier("brandscategoryServiceImpl")
	private BrandsCategoryService service;
	
	// 1. 카테고리 리스트 조회
	@GetMapping("/list.do")
	public String list(@RequestParam(defaultValue = "0") Integer brands_cate_code1, Model model) {
	
		log.info("brands_cate_code1 = " + brands_cate_code1);

		// 대분류 카테고리 리스트 가져오기
		List<BrandsCategoryVO> listBig = service.list(0);
		
		// 대분류 코드가 0일 경우 첫 번째 대분류 코드로 설정
		if (brands_cate_code1 == 0 && (listBig != null && listBig.size() != 0)) {
			brands_cate_code1 = listBig.get(0).getBrands_cate_code1();
		}
		
		// 선택된 대분류에 해당하는 중분류 카테고리 리스트 가져오기
		List<BrandsCategoryVO> listMid = service.list(brands_cate_code1);
		
		// 모델에 대분류, 중분류 리스트 및 선택된 대분류 코드 추가
		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);
		model.addAttribute("brands_cate_code1", brands_cate_code1);
		
		log.info("brands_cate_code1 = " + brands_cate_code1 );
		
		return "brandscategory/list"; // 카테고리 리스트 페이지 반환
	}
	
	// 2. 카테고리 등록
	@PostMapping("/write.do")
	public String write(BrandsCategoryVO vo, RedirectAttributes rttr) {
		// 카테고리 등록 서비스 호출
		service.write(vo);
		
		// 카테고리 등록 성공 메시지 전달
		rttr.addFlashAttribute("msg", "카테고리가 등록 되었습니다.");
		
		// 등록된 대분류 코드로 리스트 페이지로 리다이렉트
		return "redirect:list.do?brands_cate_code1=" + vo.getBrands_cate_code1();
	}
	
	// 3. 카테고리 수정
	@PostMapping("/update.do")
	public String update(BrandsCategoryVO vo, RedirectAttributes rttr) {
		
		// 카테고리 수정 서비스 호출
		Integer result = service.update(vo);
		
		// 수정 성공 여부에 따라 메시지 설정
		if (result == 1) {
			rttr.addFlashAttribute("msg", "카테고리가 수정되었습니다.");
		}
		else {
			rttr.addFlashAttribute("msg", "카테고리가 수정되지 않았습니다.");
		}
		
		// 수정된 대분류 코드로 리스트 페이지로 리다이렉트
		return "redirect:list.do?brands_cate_code1=" + vo.getBrands_cate_code1();
	}
	
	// 4. 카테고리 삭제 처리
	@PostMapping("/delete.do")
	public String delete(BrandsCategoryVO vo, RedirectAttributes rttr) {
		
		// 카테고리 삭제 서비스 호출
		Integer result = service.delete(vo);
		
		// 삭제 성공 여부에 따라 메시지 설정
		if (result >= 1) {
			rttr.addFlashAttribute("msg", "카테고리가 삭제되었습니다.");
		}
		else {
			rttr.addFlashAttribute("msg", "카테고리가 삭제되지 않았습니다.");
		}
		
		// 삭제된 대분류 코드로 리스트 페이지로 리다이렉트
		return "redirect:list.do?brands_cate_code1=" + vo.getBrands_cate_code1();
	}
}
