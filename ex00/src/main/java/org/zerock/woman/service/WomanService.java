package org.zerock.woman.service;

import java.util.List;


import org.zerock.util.page.PageObject;
import org.zerock.woman.vo.WomanColorVO;
import org.zerock.woman.vo.WomanImageVO;
import org.zerock.woman.vo.WomanSearchVO;
import org.zerock.woman.vo.WomanSizeVO;
import org.zerock.woman.vo.WomanVO;
import org.zerock.womancategory.vo.WomanCategoryVO;

public interface WomanService {

	// 상품 리스트
	public List<WomanVO> list(PageObject pageObject,
		WomanSearchVO womanSearchVO);
	
	// 대분류 / 중분류 리스트 가져오기
	public List<WomanCategoryVO> listwomanCategory (Integer woman_cate_code1);
	
	// 상품 정보 보기
	public WomanVO view(Long woman_no);
	// 상품 사이즈 리스트
	public List<WomanSizeVO> sizeList(Long woman_no);
	// 상품 컬러 리스트
	public List<WomanColorVO> colorList(Long woman_no);
	// 상품 이미지 리스트
	public List<WomanImageVO> imageList(Long woman_no);
	
	// 상품 등록
	public Integer write(WomanVO vo,
		List<String> imageFileNames,
		List<String> size_names,
		List<String> color_names);
	// 상품 수정
	public Integer update(WomanVO vo,
			List<String> size_names,
			List<String> color_names);
    // 상품 삭제
    Integer delete(Long woman_no);

	
}





