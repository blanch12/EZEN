package org.zerock.cart.service;

import java.util.List;

import org.zerock.cart.vo.CartDTO;
import org.zerock.cart.vo.CartVO;
import org.zerock.util.page.PageObject;

public interface CartService {

	
    // 1. 장바구니 조회
    // PageObject를 이용해 페이징 처리된 장바구니 목록을 반환
    public List<CartVO> list(PageObject pageObjec, String id);
    // DB Cart Table 을 가지고 리스트 쿼리 처리해서 데이터 가져오기(Return)

    // 2. 장바구니에 상품 추가
    // 여러 파라미터를 CartDTO로 묶어 받는 방식으로 개선
    public void addToCart(CartDTO cartDTO);

    // 3. 장바구니에서 상품 삭제
    // cart_no로 상품을 삭제
    public Integer removeItems(List<Long> cartNos);  // cart_no -> cartNo로 변수명 변경

    // 4. 장바구니 비우기
    // 장바구니에 있는 모든 항목을 삭제
    public void clearCart();  // 필요한 경우 clearUserCart()로 변경할 수 있음
	
	
}
	
	

