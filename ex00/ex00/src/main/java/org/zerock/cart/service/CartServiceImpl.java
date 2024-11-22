package org.zerock.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.cart.mapper.CartMapper;
import org.zerock.cart.vo.CartDTO;
import org.zerock.cart.vo.CartVO;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("cartServiceImpl")
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;

    // 1. 장바구니 조회
    // id와 일치하는 장바구니 아이템만 반환하는 로직
    @Override
    public List<CartVO> list(PageObject pageObject, String id) {
        log.info("list() 실행 =====");
        
        // 페이징 처리를 위한 데이터 (commented out, 사용하지 않으면 삭제 가능)
        // pageObject.setTotalRow(cartMapper.getTotalRow(pageObject));
        
        // id와 일치하는 장바구니 항목만 가져오는 메소드 호출
        return cartMapper.list(pageObject, id);
    }

    // 2. 장바구니에 상품 추가
    // CartDTO 객체를 받아 장바구니에 상품을 추가
    @Override
    public void addToCart(CartDTO cartDTO) {
        log.info("addToCart() 실행 =====");
        
        // Mapper의 메소드 호출하여 장바구니에 상품 추가
        cartMapper.addToCart(cartDTO);
    }

    // 3. 장바구니에서 상품 삭제
    // 주어진 cartNos에 해당하는 상품을 장바구니에서 삭제
    @Override
    public Integer removeItems(List<Long> cartNos) {
        log.info("removeItems() 실행 =====");
        
        // Mapper의 메소드 호출하여 상품 삭제 처리
        return cartMapper.removeItems(cartNos);
    }

    // 4. 장바구니 비우기
    // 장바구니에 있는 모든 항목을 삭제하는 메소드
    @Override
    public void clearCart() {
        log.info("clearCart() 실행 =====");
        
        // Mapper의 메소드 호출하여 장바구니 항목 삭제
        cartMapper.clearCart();
    }

}
