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
	
	
//	// 2. 장바구니 보기
//		public GoodsVO view(Long no, int inc);
//	
	// 3. 장바구니 추가
//		public void addItemToCart(CartVO cartItem) {
//	        // 동일한 상품이 장바구니에 이미 있으면 수량만 증가시킨다.
//	        for (CartVO existingItem : cartList) {
//	            if (existingItem.getGoods_no().equals(cartItem.getGoods_no())) {
//	                existingItem.setQuantity(existingItem.getQuantity() + cartItem.getQuantity());
//	                return;
//	            }
//	        }
//	        // 상품이 없으면 새로 추가
//	        cartList.add(cartItem);
//	    }
//		
//	// 4.장바구니에서 상품 삭제
//	    public void removeItemFromCart(Long goods_no) {
//	    	cartList.removeIf(item -> item.getGoods_no().equals(goods_no));
//	    }

