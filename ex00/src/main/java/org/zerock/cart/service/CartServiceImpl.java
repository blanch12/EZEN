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
	
	// 장바구니 조회
    public List<CartVO> list(PageObject pageObject, String id) {
        log.info("list() 실행 =====");
        // 전체 데이터 개수 구해서(startRow와 endRow가 세팅된다) controller에 넘긴다.
//        pageObject.setTotalRow(cartMapper.getTotalRow(pageObject));
//        return cartMapper.list(pageObject);
        
        // id와 일치하는 장바구니 아이템만 반환하는 로직
        return cartMapper.list(pageObject, id);
    }

    // 장바구니에 상품 추가
    public void addToCart(CartDTO cartDTO) {  // CartDTO를 인자로 받아 처리
        log.info("addToCart() 실행 =====");
        cartMapper.addToCart(cartDTO);  // Mapper 호출하여 장바구니에 상품 추가
    }

    // 장바구니에서 상품 삭제
    public Integer removeItems(List<Long> cartNos) {
        log.info("removeItems() 실행 =====");
        return cartMapper.removeItems(cartNos);
    }

    // 장바구니 비우기
    public void clearCart() {
        log.info("clearCart() 실행 =====");
        cartMapper.clearCart();
    }
	
}
//	// 자동 DI
//	@Setter(onMethod_ = @Autowired)
//	private CartMapper mapper;
//	
//	public List<CartVO> list(PageObject pageObject, Long no) {
//		// TODO Auto-generated method stub
//		// 전체 데이터 세팅 - 페이지 처리를 위해서
//		pageObject.setTotalRow(mapper.getTotalRow(pageObject, no));
//		return mapper.list(pageObject, no);
//		return null;
//	}

//	@Override
//	public Integer write(CartVO vo) {
//		// TODO Auto-generated method stub
//		return mapper.write(vo);
//	}
//
//	@Override
//	public Integer update(CartVO vo) {
//		// TODO Auto-generated method stub
//		return mapper.update(vo);
//	}
//
//	@Override
//	public Integer delete(CartVO vo) {
//		// TODO Auto-generated method stub
//		return mapper.delete(vo);
//	}