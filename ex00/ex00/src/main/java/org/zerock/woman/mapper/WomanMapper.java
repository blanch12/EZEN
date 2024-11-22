package org.zerock.woman.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.util.page.PageObject;
import org.zerock.woman.vo.WomanColorVO;
import org.zerock.woman.vo.WomanImageVO;
import org.zerock.woman.vo.WomanSearchVO;
import org.zerock.woman.vo.WomanSizeVO;
import org.zerock.woman.vo.WomanVO;
import org.zerock.womancategory.vo.WomanCategoryVO;

@Repository
public interface WomanMapper {

	// 상품 리스트 조회 (페이징 처리 및 검색 필터링)
	public List<WomanVO> list(
			@Param("pageObject") PageObject pageObject,   // 페이지 객체 (페이징 정보)
			@Param("womanSearchVO") WomanSearchVO womanSearchVO);  // 상품 검색 조건

	// 상품 리스트 총 개수 조회 (페이징에 필요한 전체 레코드 수)
	public Long getTotalRow(
			@Param("pageObject") PageObject pageObject,   // 페이지 객체 (페이징 정보)
			@Param("womanSearchVO") WomanSearchVO womanSearchVO);  // 상품 검색 조건

	// 특정 카테고리 코드에 해당하는 하위 카테고리 리스트 조회
	public List<WomanCategoryVO> getWomanCategory(@Param("woman_cate_code1") Integer woman_cate_code1);

	// 특정 상품 번호에 해당하는 상품 정보 조회
	public WomanVO view(@Param("woman_no") Long woman_no);

	// 특정 상품 번호에 해당하는 사이즈 정보 리스트 조회
	public List<WomanSizeVO> sizeList(@Param("woman_no") Long woman_no);

	// 특정 상품 번호에 해당하는 색상 정보 리스트 조회
	public List<WomanColorVO> colorList(@Param("woman_no") Long woman_no);

	// 특정 상품 번호에 해당하는 이미지 정보 리스트 조회
	public List<WomanImageVO> imageList(@Param("woman_no") Long woman_no);

	// 상품 등록 처리
	public Integer write(WomanVO vo);

	// 상품 가격 등록 처리
	public Integer writePrice(WomanVO vo);

	// 상품 이미지 등록 처리
	public Integer writeImage(WomanImageVO vo);

	// 상품 사이즈 등록 처리
	public Integer writeSize(WomanSizeVO vo);

	// 상품 색상 등록 처리
	public Integer writeColor(List<WomanColorVO> list);
	
	// 상품 정보 수정 처리
	public Integer update(WomanVO vo);

	// 상품 가격 수정 처리
	public Integer updatePrice(WomanVO vo);

	// 상품 사이즈 삭제 처리
	public Integer deleteSize(Long woman_no);

	// 상품 색상 삭제 처리
	public Integer deleteColor(Long woman_no);

	// 상품 이미지 삭제 처리
	public Integer deleteImage(String woman_image_name);

    // 상품 삭제 처리
    Integer delete(Long woman_no);
}
