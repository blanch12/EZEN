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

	@Setter(onMethod_ = @Autowired)
	private BrandsMapper mapper;
	
	@Override
	public List<BrandsVO> list(PageObject pageObject,
			BrandsSearchVO brandsSearchVO) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject, brandsSearchVO));
		
		return mapper.list(pageObject, brandsSearchVO);
	}

	// 상품 정보 보기
	@Override
	public BrandsVO view(Long brands_no) {
		// TODO Auto-generated method stub
		return mapper.view(brands_no);
	}
	// 상품 사이즈 리스트
	@Override
	public List<BrandsSizeVO> sizeList(Long brands_no) {
		// TODO Auto-generated method stub
		return mapper.sizeList(brands_no);
	}
	// 상품 컬러 리스트
	@Override
	public List<BrandsColorVO> colorList(Long brands_no) {
		// TODO Auto-generated method stub
		return mapper.colorList(brands_no);
	}
	// 상품 이미지 리스트
	@Override
	public List<BrandsImageVO> imageList(Long brands_no) {
		// TODO Auto-generated method stub
		return mapper.imageList(brands_no);
	}
	
	

	@Override
	@Transactional
	public Integer write(BrandsVO vo,
			List<String> imageFileNames,
			List<String> size_names,
			List<String> color_names) {
		// TODO Auto-generated method stub

		log.info("+++++ 쿼리실행 전 : brandsVO.brands_no : " + vo.getBrands_no());
		mapper.write(vo);
		log.info("+++++ 쿼리실행 후 : brandsVO.brands_no : " + vo.getBrands_no());

		Long brands_no = vo.getBrands_no();

		
		mapper.writePrice(vo);
		// goods_image 테이블에 등록 (선택: imageFileNames에 자료가 있으면)
		for (String imageName : imageFileNames) {
			BrandsImageVO imageVO = new BrandsImageVO();
			imageVO.setBrands_no(brands_no);
			imageVO.setBrands_image_name(imageName);
			mapper.writeImage(imageVO);
		}
		// goods_size 테이블에 등록 (선택: size_names에 자료가 있으면)
		for (String sizeName : size_names) {
			BrandsSizeVO sizeVO = new BrandsSizeVO();
			sizeVO.setBrands_no(brands_no);
			sizeVO.setBrands_size_name(sizeName);
			mapper.writeSize(sizeVO);
		}
		// goods_color 테이블에 등록 (선택: color_names에 자료가 있으면)
		List<BrandsColorVO> colorList = null;
		for (String colorName : color_names) {
			if (colorList == null) colorList = new ArrayList<>();
			BrandsColorVO colorVO = new BrandsColorVO();
			colorVO.setBrands_no(brands_no);
			colorVO.setBrands_color_name(colorName);
			
			colorList.add(colorVO);
		}

		if (colorList != null) mapper.writeColor(colorList);
		
		return 1;
	}

	@Override
	@Transactional
	public Integer update(BrandsVO vo,
			List<String> size_names,
			List<String> color_names) {
		// TODO Auto-generated method stub
		Integer result = mapper.update(vo);
		result = mapper.updatePrice(vo);
		
		Long brands_no = vo.getBrands_no();
		mapper.deleteSize(brands_no);
		for (String sizeName : size_names) {
			BrandsSizeVO sizeVO = new BrandsSizeVO();
			sizeVO.setBrands_no(brands_no);
			sizeVO.setBrands_size_name(sizeName);
			mapper.writeSize(sizeVO);
		}
		// 컬러 리스트 삭제 및 등록
		mapper.deleteColor(brands_no);
		List<BrandsColorVO> colorList = null;
		for (String colorName : color_names) {
			if (colorList == null) colorList = new ArrayList<>();
			BrandsColorVO colorVO = new BrandsColorVO();
			colorVO.setBrands_no(brands_no);
			colorVO.setBrands_color_name(colorName);
			
			colorList.add(colorVO);
		}
		return result;
	}

    @Override
    @Transactional // 트랜잭션 처리
    public Integer delete(Long brands_no) {
        log.info("상품 삭제 처리 - 상품 번호: " + brands_no);
        return mapper.delete(brands_no);
    }

	@Override
	public List<BrandsCategoryVO> listbrandsCategory(Integer brands_cate_code1) {
		// TODO Auto-generated method stub
		return mapper.getBrandsCategory(brands_cate_code1);
	}

	

}
