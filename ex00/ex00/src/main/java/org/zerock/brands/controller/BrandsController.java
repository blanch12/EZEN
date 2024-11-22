package org.zerock.brands.controller;

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
import org.zerock.brands.service.BrandsService;
import org.zerock.brands.vo.BrandsColorVO;
import org.zerock.brands.vo.BrandsImageVO;
import org.zerock.brands.vo.BrandsSearchVO;
import org.zerock.brands.vo.BrandsSizeVO;
import org.zerock.brands.vo.BrandsVO;
import org.zerock.brandscategory.vo.BrandsCategoryVO;
import org.zerock.util.file.FileUtil;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/brands")
public class BrandsController {

	@Autowired
	@Qualifier("brandsServiceImpl")
	private BrandsService service;

	String path = "/upload/brands"; // 업로드 경로 설정

	// 브랜드 목록 페이지
	@GetMapping("/list.do")
	public String list(Model model, @ModelAttribute(name = "brandsSearchVO") BrandsSearchVO brandsSearchVO,
			HttpServletRequest request) {

		// 페이지 객체 설정
		PageObject pageObject = PageObject.getInstance(request);
		List<BrandsCategoryVO> listBig = new ArrayList<BrandsCategoryVO>();

		// 페이지 당 표시할 개수 설정
		String perPageNum = request.getParameter("perPageNum");

		if (perPageNum == null) {
			pageObject.setPerPageNum(12); // 기본값 12
		} else {
			pageObject.setPerPageNum(Integer.parseInt(perPageNum));
		}

		// 브랜드 리스트 가져오기
		List<BrandsVO> list = new ArrayList<BrandsVO>();

		listBig = service.listbrandsCategory(0); // 대분류 카테고리 리스트
		list = service.list(pageObject, brandsSearchVO); // 브랜드 리스트

		log.info(list);
		log.info("brandsSearchVO = " + brandsSearchVO);

		// 선택된 대분류 카테고리에 따른 중분류 리스트
		if (brandsSearchVO.getBrands_cate_code1() != null && brandsSearchVO.getBrands_cate_code1() != 0) {
			log.info("brandsSearchVO.brands_cate_code1 = " + brandsSearchVO.getBrands_cate_code1());
			List<BrandsCategoryVO> listMid = new ArrayList<BrandsCategoryVO>();
			listMid = service.listbrandsCategory(brandsSearchVO.getBrands_cate_code1());
			model.addAttribute("listMid", listMid);
		}

		// 모델에 데이터 추가
		model.addAttribute("list", list);
		model.addAttribute("listBig", listBig);
		model.addAttribute("pageObject", pageObject);

		return "brands/list"; // 브랜드 목록 페이지 반환
	}

	// 상품 상세 보기
	@GetMapping("/view.do")
	public String view(Long brands_no, PageObject pageObject,
			@ModelAttribute(name = "brandsSearchVO") BrandsSearchVO brandsSearchVO, Model model) {

		// 상품 정보, 사이즈, 색상, 추가 이미지 정보 가져오기
		model.addAttribute("vo", service.view(brands_no));
		model.addAttribute("sizeList", service.sizeList(brands_no));
		model.addAttribute("colorList", service.colorList(brands_no));
		model.addAttribute("imageList", service.imageList(brands_no));

		return "brands/view"; // 상품 상세 페이지 반환
	}

	// 상품 등록 폼
	@GetMapping("/writeForm.do")
	public String writeForm(Model model) {

		List<BrandsCategoryVO> listBig = new ArrayList<BrandsCategoryVO>();
		List<BrandsCategoryVO> listMid = new ArrayList<BrandsCategoryVO>();

		// 대분류, 중분류 카테고리 리스트 가져오기
		listBig = service.listbrandsCategory(0);
		listMid = service.listbrandsCategory(listBig.get(0).getBrands_cate_code1()); // 첫 번째 대분류에 해당하는 중분류

		// 모델에 카테고리 데이터 추가
		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);

		return "brands/write"; // 상품 등록 폼 반환
	}

	// 중분류 가져오기 (AJAX)
	@GetMapping(value = "/getbrandsCategory.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BrandsCategoryVO>> getbrandsCategory(Integer brands_cate_code1) {

		// 중분류 카테고리 리스트 가져오기
		List<BrandsCategoryVO> listMid = new ArrayList<BrandsCategoryVO>();
		listMid = service.listbrandsCategory(brands_cate_code1);

		// 중분류 리스트를 JSON으로 반환
		return new ResponseEntity<List<BrandsCategoryVO>>(listMid, HttpStatus.OK);
	}

	// 상품 등록 처리
	@PostMapping("/write.do")
	public String write(BrandsVO vo,
			// 대표이미지
			MultipartFile imageMain,
			// 추가이미지
			@RequestParam("imageFiles") ArrayList<MultipartFile> imageFiles,
			// 옵션 - 사이즈, 색상
			@RequestParam("size_names") ArrayList<String> size_names,
			@RequestParam("color_names") ArrayList<String> color_names, HttpServletRequest request,
			RedirectAttributes rttr) throws Exception {

		// 상품 등록 처리
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

		// 대표이미지 업로드
		vo.setBrands_image_name(FileUtil.upload(path, imageMain, request));

		// 추가이미지 업로드
		List<String> imageFileNames = new ArrayList<String>();
		for (MultipartFile file : imageFiles) {
			imageFileNames.add(FileUtil.upload(path, file, request));
		}
		vo.setSale_price(vo.sale_price()); // 할인가격 설정
		Integer result = service.write(vo, imageFileNames, size_names, color_names); // 상품 등록

		rttr.addFlashAttribute("msg", "상품이 등록되었습니다."); // 성공 메시지 추가

		return "redirect:list.do"; // 목록 페이지로 리다이렉트
	}

	// 상품 수정 폼
	@GetMapping("/updateForm.do")
	public String updateForm(Long brands_no, @ModelAttribute(name = "pageObject") PageObject pageObject,
			@ModelAttribute(name = "brandsSearchVO") BrandsSearchVO brandsSearchVO, Model model) {
		List<BrandsCategoryVO> listBig = new ArrayList<BrandsCategoryVO>();
		List<BrandsCategoryVO> listMid = new ArrayList<BrandsCategoryVO>();

		// 대분류, 중분류 카테고리 리스트 가져오기
		listBig = service.listbrandsCategory(0);
		listMid = service.listbrandsCategory(listBig.get(0).getBrands_cate_code1());

		// 상품 상세 정보, 사이즈, 색상, 추가 이미지 정보 가져오기
		model.addAttribute("brandsVO", service.view(brands_no));
		model.addAttribute("sizeList", service.sizeList(brands_no));
		model.addAttribute("colorList", service.colorList(brands_no));
		model.addAttribute("imageList", service.imageList(brands_no));
		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);

		return "brands/update"; // 상품 수정 폼 반환
	}

	// 상품 수정 처리
	@PostMapping("/update.do")
	public String update(@ModelAttribute(name = "brandsVO") BrandsVO brandsVO,
			@RequestParam("size_names") ArrayList<String> size_names,
			@RequestParam("color_names") ArrayList<String> color_names, PageObject pageObject, RedirectAttributes rttr)
			throws Exception {

		// 상품 수정 처리
		log.info("update.do===========");
		log.info(brandsVO);
		log.info("size_names : " + size_names);
		log.info("color_names : " + color_names);

		// 상품 사이즈, 색상 수정
		brandsVO.setSale_price(brandsVO.sale_price()); // 할인가격 설정
		service.update(brandsVO, size_names, color_names); // 상품 업데이트

		return "redirect:view.do?brands_no=" + brandsVO.getBrands_no() + "&" + pageObject.getPageQuery(); // 상세 페이지로 리다이렉트
	}

	// 이미지 수정 처리
	@PostMapping("/updateImage.do")
	public String updateImage() {
		return "redirect:update.do?brands_no=";
	}

	// 이미지 삭제 처리
	@PostMapping("/deleteImage.do")
	public String deleteImage() {
		return "redirect:update.do?brands_no=";
	}
	
    // 상품 삭제 처리
    @PostMapping("/delete")
    public String delete(@RequestParam("brands_no") Long brands_no, RedirectAttributes rttr) {
        log.info("상품 삭제 요청 - 상품 번호: " + brands_no);

        int result = service.delete(brands_no); // 상품 삭제
        if (result > 0) {
            rttr.addFlashAttribute("msg", "상품이 성공적으로 삭제되었습니다."); // 성공 메시지
        } else {
            rttr.addFlashAttribute("msg", "상품 삭제에 실패했습니다."); // 실패 메시지
        }

        return "redirect:/brands/list.do"; // 삭제 후 목록 페이지로 리다이렉트
    }
}
