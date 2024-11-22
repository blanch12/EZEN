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

    // 브랜드 리스트 조회 (페이징 처리, 검색 조건 포함)
    public List<BrandsVO> list(
            @Param("pageObject") PageObject pageObject,
            @Param("brandsSearchVO") BrandsSearchVO brandsSearchVO);

    // 브랜드 리스트의 전체 개수 조회 (페이징을 위한 총 개수)
    public Long getTotalRow(
            @Param("pageObject") PageObject pageObject,
            @Param("brandsSearchVO") BrandsSearchVO brandsSearchVO);
    
    // 대분류 및 중분류 카테고리 리스트 조회
    public List<BrandsCategoryVO> getBrandsCategory(@Param("brands_cate_code1") Integer brands_cate_code1);

    // 상품 상세 정보 조회
    public BrandsVO view(@Param("brands_no") Long brands_no);

    // 상품의 사이즈 리스트 조회
    public List<BrandsSizeVO> sizeList(@Param("brands_no") Long brands_no);

    // 상품의 컬러 리스트 조회
    public List<BrandsColorVO> colorList(@Param("brands_no") Long brands_no);

    // 상품의 이미지 리스트 조회
    public List<BrandsImageVO> imageList(@Param("brands_no") Long brands_no);

    // 상품 등록 처리
    // 1. brands 테이블에 상품 기본 정보 등록
    public Integer write(BrandsVO vo);
    
    // 상품 가격 정보 등록 (brands_price 테이블)
    public Integer writePrice(BrandsVO vo);

    // 상품 이미지 등록 (brands_image 테이블)
    public Integer writeImage(BrandsImageVO vo);

    // 상품 사이즈 등록 (brands_size 테이블)
    public Integer writeSize(BrandsSizeVO vo);

    // 상품 컬러 등록 (brands_color 테이블)
    public Integer writeColor(List<BrandsColorVO> list);

    // 상품 정보 수정 처리
    public Integer update(BrandsVO vo);

    // 상품 가격 수정 (brands_price 테이블)
    public Integer updatePrice(BrandsVO vo);

    // 상품 사이즈 삭제 (brands_size 테이블)
    public Integer deleteSize(Long brands_no);

    // 상품 컬러 삭제 (brands_color 테이블)
    public Integer deleteColor(Long brands_no);

    // 상품 이미지 삭제 (brands_image 테이블)
    public Integer deleteImage(String brands_image_name);

    // 상품 삭제 (brands 테이블)
    Integer delete(Long brands_no);
}
