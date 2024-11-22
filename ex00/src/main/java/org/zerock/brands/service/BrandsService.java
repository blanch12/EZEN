package org.zerock.brands.service;

import java.util.List;

import org.zerock.brands.vo.BrandsColorVO;
import org.zerock.brands.vo.BrandsImageVO;
import org.zerock.brands.vo.BrandsSearchVO;
import org.zerock.brands.vo.BrandsSizeVO;
import org.zerock.brands.vo.BrandsVO;
import org.zerock.brandscategory.vo.BrandsCategoryVO;
import org.zerock.util.page.PageObject;
import org.zerock.womancategory.vo.WomanCategoryVO;

public interface BrandsService {

	// 상품 리스트
	public List<BrandsVO> list(PageObject pageObject,
			BrandsSearchVO brandsSearchVO);
	
	// 대분류 / 중분류 리스트 가져오기
	public List<BrandsCategoryVO> listbrandsCategory (Integer brands_cate_code1);
	
	// 상품 정보 보기
	public BrandsVO view(Long brands_no);
	// 상품 사이즈 리스트
	public List<BrandsSizeVO> sizeList(Long brands_no);
	// 상품 컬러 리스트
	public List<BrandsColorVO> colorList(Long brands_no);
	// 상품 이미지 리스트
	public List<BrandsImageVO> imageList(Long brands_no);
	
	// 상품 등록
	public Integer write(BrandsVO vo,
		List<String> imageFileNames,
		List<String> size_names,
		List<String> color_names);
	// 상품 수정
	public Integer update(BrandsVO vo,
			List<String> size_names,
			List<String> color_names);
    // 상품 삭제
    Integer delete(Long brands_no);
	

	
	// 상품이미지 추가
	// 상품이미지 변경
	// 상품이미지 삭제
	
	// 상품사이즈 추가
	// 상품사이즈 변경
	// 상품사이즈 삭제
	
	// 상품색상 추가
	// 상품색상 변경
	// 상품색상 삭제
	
	// 상품 현재 가격 + 기간 변경
	// 상품 예정 가격 추가
}





