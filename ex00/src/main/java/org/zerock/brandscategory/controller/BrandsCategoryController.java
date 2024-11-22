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
	
	// 1. 카테고리 리스트
	@GetMapping("/list.do")
	public String list(@RequestParam(defaultValue = "0") Integer brands_cate_code1, Model model) {
	
		log.info("brands_cate_code1 = " + brands_cate_code1);

		List<BrandsCategoryVO> listBig = service.list(0);
		
		
		if (brands_cate_code1 == 0 && (listBig != null && listBig.size() != 0)) {
			brands_cate_code1 = listBig.get(0).getBrands_cate_code1();
		}
		
		List<BrandsCategoryVO> listMid = service.list(brands_cate_code1);
		
		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);
		
		model.addAttribute("brands_cate_code1", brands_cate_code1);
		
		log.info("brands_cate_code1 = " + brands_cate_code1 );
		
		return "brandscategory/list";
	}
	
	
	
	// 2. 카테고리 등록

	@PostMapping("/write.do")
	public String write(BrandsCategoryVO vo, RedirectAttributes rttr) {
		service.write(vo);
		
		rttr.addFlashAttribute("msg", "카테고리가 등록 되었습니다.");
		
		return "redirect:list.do?brands_cate_code1=" + vo.getBrands_cate_code1();
	}
	
	// 3. 카테고리 수정
	@PostMapping("/update.do")
	public String update(BrandsCategoryVO vo, RedirectAttributes rttr) {
		
		Integer result = service.update(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("msg", "카테고리가 수정되었습니다.");
		}
		else {
			rttr.addFlashAttribute("msg", "카테고리가 수정되지 않았습니다.");
		}
		
		return "redirect:list.do?brands_cate_code1=" + vo.getBrands_cate_code1();
	}
	
	// 카테고리 삭제 처리
	@PostMapping("/delete.do")
	public String delete(BrandsCategoryVO vo, RedirectAttributes rttr) {
		
		Integer result = service.delete(vo);
		
		if (result >= 1) {
			rttr.addFlashAttribute("msg", "카테고리가 삭제되었습니다.");
		}
		else {
			rttr.addFlashAttribute("msg", "카테고리가 삭제되지 않았습니다.");
		}
		
		
		return "redirect:list.do?brands_cate_code1=" + vo.getBrands_cate_code1();
	}
	
	
}











