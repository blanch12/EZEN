package org.zerock.cart.service;

import java.util.List;

import org.zerock.cart.vo.CartDTO;
import org.zerock.cart.vo.CartVO;
import org.zerock.util.page.PageObject;

public interface CartService {

    // 1. 장바구니 조회
    // PageObject를 이용해 페이징 처리된 장바구니 목록을 반환
    // id는 사용자의 장바구니 항목을 구분하기 위한 값
    public List<CartVO> list(PageObject pageObject, String id);
    // DB의 Cart Table에서 해당 id의 장바구니 항목을 페이징 처리하여 가져오는 메소드

    // 2. 장바구니에 상품 추가
    // 여러 파라미터를 CartDTO 객체로 묶어서 받는 방식으로 장바구니에 상품 추가
    public void addToCart(CartDTO cartDTO);

    // 3. 장바구니에서 상품 삭제
    // cartNos는 삭제할 상품의 cart_no를 리스트로 받아 해당 상품들을 삭제
    public Integer removeItems(List<Long> cartNos);  // cart_no -> cartNo로 변수명 변경

    // 4. 장바구니 비우기
    // 사용자의 장바구니에 있는 모든 항목을 삭제
    // 필요시 특정 사용자 장바구니만 삭제하는 메소드로 변경 가능
    public void clearCart();  // 필요에 따라 clearUserCart()로 변경할 수 있음
	
}
