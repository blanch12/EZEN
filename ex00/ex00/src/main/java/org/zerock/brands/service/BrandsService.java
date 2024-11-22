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

    // 상품 리스트 조회
    // pageObject: 페이지 관련 정보, brandsSearchVO: 검색 조건
    public List<BrandsVO> list(PageObject pageObject, BrandsSearchVO brandsSearchVO);
    
    // 대분류와 중분류 카테고리 리스트 가져오기
    // brands_cate_code1: 대분류 코드
    public List<BrandsCategoryVO> listbrandsCategory(Integer brands_cate_code1);
    
    // 상품 상세 정보 조회
    // brands_no: 상품 번호
    public BrandsVO view(Long brands_no);
    
    // 상품 사이즈 리스트 조회
    // brands_no: 상품 번호
    public List<BrandsSizeVO> sizeList(Long brands_no);
    
    // 상품 컬러 리스트 조회
    // brands_no: 상품 번호
    public List<BrandsColorVO> colorList(Long brands_no);
    
    // 상품 이미지 리스트 조회
    // brands_no: 상품 번호
    public List<BrandsImageVO> imageList(Long brands_no);
    
    // 상품 등록 처리
    // vo: 상품 기본 정보, imageFileNames: 이미지 파일 이름들, size_names: 사이즈 목록, color_names: 색상 목록
    public Integer write(BrandsVO vo, List<String> imageFileNames, List<String> size_names, List<String> color_names);
    
    // 상품 수정 처리
    // vo: 수정된 상품 정보, size_names: 수정된 사이즈 목록, color_names: 수정된 색상 목록
    public Integer update(BrandsVO vo, List<String> size_names, List<String> color_names);
    
    // 상품 삭제 처리
    // brands_no: 삭제할 상품 번호
    public Integer delete(Long brands_no);

    // 상품 이미지 추가, 변경, 삭제 처리
    // (구체적인 메서드는 구현되지 않음)
    
    // 상품 사이즈 추가, 변경, 삭제 처리
    // (구체적인 메서드는 구현되지 않음)
    
    // 상품 색상 추가, 변경, 삭제 처리
    // (구체적인 메서드는 구현되지 않음)
    
    // 상품의 현재 가격 + 기간 변경 처리
    // 상품의 예정 가격 추가 처리
}
