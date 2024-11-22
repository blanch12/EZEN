package org.zerock.goods.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.category.vo.CategoryVO;
import org.zerock.goods.service.GoodsService;
import org.zerock.goods.vo.GoodsSearchVO;
import org.zerock.goods.vo.GoodsVO;
import org.zerock.util.file.FileUtil;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    @Qualifier("goodsServiceImpl")
    private GoodsService service;
    
    // 파일이 저장될 경로
    String path = "/upload/goods";
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // 숫자 형식을 설정하여 쉼표가 포함된 숫자를 처리
        NumberFormat numberFormat = NumberFormat.getInstance();
        binder.registerCustomEditor(Integer.class, "price", new CustomNumberEditor(Integer.class, numberFormat, true));
    }
    
    @GetMapping("/list.do")
    public String list(Model model,
                       @ModelAttribute(name="goodsSearchVO") GoodsSearchVO goodsSearchVO,
                       HttpServletRequest request,
                       @RequestParam(value = "page", required = false) String page,
                       @RequestParam(value = "perPageNum", required = false) String perPageNum) {

        // PageObject 생성
        PageObject pageObject = PageObject.getInstance(request);

        // 빈 문자열을 검사하고, 값이 없을 때 기본값 설정
        int pageInt = (page != null && !page.isEmpty()) ? Integer.parseInt(page) : 1;
        int perPageNumInt = (perPageNum != null && !perPageNum.isEmpty()) ? Integer.parseInt(perPageNum) : 8;

        // PageObject에 페이지 정보 설정
        pageObject.setPage(pageInt);
        pageObject.setPerPageNum(perPageNumInt);

        List<CategoryVO> listBig = service.listCategory(0);
        List<GoodsVO> list = service.list(pageObject, goodsSearchVO);

        if (goodsSearchVO.getCate_code1() != null && goodsSearchVO.getCate_code1() != 0) {
            List<CategoryVO> listMid = service.listCategory(goodsSearchVO.getCate_code1());
            model.addAttribute("listMid", listMid);
        }

        model.addAttribute("list", list);
        model.addAttribute("listBig", listBig);
        model.addAttribute("pageObject", pageObject);

        return "goods/list";
    }
 
    // 상품 상세 보기
    @GetMapping("/view.do")
    public String view(
            @RequestParam("goods_no") Long goodsNo,
            @ModelAttribute(name = "pageObject") PageObject pageObject,
            @ModelAttribute(name = "goodsSearchVO") GoodsSearchVO goodsSearchVO,
            HttpSession session,
            Model model) {

        // 최근 본 상품 세션 저장
        @SuppressWarnings("unchecked")
        List<Long> recentlyViewed = (List<Long>) session.getAttribute("recentlyViewed");
        if (recentlyViewed == null) {
            recentlyViewed = new ArrayList<>();
        }
        if (!recentlyViewed.contains(goodsNo)) {
            recentlyViewed.add(goodsNo);
            session.setAttribute("recentlyViewed", recentlyViewed);
            System.out.println("최근 본 상품 추가: " + recentlyViewed);
        }

        // 기존 상세 정보 로직 유지
        model.addAttribute("vo", service.view(goodsNo));
        model.addAttribute("sizeList", service.sizeList(goodsNo));
        model.addAttribute("colorList", service.colorList(goodsNo));
        model.addAttribute("imageList", service.imageList(goodsNo));

        return "goods/view";
    }

    // 상품 등록 폼
    @GetMapping("/writeForm.do")
    public String writeForm(Model model) {
        List<CategoryVO> listBig = service.listCategory(0);
        List<CategoryVO> listMid = service.listCategory(listBig.get(0).getCate_code1());
        
        model.addAttribute("listBig", listBig);
        model.addAttribute("listMid", listMid);
        
        return "goods/write";
    }
    
    // 중분류 가져오기 
    @GetMapping(value = "/getCategory.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<CategoryVO>> getCategory(@RequestParam("cate_code1") Integer cate_code1) {
        List<CategoryVO> listMid = service.listCategory(cate_code1);
        return new ResponseEntity<>(listMid, HttpStatus.OK);
    }
    
    // 상품 등록 처리
    @PostMapping("/write.do")
    public String write(GoodsVO vo,
                        MultipartFile imageMain,
                        @RequestParam("imageFiles") ArrayList<MultipartFile> imageFiles,
                        @RequestParam("size_names") ArrayList<String> size_names,
                        @RequestParam("color_names") ArrayList<String> color_names,
                        HttpServletRequest request,
                        RedirectAttributes rttr) throws Exception {
        
        vo.setImage_name(FileUtil.upload(path, imageMain, request));
        List<String> imageFileNames = new ArrayList<>();
        for (MultipartFile file : imageFiles) {
            imageFileNames.add(FileUtil.upload(path, file, request));
        }
        
        vo.setSale_price(vo.sale_price());
        service.write(vo, imageFileNames, size_names, color_names);
        
        rttr.addFlashAttribute("msg", "상품이 등록되었습니다.");
        
        return "redirect:list.do";
    }
    
    // 상품 수정 폼
    @GetMapping("/updateForm.do")
    public String updateForm(Long goods_no,
                             @ModelAttribute(name="pageObject") PageObject pageObject,
                             @ModelAttribute(name="goodsSearchVO") GoodsSearchVO goodsSearchVO,
                             Model model) {
        
        List<CategoryVO> listBig = service.listCategory(0);
        List<CategoryVO> listMid = service.listCategory(listBig.get(0).getCate_code1());
        
        model.addAttribute("goodsVO", service.view(goods_no));
        model.addAttribute("sizeList", service.sizeList(goods_no));
        model.addAttribute("colorList", service.colorList(goods_no));
        model.addAttribute("imageList", service.imageList(goods_no));
        model.addAttribute("listBig", listBig);
        model.addAttribute("listMid", listMid);
        
        return "goods/update";
    }
    
    // 상품 수정 처리
    @PostMapping("/update.do")
    public String update(GoodsVO goodsVO,
                         @RequestParam("size_names") ArrayList<String> size_names,
                         @RequestParam("color_names") ArrayList<String> color_names,
                         PageObject pageObject,
                         RedirectAttributes rttr) throws Exception {
        
        goodsVO.setSale_price(goodsVO.sale_price());
        service.update(goodsVO, size_names, color_names);
        
        return "redirect:view.do?goods_no=" + goodsVO.getGoods_no() + "&" + pageObject.getPageQuery();
    }
    
    // 이미지 수정 처리
    @PostMapping("/updateImage.do")
    public String updateImage() {
        return "redirect:update.do?goods_no=";
    }
    
    // 상품 삭제 처리
    @PostMapping("/delete.do")
    public String delete(@RequestParam("goods_no") Long goodsNo, RedirectAttributes rttr) {
        service.delete(goodsNo);
        rttr.addFlashAttribute("msg", "상품이 삭제되었습니다.");
        return "redirect:/goods/list.do";
    }

}
