package org.zerock.brands.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.brands.mapper.BrandsMapper;
import org.zerock.brands.vo.BrandsColorVO;
import org.zerock.brands.vo.BrandsImageVO;
import org.zerock.brands.vo.BrandsSearchVO;
import org.zerock.brands.vo.BrandsSizeVO;
import org.zerock.brands.vo.BrandsVO;
import org.zerock.brandscategory.vo.BrandsCategoryVO;
import org.zerock.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("brandsServiceImpl")
public class BrandsServiceImpl implements BrandsService {

    // BrandsMapper 의존성 주입
    @Setter(onMethod_ = @Autowired)
    private BrandsMapper mapper;

    // 상품 리스트 조회
    @Override
    public List<BrandsVO> list(PageObject pageObject, BrandsSearchVO brandsSearchVO) {
        // 페이지 객체의 총 상품 개수 설정
        pageObject.setTotalRow(mapper.getTotalRow(pageObject, brandsSearchVO));
        
        // 브랜드 리스트 반환
        return mapper.list(pageObject, brandsSearchVO);
    }

    // 상품 상세 정보 조회
    @Override
    public BrandsVO view(Long brands_no) {
        // 브랜드 번호에 해당하는 상품 정보 반환
        return mapper.view(brands_no);
    }

    // 상품 사이즈 리스트 조회
    @Override
    public List<BrandsSizeVO> sizeList(Long brands_no) {
        // 해당 상품의 사이즈 목록 반환
        return mapper.sizeList(brands_no);
    }

    // 상품 컬러 리스트 조회
    @Override
    public List<BrandsColorVO> colorList(Long brands_no) {
        // 해당 상품의 색상 목록 반환
        return mapper.colorList(brands_no);
    }

    // 상품 이미지 리스트 조회
    @Override
    public List<BrandsImageVO> imageList(Long brands_no) {
        // 해당 상품의 이미지 목록 반환
        return mapper.imageList(brands_no);
    }

    // 상품 등록 처리
    @Override
    @Transactional // 트랜잭션 처리
    public Integer write(BrandsVO vo, List<String> imageFileNames, List<String> size_names, List<String> color_names) {
        log.info("+++++ 쿼리실행 전 : brandsVO.brands_no : " + vo.getBrands_no());

        // 상품 기본 정보 등록
        mapper.write(vo);
        log.info("+++++ 쿼리실행 후 : brandsVO.brands_no : " + vo.getBrands_no());

        Long brands_no = vo.getBrands_no();

        // 상품 가격 정보 등록
        mapper.writePrice(vo);

        // 이미지 파일 등록 (선택 사항)
        for (String imageName : imageFileNames) {
            BrandsImageVO imageVO = new BrandsImageVO();
            imageVO.setBrands_no(brands_no);
            imageVO.setBrands_image_name(imageName);
            mapper.writeImage(imageVO);
        }

        // 사이즈 정보 등록 (선택 사항)
        for (String sizeName : size_names) {
            BrandsSizeVO sizeVO = new BrandsSizeVO();
            sizeVO.setBrands_no(brands_no);
            sizeVO.setBrands_size_name(sizeName);
            mapper.writeSize(sizeVO);
        }

        // 색상 정보 등록 (선택 사항)
        List<BrandsColorVO> colorList = null;
        for (String colorName : color_names) {
            if (colorList == null) colorList = new ArrayList<>();
            BrandsColorVO colorVO = new BrandsColorVO();
            colorVO.setBrands_no(brands_no);
            colorVO.setBrands_color_name(colorName);
            colorList.add(colorVO);
        }

        // 색상 목록이 있으면 색상 정보 등록
        if (colorList != null) {
            mapper.writeColor(colorList);
        }

        // 정상적으로 완료된 경우 1 반환
        return 1;
    }

    // 상품 수정 처리
    @Override
    @Transactional // 트랜잭션 처리
    public Integer update(BrandsVO vo, List<String> size_names, List<String> color_names) {
        // 상품 정보 수정
        Integer result = mapper.update(vo);

        // 상품 가격 수정
        result = mapper.updatePrice(vo);

        Long brands_no = vo.getBrands_no();

        // 기존 사이즈 삭제 후 새로운 사이즈 등록
        mapper.deleteSize(brands_no);
        for (String sizeName : size_names) {
            BrandsSizeVO sizeVO = new BrandsSizeVO();
            sizeVO.setBrands_no(brands_no);
            sizeVO.setBrands_size_name(sizeName);
            mapper.writeSize(sizeVO);
        }

        // 기존 색상 삭제 후 새로운 색상 등록
        mapper.deleteColor(brands_no);
        List<BrandsColorVO> colorList = null;
        for (String colorName : color_names) {
            if (colorList == null) colorList = new ArrayList<>();
            BrandsColorVO colorVO = new BrandsColorVO();
            colorVO.setBrands_no(brands_no);
            colorVO.setBrands_color_name(colorName);
            colorList.add(colorVO);
        }

        // 수정된 색상 목록 등록
        if (colorList != null) {
            mapper.writeColor(colorList);
        }

        // 정상적으로 완료된 경우 result 반환
        return result;
    }

    // 상품 삭제 처리
    @Override
    @Transactional // 트랜잭션 처리
    public Integer delete(Long brands_no) {
        log.info("상품 삭제 처리 - 상품 번호: " + brands_no);
        return mapper.delete(brands_no);
    }

    // 대분류/중분류 카테고리 리스트 조회
    @Override
    public List<BrandsCategoryVO> listbrandsCategory(Integer brands_cate_code1) {
        // 해당 대분류 코드에 맞는 카테고리 목록 반환
        return mapper.getBrandsCategory(brands_cate_code1);
    }
}
