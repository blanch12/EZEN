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

	// 상품 리스트 조회 (페이징 및 검색 조건에 맞게 상품 리스트를 반환)
	public List<WomanVO> list(PageObject pageObject,  // 페이징 객체
		WomanSearchVO womanSearchVO); // 상품 검색 조건

	// 대분류 / 중분류 카테고리 리스트 조회 (특정 대분류 코드에 해당하는 중분류를 가져옴)
	public List<WomanCategoryVO> listwomanCategory(Integer woman_cate_code1); // 대분류 코드로 중분류 리스트 조회

	// 상품 상세 정보 조회 (상품 번호로 특정 상품 정보를 반환)
	public WomanVO view(Long woman_no); // 상품 번호로 상품 정보 조회

	// 특정 상품의 사이즈 리스트 조회
	public List<WomanSizeVO> sizeList(Long woman_no); // 상품 번호로 해당 상품의 사이즈 리스트 조회

	// 특정 상품의 컬러 리스트 조회
	public List<WomanColorVO> colorList(Long woman_no); // 상품 번호로 해당 상품의 컬러 리스트 조회

	// 특정 상품의 이미지 리스트 조회
	public List<WomanImageVO> imageList(Long woman_no); // 상품 번호로 해당 상품의 이미지 리스트 조회
	
	// 상품 등록 처리 (새 상품을 등록하고, 관련 이미지, 사이즈, 색상 등의 정보를 함께 처리)
	public Integer write(WomanVO vo,   // 상품 정보
		List<String> imageFileNames,   // 상품 이미지 파일 이름 리스트
		List<String> size_names,      // 상품 사이즈 리스트
		List<String> color_names);    // 상품 색상 리스트
	
	// 상품 수정 처리 (기존 상품 정보를 수정하고, 관련 사이즈, 색상 등을 업데이트)
	public Integer update(WomanVO vo,   // 수정할 상품 정보
			List<String> size_names,    // 수정할 사이즈 리스트
			List<String> color_names);  // 수정할 색상 리스트
	
    // 상품 삭제 처리 (상품 번호에 해당하는 상품을 삭제)
    Integer delete(Long woman_no);   // 상품 번호로 상품 삭제 처리
}
