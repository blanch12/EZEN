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

	String path = "/upload/brands";

	@GetMapping("/list.do")

	public String list(Model model, @ModelAttribute(name = "brandsSearchVO") BrandsSearchVO brandsSearchVO,
			HttpServletRequest request) {

		PageObject pageObject = PageObject.getInstance(request);
		List<BrandsCategoryVO> listBig = new ArrayList<BrandsCategoryVO>();

		String perPageNum = request.getParameter("perPageNum");

		if (perPageNum == null) {
			pageObject.setPerPageNum(12);
		} else {
			pageObject.setPerPageNum(Integer.parseInt(perPageNum));
		}

		List<BrandsVO> list = new ArrayList<BrandsVO>();

		listBig = service.listbrandsCategory(0);
		list = service.list(pageObject, brandsSearchVO);

		log.info(list);
		log.info("brandsSearchVO = " + brandsSearchVO);
		if (brandsSearchVO.getBrands_cate_code1() != null && brandsSearchVO.getBrands_cate_code1() != 0) {
			log.info("brandsSearchVO.brands_cate_code1 = " + brandsSearchVO.getBrands_cate_code1());
			List<BrandsCategoryVO> listMid = new ArrayList<BrandsCategoryVO>();
			listMid = service.listbrandsCategory(brandsSearchVO.getBrands_cate_code1());
			model.addAttribute("listMid", listMid);
		}

		model.addAttribute("list", list);
		model.addAttribute("listBig", listBig);
		model.addAttribute("pageObject", pageObject);

		return "brands/list";
	}

	// 상품 상세 보기
	@GetMapping("/view.do")
	public String view(Long brands_no, PageObject pageObject,
			@ModelAttribute(name = "brandsSearchVO") BrandsSearchVO brandsSearchVO, Model model) {

		// 상품의 상세정보 가져오기 (상품정보 + 가격정보)
		model.addAttribute("vo", service.view(brands_no));
		// 사이즈 정보 리스트
		model.addAttribute("sizeList", service.sizeList(brands_no));
		// 색상 정보 리스트
		model.addAttribute("colorList", service.colorList(brands_no));
		// 추가 이미지 정보 리스트
		model.addAttribute("imageList", service.imageList(brands_no));

		return "brands/view";
	}

	// 상품 등록 폼
	@GetMapping("/writeForm.do")
	public String writeForm(Model model) {

		List<BrandsCategoryVO> listBig = new ArrayList<BrandsCategoryVO>();
		List<BrandsCategoryVO> listMid = new ArrayList<BrandsCategoryVO>();

		listBig = service.listbrandsCategory(0);
		// 대분류 첫번째에 있는 중분류를 가져온다.
		listMid = service.listbrandsCategory(listBig.get(0).getBrands_cate_code1());

		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);

		return "brands/write";
	}

	// 중분류 가져오기
	@GetMapping(value = "/getbrandsCategory.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BrandsCategoryVO>> getbrandsCategory(Integer brands_cate_code1) {

		List<BrandsCategoryVO> listMid = new ArrayList<BrandsCategoryVO>();

		listMid = service.listbrandsCategory(brands_cate_code1);

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

		vo.setBrands_image_name(FileUtil.upload(path, imageMain, request));

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
	public String updateForm(Long brands_no, @ModelAttribute(name = "pageObject") PageObject pageObject,
			@ModelAttribute(name = "brandsSearchVO") BrandsSearchVO brandsSearchVO, Model model) {
		List<BrandsCategoryVO> listBig = new ArrayList<BrandsCategoryVO>();
		List<BrandsCategoryVO> listMid = new ArrayList<BrandsCategoryVO>();

		listBig = service.listbrandsCategory(0);
		listMid = service.listbrandsCategory(listBig.get(0).getBrands_cate_code1());

		// 상품의 상세정보 가져오기 (상품정보 + 가격정보)
		model.addAttribute("brandsVO", service.view(brands_no));
		// 사이즈 정보 리스트
		model.addAttribute("sizeList", service.sizeList(brands_no));
		// 색상 정보 리스트
		model.addAttribute("colorList", service.colorList(brands_no));
		// 추가 이미지 정보 리스트
		model.addAttribute("imageList", service.imageList(brands_no));
		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);

		return "brands/update";
	}

	// 상품 수정 처리
	@PostMapping("/update.do")
	public String update(@ModelAttribute(name = "brandsVO") BrandsVO brandsVO,
			@RequestParam("size_names") ArrayList<String> size_names,
			@RequestParam("color_names") ArrayList<String> color_names, PageObject pageObject, RedirectAttributes rttr)
			throws Exception {

		log.info("update.do===========");
		// 상품 상세 정보 수정
		log.info(brandsVO);
		// log.info(goodsSearchVO);
		// 상품 사이즈 수정 => 기존정보 삭제 => 추가
		log.info("size_names : " + size_names);
		// 상품 컬러 수정 => 기본정보 삭제 => 추가
		log.info("color_names : " + color_names);
		// 할인가격 세팅
		brandsVO.setSale_price(brandsVO.sale_price());
		service.update(brandsVO, size_names, color_names);

		return "redirect:view.do?brands_no=" + brandsVO.getBrands_no() + "&" + pageObject.getPageQuery();

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

        int result = service.delete(brands_no);
        if (result > 0) {
            rttr.addFlashAttribute("msg", "상품이 성공적으로 삭제되었습니다.");
        } else {
            rttr.addFlashAttribute("msg", "상품 삭제에 실패했습니다.");
        }

        return "redirect:/brands/list.do"; // 삭제 후 리스트 페이지로 리다이렉트
    }
	
	
}
