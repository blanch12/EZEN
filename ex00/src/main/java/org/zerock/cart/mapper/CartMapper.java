package org.zerock.cart.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.zerock.cart.vo.CartDTO;
import org.zerock.cart.vo.CartVO;
import org.zerock.util.page.PageObject;

@Mapper
public interface CartMapper {
	
    // 장바구니 리스트 페이지 처리를 위한 전체 데이터 개수를 가져온다.
    public int getTotalRow(PageObject pageObject);  // 반환 타입을 int로 수정
    
    // 장바구니 조회
    public List<CartVO> list(
    		@Param("pageObject") PageObject pageObject,
    		@Param("id") String id);

    // 장바구니에 상품 등록
    public void addToCart(CartDTO cartDTO);  // 반환 타입을 void로 수정

    // 장바구니에서 상품 삭제
    public Integer removeItems(@Param("cartNos") List<Long> cartNos);

    // 장바구니 비우기
    public void clearCart();  // 메소드 이름을 clearCart로 수정
	
}
