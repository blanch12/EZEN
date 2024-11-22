package org.zerock.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.cart.service.CartService;
import org.zerock.cart.vo.CartDTO;
import org.zerock.cart.vo.CartVO;
import org.zerock.member.vo.LoginVO;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart")
@Log4j
public class CartController {

	@Autowired
	@Qualifier("cartServiceImpl")
    private CartService cartService;

	// 1. 장바구니 리스트 조회
	@GetMapping("/list.do")
    public String list(Model model, HttpServletRequest request, HttpSession session) {
        log.info("list() =======");

        // 세션에서 로그인된 사용자 아이디를 가져오기
        LoginVO loginVO = (LoginVO) session.getAttribute("login");  // 로그인된 사용자 정보
        
        String id = loginVO.getId();
         
        // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        if (id == null) {
            log.warn("사용자가 로그인되지 않았습니다.");
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }
        
        // 페이지 처리를 위한 객체 생성
        PageObject pageObject = PageObject.getInstance(request);
        
        // 로그인된 사용자 아이디에 맞는 장바구니 목록 조회
        List<CartVO> cartList = cartService.list(pageObject, id);
        
        // 모델에 장바구니 리스트와 페이지 정보 추가
        model.addAttribute("list", cartList);
        model.addAttribute("pageObject", pageObject);
        
        log.info("cart list.do --- end ");
        
        return "cart/list";  // 장바구니 리스트 화면으로 이동
    }
	
    // 2. 장바구니에 상품 추가
    @PostMapping("/add")
    public String addToCart(
    	@RequestParam("goods_no") int goodsNo,
        @RequestParam("goods_name") String goodsName,
        @RequestParam("image_name") String imageName,
        @RequestParam("sale_price") int salePrice,
        @RequestParam("delivery_charge") int deliveryCharge,
        @RequestParam("quantity") int quantity,
        HttpSession session) {

        // 로그인 정보 가져오기
        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        // 로그인 상태 확인
        if (loginVO == null) {
            return "redirect:/member/loginForm.do"; // 로그인 안 되어 있으면 로그인 페이지로 리다이렉트
        }

        // 로그인된 사용자 아이디
        String id = loginVO.getId();

        // CartDTO 객체 생성하여 장바구니 상품 정보 설정
        CartDTO cartDTO = new CartDTO();
        cartDTO.setId(id);
        cartDTO.setGoodsno(goodsNo);
        cartDTO.setGoodsname(goodsName);
        cartDTO.setImagename(imageName);
        cartDTO.setSaleprice(salePrice);
        cartDTO.setDeliverycharge(deliveryCharge);
        cartDTO.setQuantity(quantity);

        // 서비스 호출하여 장바구니에 상품 추가
        cartService.addToCart(cartDTO);

        return "redirect:/cart/list.do"; // 장바구니 목록 페이지로 리다이렉트
    }

    // 3. 선택한 상품들 삭제 처리
    @ResponseBody
    @PostMapping(value = "/removeItems",
    		produces = {
    				MediaType.APPLICATION_JSON_UTF8_VALUE
    		})
    public ResponseEntity<Map<String, Object>> removeItems(@RequestBody Map<String, List<Long>> body) {

        Map<String, Object> response = new HashMap<String, Object>();
        log.info(body);
        
        // 삭제할 상품들의 cartNo 리스트 받아오기
        List<Long> cartNos = body.get("cartNos");
     
        try {
            // CartService에서 삭제 처리
            Integer result = cartService.removeItems(cartNos);
            if (result != null && result != 0) response.put("success", true); // 삭제 성공 시
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false); // 삭제 실패 시
            response.put("error", e.getMessage()); // 에러 메시지 반환
        }
        
        return new ResponseEntity<Map<String,Object>>(response, HttpStatus.OK); // JSON 형식으로 응답 반환
    }

    // 4. 장바구니 비우기
    @PostMapping("/clear")
    public String clearCart() {
        // 장바구니 비우기 서비스 호출
        cartService.clearCart();
        return "redirect:/cart/list.do"; // 장바구니 비운 후 장바구니 목록으로 리다이렉트
    }
	
}
