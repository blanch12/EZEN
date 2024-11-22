package org.zerock.category.controller;

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
import org.zerock.category.service.CategoryService;
import org.zerock.category.vo.CategoryVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/category")
public class CategoryController {

    // CategoryService를 주입받는다.
    @Autowired
    @Qualifier("categoryServiceImpl")
    private CategoryService service;
    
    // 1. 카테고리 리스트
    // 기본적으로 cate_code1을 0으로 설정하고, 이를 통해 대분류와 중분류 리스트를 가져온다.
    @GetMapping("/list.do")
    public String list(@RequestParam(defaultValue = "0") Integer cate_code1, Model model) {
        
        log.info("cate_code1 = " + cate_code1);
        
        // 대분류 목록을 가져온다.
        List<CategoryVO> listBig = service.list(0); // 대분류는 cate_code1이 0인 경우
        
        // 중분류 가져오기
        // cate_code1이 0일 경우, 첫 번째 대분류의 cate_code1을 가져와서 중분류를 조회한다.
        if (cate_code1 == 0 && (listBig != null && listBig.size() != 0)) {
            // listBig을 DB에서 가져올 때 cate_code1을 Asc정렬했기 때문에
            // 첫 번째 아이템이 가장 작은 cate_code1이다.
            cate_code1 = listBig.get(0).getCate_code1();
        }
        
        // 해당 대분류(cate_code1)에 해당하는 중분류 목록을 가져온다.
        List<CategoryVO> listMid = service.list(cate_code1);
        
        // 모델에 대분류와 중분류 목록, 그리고 선택된 cate_code1 값을 담아 뷰로 전달한다.
        model.addAttribute("listBig", listBig);
        model.addAttribute("listMid", listMid);
        model.addAttribute("cate_code1", cate_code1);
        
        log.info("cate_code1 = " + cate_code1);
        
        // "/WEB-INF/views/ + category/list + .jsp"로 렌더링
        return "category/list";
    }
    
    // 2. 카테고리 등록
    // 2-1 카테고리 등록 폼: 등록 항목이 분류명 밖에 없어서 모달창을 사용하여 처리
    // 2-2 카테고리 등록 처리
    @PostMapping("/write.do")
    public String write(CategoryVO vo, RedirectAttributes rttr) {
        // 카테고리 등록 서비스 호출
        service.write(vo);
        
        // 카테고리 등록 후 사용자에게 메시지를 보여주기 위해 redirect할 때 flashAttribute 추가
        rttr.addFlashAttribute("msg", "카테고리가 등록 되었습니다.");
        
        // 카테고리 등록 후, 해당 대분류에 대한 카테고리 리스트로 리다이렉트
        return "redirect:list.do?cate_code1=" + vo.getCate_code1();
    }
    
    // 3. 카테고리 수정
    // 3-1 카테고리 수정 폼: 리스트 모달창을 이용하여 수정 처리
    // 3-2 카테고리 수정 처리
    @PostMapping("/update.do")
    public String update(CategoryVO vo, RedirectAttributes rttr) {
        
        // 카테고리 수정 서비스 호출
        Integer result = service.update(vo);
        
        // 수정 결과에 따른 메시지를 설정
        if (result == 1) {
            rttr.addFlashAttribute("msg", "카테고리가 수정되었습니다.");
        } else {
            rttr.addFlashAttribute("msg", "카테고리가 수정되지 않았습니다.");
        }
        
        // 수정된 카테고리를 다시 해당 대분류 리스트로 리다이렉트
        return "redirect:list.do?cate_code1=" + vo.getCate_code1();
    }
    
    // 4. 카테고리 삭제 처리
    @PostMapping("/delete.do")
    public String delete(CategoryVO vo, RedirectAttributes rttr) {
        
        // 카테고리 삭제 서비스 호출
        Integer result = service.delete(vo);
        
        // 삭제 처리 결과에 따른 메시지 설정
        if (result >= 1) {
            // 대분류가 삭제될 경우 해당 중분류도 같이 삭제되므로 처리된 결과가 1 이상이 된다.
            rttr.addFlashAttribute("msg", "카테고리가 삭제되었습니다.");
        } else {
            rttr.addFlashAttribute("msg", "카테고리가 삭제되지 않았습니다.");
        }
        
        // 삭제 후 해당 대분류의 카테고리 목록으로 리다이렉트
        return "redirect:list.do?cate_code1=" + vo.getCate_code1();
    }
}
