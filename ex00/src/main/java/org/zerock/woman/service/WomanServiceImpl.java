package org.zerock.woman.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.util.page.PageObject;
import org.zerock.woman.mapper.WomanMapper;
import org.zerock.woman.vo.WomanColorVO;
import org.zerock.woman.vo.WomanImageVO;
import org.zerock.woman.vo.WomanSearchVO;
import org.zerock.woman.vo.WomanSizeVO;
import org.zerock.woman.vo.WomanVO;
import org.zerock.womancategory.vo.WomanCategoryVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("womanServiceImpl")
public class WomanServiceImpl implements WomanService {

	@Setter(onMethod_ = @Autowired)
	private WomanMapper mapper;
	
	@Override
	public List<WomanVO> list(PageObject pageObject,
			WomanSearchVO womanSearchVO) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject, womanSearchVO));
		
		return mapper.list(pageObject, womanSearchVO);
	}

	// 상품 정보 보기
	@Override
	public WomanVO view(Long woman_no) {
		// TODO Auto-generated method stub
		return mapper.view(woman_no);
	}
	// 상품 사이즈 리스트
	@Override
	public List<WomanSizeVO> sizeList(Long woman_no) {
		// TODO Auto-generated method stub
		return mapper.sizeList(woman_no);
	}
	// 상품 컬러 리스트
	@Override
	public List<WomanColorVO> colorList(Long woman_no) {
		// TODO Auto-generated method stub
		return mapper.colorList(woman_no);
	}
	// 상품 이미지 리스트
	@Override
	public List<WomanImageVO> imageList(Long woman_no) {
		// TODO Auto-generated method stub
		return mapper.imageList(woman_no);
	}
	
	

	@Override
	@Transactional	
	public Integer write(WomanVO vo,
			List<String> imageFileNames,
			List<String> size_names,
			List<String> color_names) {
		// TODO Auto-generated method stub

		log.info("+++++ 쿼리실행 전 : womanVO.woman_no : " + vo.getWoman_no());
		mapper.write(vo);
		log.info("+++++ 쿼리실행 후 : womanVO.woman_no : " + vo.getWoman_no());

		Long woman_no = vo.getWoman_no();

		
		mapper.writePrice(vo);
		// goods_image 테이블에 등록 (선택: imageFileNames에 자료가 있으면)
		for (String imageName : imageFileNames) {
			WomanImageVO imageVO = new WomanImageVO();
			imageVO.setWoman_no(woman_no);
			imageVO.setWoman_image_name(imageName);
			mapper.writeImage(imageVO);
		}
		// goods_size 테이블에 등록 (선택: size_names에 자료가 있으면)
		for (String sizeName : size_names) {
			WomanSizeVO sizeVO = new WomanSizeVO();
			sizeVO.setWoman_no(woman_no);
			sizeVO.setWoman_size_name(sizeName);
			mapper.writeSize(sizeVO);
		}
		// goods_color 테이블에 등록 (선택: color_names에 자료가 있으면)
		List<WomanColorVO> colorList = null;
		for (String colorName : color_names) {
			if (colorList == null) colorList = new ArrayList<>();
			WomanColorVO colorVO = new WomanColorVO();
			colorVO.setWoman_no(woman_no);
			colorVO.setWoman_color_name(colorName);
			
			colorList.add(colorVO);
		}

		if (colorList != null) mapper.writeColor(colorList);
		
		return 1;
	}

	@Override
	@Transactional
	public Integer update(WomanVO vo,
			List<String> size_names,
			List<String> color_names) {
		// TODO Auto-generated method stub
		Integer result = mapper.update(vo);
		result = mapper.updatePrice(vo);
	
		Long woman_no = vo.getWoman_no();
		mapper.deleteSize(woman_no);
		for (String sizeName : size_names) {
			WomanSizeVO sizeVO = new WomanSizeVO();
			sizeVO.setWoman_no(woman_no);
			sizeVO.setWoman_size_name(sizeName);
			mapper.writeSize(sizeVO);
		}
		// 컬러 리스트 삭제 및 등록
		mapper.deleteColor(woman_no);
		List<WomanColorVO> colorList = null;
		for (String colorName : color_names) {
			if (colorList == null) colorList = new ArrayList<>();
			WomanColorVO colorVO = new WomanColorVO();
			colorVO.setWoman_no(woman_no);
			colorVO.setWoman_color_name(colorName);
			
			colorList.add(colorVO);
		}
		return result;
	}

    @Override
    @Transactional // 트랜잭션 처리
    public Integer delete(Long woman_no) {
        log.info("상품 삭제 처리 - 상품 번호: " + woman_no);
        return mapper.delete(woman_no);
    }

	@Override
	public List<WomanCategoryVO> listwomanCategory(Integer woman_cate_code1) {
		// TODO Auto-generated method stub
		return mapper.getWomanCategory(woman_cate_code1);
	}

	

}
