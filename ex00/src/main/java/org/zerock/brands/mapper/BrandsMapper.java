package org.zerock.brands.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.brands.vo.BrandsColorVO;
import org.zerock.brands.vo.BrandsImageVO;
import org.zerock.brands.vo.BrandsSearchVO;
import org.zerock.brands.vo.BrandsSizeVO;
import org.zerock.brands.vo.BrandsVO;
import org.zerock.brandscategory.vo.BrandsCategoryVO;
import org.zerock.util.page.PageObject;

@Repository
public interface BrandsMapper {

	public List<BrandsVO> list(
			@Param("pageObject") PageObject pageObject,
			@Param("brandsSearchVO") BrandsSearchVO brandsSearchVO);
	// 상품 리스트 개수
	public Long getTotalRow(
			@Param("pageObject") PageObject pageObject,
			@Param("brandsSearchVO") BrandsSearchVO brandsSearchVO);
	
	// 대분류/중분류 리스트 가져오기
	public List<BrandsCategoryVO> getBrandsCategory(@Param("brands_cate_code1") Integer brands_cate_code1);

	
	
	// 상품 상세보기
	public BrandsVO view(@Param("brands_no") Long brands_no);
	// 상품 사이즈 리스트
	public List<BrandsSizeVO> sizeList(@Param("brands_no") Long brands_no);
	// 상품 컬러 리스트
	public List<BrandsColorVO> colorList(@Param("brands_no") Long brands_no);
	// 상품 이미지 리스트
	public List<BrandsImageVO> imageList(@Param("brands_no") Long brands_no);
	
	// 상품 등록
	// 1. brands 테이블에 상품등록 (필수)
	public Integer write(BrandsVO vo);
	// brands_price 테이블에 가격정보등록 (필수)
	public Integer writePrice(BrandsVO vo);
	// brands_image 테이블에 등록 (선택: imageFileName에 자료가 있으면)
	public Integer writeImage(BrandsImageVO vo);
	// brands_size 테이블에 등록 (선택: size_names에 자료가 있으면)
	public Integer writeSize(BrandsSizeVO vo);
	// brands_color 테이블에 등록 (선택: color_names에 자료가 있으면)
	//public Integer writeColor(brandsColorVO vo);
	public Integer writeColor(List<BrandsColorVO> list);
	
	
	// 상품정보수정
	public Integer update(BrandsVO vo);
	// 상품가격수정
	public Integer updatePrice(BrandsVO vo);
	// 상품사이즈삭제
	public Integer deleteSize(Long brands_no);
	// 상품컬러삭제
	public Integer deleteColor(Long brands_no);
	// 상품이미지삭제
	public Integer deleteImage(String brands_image_name);
    // 상품 삭제
    Integer delete(Long brands_no);
	
}



