package org.zerock.recentview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import org.zerock.goods.service.GoodsService;
import org.zerock.goods.vo.GoodsColorVO;
import org.zerock.goods.vo.GoodsSizeVO;
import org.zerock.goods.vo.GoodsVO;

@Controller
public class RecentViewController {

    private final GoodsService goodsService;

    // 생성자 주입을 통해 GoodsService 의존성 주입
    public RecentViewController(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    // 최근 본 상품 리스트를 가져오는 메소드
    @GetMapping("/recent/list.do")
    public String getRecentView(HttpSession session, Model model) {
        // 세션에서 최근 본 상품 리스트를 가져옴
        @SuppressWarnings("unchecked")
        List<Long> recentlyViewed = (List<Long>) session.getAttribute("recentlyViewed");

        // 최근 본 상품이 없다면 빈 리스트를 반환
        if (recentlyViewed == null || recentlyViewed.isEmpty()) {
            model.addAttribute("recentGoods", new ArrayList<>());
            return "recent/list"; // JSP 페이지
        }

        // GoodsService를 통해 최근 본 상품의 정보를 가져옴
        List<GoodsVO> recentGoods = goodsService.getGoodsListByIds(recentlyViewed);

        // 각 상품에 sizeList와 colorList 추가
        for (GoodsVO goods : recentGoods) {
            // 상품의 사이즈 리스트와 색상 리스트를 서비스에서 가져옴
            List<GoodsSizeVO> sizeList = goodsService.sizeList(goods.getGoods_no());
            List<GoodsColorVO> colorList = goodsService.colorList(goods.getGoods_no());

            // GoodsVO 객체에 사이즈와 색상 리스트 설정
            goods.setSizeList(sizeList);
            goods.setColorList(colorList);

            // 로그로 데이터 확인
            System.out.println("상품 번호: " + goods.getGoods_no());
            System.out.println("사이즈 리스트: " + sizeList);
            System.out.println("색상 리스트: " + colorList);
        }

        // 모델에 데이터 전달
        model.addAttribute("recentGoods", recentGoods);

        return "recent/list"; // JSP 페이지 이름
    }

    // 최근 본 상품 삭제 처리
    @PostMapping("/recent/delete")
    @ResponseBody
    public String deleteRecentItem(@RequestParam("goodsId") Long goodsId, HttpSession session) {
        // 세션에서 최근 본 상품 리스트를 가져옴
        @SuppressWarnings("unchecked")
        List<Long> recentlyViewed = (List<Long>) session.getAttribute("recentlyViewed");
        
        // 삭제할 상품이 최근 본 리스트에 있으면 제거
        if (recentlyViewed != null && recentlyViewed.contains(goodsId)) {
            recentlyViewed.remove(goodsId);
            session.setAttribute("recentlyViewed", recentlyViewed); // 세션에 업데이트
            return "success"; // 성공 메시지
        }
        return "failure"; // 실패 메시지
    }

    // 최근 본 상품 목록에 상품 추가
    @GetMapping("/recent/add")
    public String addRecentView(@RequestParam("goods_no") Long goodsNo, HttpSession session) {
        // 세션에서 최근 본 상품 리스트를 가져옴
        @SuppressWarnings("unchecked")
        List<Long> recentlyViewed = (List<Long>) session.getAttribute("recentlyViewed");

        // 리스트가 없으면 새로 생성
        if (recentlyViewed == null) {
            recentlyViewed = new ArrayList<>();
        }

        // 최근 본 상품 리스트에 이미 상품이 없다면 추가
        if (!recentlyViewed.contains(goodsNo)) {
            recentlyViewed.add(goodsNo);
            System.out.println("최근 본 상품 추가: " + goodsNo);
        }

        // 세션에 업데이트
        session.setAttribute("recentlyViewed", recentlyViewed);

        // 상세 페이지로 리다이렉트
        return "redirect:/goods/view.do?goods_no=" + goodsNo;
    }
}
