package org.zerock.woman.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.zerock.util.file.FileUtil;
import org.zerock.util.page.PageObject;
import org.zerock.woman.service.WomanService;
import org.zerock.woman.vo.WomanSearchVO;
import org.zerock.woman.vo.WomanVO;
import org.zerock.womancategory.vo.WomanCategoryVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/woman")
public class WomanController {

	@Autowired
	@Qualifier("womanServiceImpl")
	private WomanService service;

	String path = "/upload/woman";

	@GetMapping("/list.do")
	public String list(Model model, @ModelAttribute(name = "womanSearchVO") WomanSearchVO womanSearchVO,
			HttpServletRequest request) {

		PageObject pageObject = PageObject.getInstance(request);
		List<WomanCategoryVO> listBig = new ArrayList<WomanCategoryVO>();

		String perPageNum = request.getParameter("perPageNum");

		if (perPageNum == null) {
			pageObject.setPerPageNum(8);
		} else {
			pageObject.setPerPageNum(Integer.parseInt(perPageNum));
		}

		List<WomanVO> list = new ArrayList<WomanVO>();

		listBig = service.listwomanCategory(0);
		list = service.list(pageObject, womanSearchVO);

		log.info(list);
		log.info("womanSearchVO = " + womanSearchVO);
		if (womanSearchVO.getWoman_cate_code1() != null && womanSearchVO.getWoman_cate_code1() != 0) {
			log.info("womanSearchVO.woman_cate_code1 = " + womanSearchVO.getWoman_cate_code1());
			List<WomanCategoryVO> listMid = new ArrayList<WomanCategoryVO>();
			listMid = service.listwomanCategory(womanSearchVO.getWoman_cate_code1());
			model.addAttribute("listMid", listMid);
		}

		model.addAttribute("list", list);
		model.addAttribute("listBig", listBig);
		model.addAttribute("pageObject", pageObject);

		return "woman/list";
	}

	@GetMapping("/view.do")
	public String view(Long woman_no, PageObject pageObject,

			@ModelAttribute(name = "womanSearchVO") WomanSearchVO womanSearchVO, Model model) {

		model.addAttribute("vo", service.view(woman_no));

		model.addAttribute("sizeList", service.sizeList(woman_no));

		model.addAttribute("colorList", service.colorList(woman_no));

		model.addAttribute("imageList", service.imageList(woman_no));

		return "woman/view";
	}

	// 상품 등록 폼
	@GetMapping("/writeForm.do")
	public String writeForm(Model model) {

		List<WomanCategoryVO> listBig = new ArrayList<WomanCategoryVO>();
		List<WomanCategoryVO> listMid = new ArrayList<WomanCategoryVO>();

		listBig = service.listwomanCategory(0);
		// 대분류 첫번째에 있는 중분류를 가져온다.
		listMid = service.listwomanCategory(listBig.get(0).getWoman_cate_code1());

		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);

		return "woman/write";
	}

	// 중분류 가져오기
	@GetMapping(value = "/getwomanCategory.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<WomanCategoryVO>> getwomanCategory(Integer woman_cate_code1) {

		List<WomanCategoryVO> listMid = new ArrayList<WomanCategoryVO>();

		listMid = service.listwomanCategory(woman_cate_code1);

		return new ResponseEntity<List<WomanCategoryVO>>(listMid, HttpStatus.OK);
	}

	// 상품 등록 처리
	@PostMapping("/write.do")
	public String write(WomanVO vo,
			// 대표이미지
			MultipartFile imageMain,
			// 추가이미지
			@RequestParam("imageFiles") ArrayList<MultipartFile> imageFiles,
			// 옵션 - 사이즈, 색상
			@RequestParam("size_names") ArrayList<String> size_names,
			@RequestParam("color_names") ArrayList<String> color_names, HttpServletRequest request,
			RedirectAttributes rttr) throws Exception {

		log.info("============write.do=================");
		log.info(vo);
		log.info("대표이미지 : " + imageMain.getOriginalFilename());
		log.info("<<추가이미지>>");
		for (MultipartFile file : imageFiles) {
			log.info(file.getOriginalFilename());
		}
		log.info("size : " + size_names);
		log.info("color : " + color_names);
		log.info("=====================================");

		// 추가이미지, size, color를 담을 리스트들을 만든다.

		vo.setWoman_image_name(FileUtil.upload(path, imageMain, request));

		List<String> imageFileNames = new ArrayList<String>();
		for (MultipartFile file : imageFiles) {
			imageFileNames.add(FileUtil.upload(path, file, request));
		}
		vo.setSale_price(vo.sale_price());
		Integer result = service.write(vo, imageFileNames, size_names, color_names);

		rttr.addFlashAttribute("msg", "상품이 등록되었습니다.");

		return "redirect:list.do";
	}

	// 상품 수정 폼
	@GetMapping("/updateForm.do")
	public String updateForm(Long woman_no, @ModelAttribute(name = "pageObject") PageObject pageObject,
			// @ModelAttribute()를 선언하면 선언된 객체를 model에 담는다. -> JSP전달
			@ModelAttribute(name = "womanSearchVO") WomanSearchVO womanSearchVO, Model model) {
		List<WomanCategoryVO> listBig = new ArrayList<WomanCategoryVO>();
		List<WomanCategoryVO> listMid = new ArrayList<WomanCategoryVO>();

		listBig = service.listwomanCategory(0);
		// 대분류 첫번째에 있는 중분류를 가져온다.
		listMid = service.listwomanCategory(listBig.get(0).getWoman_cate_code1());

		// 상품의 상세정보 가져오기 (상품정보 + 가격정보)
		model.addAttribute("womanVO", service.view(woman_no));
		// 사이즈 정보 리스트
		model.addAttribute("sizeList", service.sizeList(woman_no));
		// 색상 정보 리스트
		model.addAttribute("colorList", service.colorList(woman_no));
		// 추가 이미지 정보 리스트
		model.addAttribute("imageList", service.imageList(woman_no));
		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);

		return "woman/update";
	}

	// 상품 수정 처리
	@PostMapping("/update.do")
	public String update(@ModelAttribute(name = "womanVO") WomanVO womanVO,
			@RequestParam("size_names") ArrayList<String> size_names,
			@RequestParam("color_names") ArrayList<String> color_names, PageObject pageObject, RedirectAttributes rttr)
			throws Exception {

		log.info("update.do===========");
		// 상품 상세 정보 수정
		log.info(womanVO);
		// log.info(goodsSearchVO);
		// 상품 사이즈 수정 => 기존정보 삭제 => 추가
		log.info("size_names : " + size_names);
		// 상품 컬러 수정 => 기본정보 삭제 => 추가
		log.info("color_names : " + color_names);
		// 할인가격 세팅
		womanVO.setSale_price(womanVO.sale_price());
		service.update(womanVO, size_names, color_names);

		return "redirect:view.do?woman_no=" + womanVO.getWoman_no() + "&" + pageObject.getPageQuery();
		

	}

	// 이미지 수정 처리
	@PostMapping("/updateImage.do")
	public String updateImage() {
		return "redirect:update.do?woman_no=";
	}

	// 이미지 삭제 처리
	@PostMapping("/deleteImage.do")
	public String deleteImage() {
		return "redirect:update.do?woman_no=";
	}
	
    // 상품 삭제 처리
    @PostMapping("/delete")
    public String delete(@RequestParam("woman_no") Long woman_no, RedirectAttributes rttr) {
        log.info("상품 삭제 요청 - 상품 번호: " + woman_no);

        int result = service.delete(woman_no);
        if (result > 0) {
            rttr.addFlashAttribute("msg", "상품이 성공적으로 삭제되었습니다.");
        } else {
            rttr.addFlashAttribute("msg", "상품 삭제에 실패했습니다.");
        }

        return "redirect:/woman/list.do"; // 삭제 후 리스트 페이지로 리다이렉트
    }
	
	
}
