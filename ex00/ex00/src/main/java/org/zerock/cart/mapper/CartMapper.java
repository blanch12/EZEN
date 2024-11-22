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
    // pageObject를 사용하여 전체 데이터 수를 반환
    public int getTotalRow(PageObject pageObject);  // 반환 타입을 int로 수정
    
    // 장바구니 조회
    // 사용자의 장바구니 데이터를 페이지 객체와 아이디를 이용해 조회
    public List<CartVO> list(
            @Param("pageObject") PageObject pageObject,  // 페이지 정보
            @Param("id") String id);  // 사용자 아이디

    // 장바구니에 상품 등록
    // 장바구니에 상품을 추가하는 메소드, CartDTO 객체를 이용해 상품 정보를 전달
    public void addToCart(CartDTO cartDTO);  // 반환 타입을 void로 수정

    // 장바구니에서 상품 삭제
    // 삭제할 상품의 cartNos 리스트를 받아서 해당 항목들을 장바구니에서 제거
    public Integer removeItems(@Param("cartNos") List<Long> cartNos);

    // 장바구니 비우기
    // 사용자의 모든 장바구니 항목을 삭제하는 메소드
    public void clearCart();  // 메소드 이름을 clearCart로 수정
    
}
