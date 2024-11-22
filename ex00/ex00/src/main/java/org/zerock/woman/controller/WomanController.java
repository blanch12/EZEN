package org.zerock.woman.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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

	String path = "/upload/woman"; // 파일 업로드 경로

	// 상품 리스트 조회
	@GetMapping("/list.do")
	public String list(Model model, @ModelAttribute(name = "womanSearchVO") WomanSearchVO womanSearchVO,
			HttpServletRequest request) {

		// 페이지 객체 생성
		PageObject pageObject = PageObject.getInstance(request);
		List<WomanCategoryVO> listBig = new ArrayList<WomanCategoryVO>();

		// 페이지당 출력할 개수 설정
		String perPageNum = request.getParameter("perPageNum");
		if (perPageNum == null) {
			pageObject.setPerPageNum(8); // 기본 페이지당 8개
		} else {
			pageObject.setPerPageNum(Integer.parseInt(perPageNum));
		}

		List<WomanVO> list = new ArrayList<WomanVO>();

		// 대분류 카테고리 리스트 가져오기
		listBig = service.listwomanCategory(0);
		// 상품 리스트 조회
		list = service.list(pageObject, womanSearchVO);

		// 검색 필터에 따른 카테고리 중분류 처리
		if (womanSearchVO.getWoman_cate_code1() != null && womanSearchVO.getWoman_cate_code1() != 0) {
			List<WomanCategoryVO> listMid = new ArrayList<WomanCategoryVO>();
			listMid = service.listwomanCategory(womanSearchVO.getWoman_cate_code1());
			model.addAttribute("listMid", listMid);
		}

		// 모델에 데이터 추가
		model.addAttribute("list", list);
		model.addAttribute("listBig", listBig);
		model.addAttribute("pageObject", pageObject);

		return "woman/list"; // JSP 페이지
	}

	// 상품 상세보기
	@GetMapping("/view.do")
	public String view(Long woman_no, PageObject pageObject,

			@ModelAttribute(name = "womanSearchVO") WomanSearchVO womanSearchVO, Model model) {

		// 상품 상세 정보 조회
		model.addAttribute("vo", service.view(woman_no));

		// 상품 사이즈, 색상, 이미지 리스트 조회
		model.addAttribute("sizeList", service.sizeList(woman_no));
		model.addAttribute("colorList", service.colorList(woman_no));
		model.addAttribute("imageList", service.imageList(woman_no));

		return "woman/view"; // JSP 페이지
	}

	// 상품 등록 폼
	@GetMapping("/writeForm.do")
	public String writeForm(Model model) {

		List<WomanCategoryVO> listBig = new ArrayList<WomanCategoryVO>();
		List<WomanCategoryVO> listMid = new ArrayList<WomanCategoryVO>();

		// 대분류 카테고리 리스트 가져오기
		listBig = service.listwomanCategory(0);
		// 대분류 첫 번째에 해당하는 중분류 리스트 가져오기
		listMid = service.listwomanCategory(listBig.get(0).getWoman_cate_code1());

		// 모델에 카테고리 정보 추가
		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);

		return "woman/write"; // 상품 등록 폼 JSP 페이지
	}

	// 중분류 카테고리 리스트 가져오기
	@GetMapping(value = "/getwomanCategory.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<WomanCategoryVO>> getwomanCategory(Integer woman_cate_code1) {

		// 중분류 카테고리 리스트 조회
		List<WomanCategoryVO> listMid = new ArrayList<WomanCategoryVO>();
		listMid = service.listwomanCategory(woman_cate_code1);

		return new ResponseEntity<List<WomanCategoryVO>>(listMid, HttpStatus.OK); // JSON 응답
	}

	// 상품 등록 처리
	@PostMapping("/write.do")
	public String write(WomanVO vo,
			// 대표 이미지
			MultipartFile imageMain,
			// 추가 이미지
			@RequestParam("imageFiles") ArrayList<MultipartFile> imageFiles,
			// 사이즈, 색상 옵션
			@RequestParam("size_names") ArrayList<String> size_names,
			@RequestParam("color_names") ArrayList<String> color_names, HttpServletRequest request,
			RedirectAttributes rttr) throws Exception {

		// 파일 업로드 처리 및 로깅
		vo.setWoman_image_name(FileUtil.upload(path, imageMain, request));

		// 추가 이미지 파일 업로드 처리
		List<String> imageFileNames = new ArrayList<String>();
		for (MultipartFile file : imageFiles) {
			imageFileNames.add(FileUtil.upload(path, file, request));
		}

		// 가격 처리 및 상품 등록
		vo.setSale_price(vo.sale_price());
		Integer result = service.write(vo, imageFileNames, size_names, color_names);

		// 성공 메시지 플래시 속성 추가
		rttr.addFlashAttribute("msg", "상품이 등록되었습니다.");

		return "redirect:list.do"; // 리스트 페이지로 리다이렉트
	}

	// 상품 수정 폼
	@GetMapping("/updateForm.do")
	public String updateForm(Long woman_no, @ModelAttribute(name = "pageObject") PageObject pageObject,
			@ModelAttribute(name = "womanSearchVO") WomanSearchVO womanSearchVO, Model model) {

		List<WomanCategoryVO> listBig = new ArrayList<WomanCategoryVO>();
		List<WomanCategoryVO> listMid = new ArrayList<WomanCategoryVO>();

		// 대분류, 중분류 카테고리 리스트 조회
		listBig = service.listwomanCategory(0);
		listMid = service.listwomanCategory(listBig.get(0).getWoman_cate_code1());

		// 상품 상세 정보, 사이즈, 색상, 추가 이미지 정보 모델에 추가
		model.addAttribute("womanVO", service.view(woman_no));
		model.addAttribute("sizeList", service.sizeList(woman_no));
		model.addAttribute("colorList", service.colorList(woman_no));
		model.addAttribute("imageList", service.imageList(woman_no));
		model.addAttribute("listBig", listBig);
		model.addAttribute("listMid", listMid);

		return "woman/update"; // 상품 수정 폼 JSP 페이지
	}

	// 상품 수정 처리
	@PostMapping("/update.do")
	public String update(@ModelAttribute(name = "womanVO") WomanVO womanVO,
			@RequestParam("size_names") ArrayList<String> size_names,
			@RequestParam("color_names") ArrayList<String> color_names, PageObject pageObject, RedirectAttributes rttr)
			throws Exception {

		// 수정된 상품 정보 처리
		womanVO.setSale_price(womanVO.sale_price());
		service.update(womanVO, size_names, color_names);

		return "redirect:view.do?woman_no=" + womanVO.getWoman_no() + "&" + pageObject.getPageQuery(); // 수정된 상품 상세 페이지로 리다이렉트
	}

	// 이미지 수정 처리
	@PostMapping("/updateImage.do")
	public String updateImage() {
		return "redirect:update.do?woman_no="; // 이미지 수정 후 상품 수정 페이지로 리다이렉트
	}

	// 이미지 삭제 처리
	@PostMapping("/deleteImage.do")
	public String deleteImage() {
		return "redirect:update.do?woman_no="; // 이미지 삭제 후 상품 수정 페이지로 리다이렉트
	}
	
    // 상품 삭제 처리
    @PostMapping("/delete")
    public String delete(@RequestParam("woman_no") Long woman_no, RedirectAttributes rttr) {
        // 상품 삭제 요청 처리
        int result = service.delete(woman_no);
        if (result > 0) {
            rttr.addFlashAttribute("msg", "상품이 성공적으로 삭제되었습니다."); // 성공 메시지
        } else {
            rttr.addFlashAttribute("msg", "상품 삭제에 실패했습니다."); // 실패 메시지
        }

        return "redirect:/woman/list.do"; // 삭제 후 상품 리스트 페이지로 리다이렉트
    }
}
