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
	private WomanMapper mapper;  // Mapper injected to interact with the database
	
	// 상품 리스트 조회
	@Override
	public List<WomanVO> list(PageObject pageObject, WomanSearchVO womanSearchVO) {
		// 페이징 정보와 검색 조건에 맞춰 상품 리스트를 조회
		pageObject.setTotalRow(mapper.getTotalRow(pageObject, womanSearchVO)); // 총 상품 개수를 설정
		return mapper.list(pageObject, womanSearchVO);  // 리스트 반환
	}

	// 상품 상세 정보 보기
	@Override
	public WomanVO view(Long woman_no) {
		// 상품 번호로 상품 상세 정보 조회
		return mapper.view(woman_no);
	}

	// 상품 사이즈 리스트 조회
	@Override
	public List<WomanSizeVO> sizeList(Long woman_no) {
		// 상품 번호로 해당 상품의 사이즈 리스트 조회
		return mapper.sizeList(woman_no);
	}

	// 상품 컬러 리스트 조회
	@Override
	public List<WomanColorVO> colorList(Long woman_no) {
		// 상품 번호로 해당 상품의 컬러 리스트 조회
		return mapper.colorList(woman_no);
	}

	// 상품 이미지 리스트 조회
	@Override
	public List<WomanImageVO> imageList(Long woman_no) {
		// 상품 번호로 해당 상품의 이미지 리스트 조회
		return mapper.imageList(woman_no);
	}

	// 상품 등록
	@Override
	@Transactional  // 트랜잭션 처리
	public Integer write(WomanVO vo, List<String> imageFileNames, List<String> size_names, List<String> color_names) {
		// 상품 등록 메소드 (상품 정보, 이미지, 사이즈, 컬러 정보 등록)
		log.info("+++++ 쿼리 실행 전: womanVO.woman_no : " + vo.getWoman_no());
		mapper.write(vo);  // 상품 기본 정보 등록
		log.info("+++++ 쿼리 실행 후: womanVO.woman_no : " + vo.getWoman_no());

		Long woman_no = vo.getWoman_no(); // 상품 번호 가져오기

		// 가격 등록
		mapper.writePrice(vo);

		// 이미지 등록 (이미지 파일이 존재할 경우)
		for (String imageName : imageFileNames) {
			WomanImageVO imageVO = new WomanImageVO();
			imageVO.setWoman_no(woman_no);
			imageVO.setWoman_image_name(imageName); // 이미지 파일명 설정
			mapper.writeImage(imageVO);  // 이미지 정보 등록
		}

		// 사이즈 등록 (사이즈 목록이 있을 경우)
		for (String sizeName : size_names) {
			WomanSizeVO sizeVO = new WomanSizeVO();
			sizeVO.setWoman_no(woman_no);
			sizeVO.setWoman_size_name(sizeName); // 사이즈 이름 설정
			mapper.writeSize(sizeVO);  // 사이즈 정보 등록
		}

		// 컬러 등록 (컬러 목록이 있을 경우)
		List<WomanColorVO> colorList = null;
		for (String colorName : color_names) {
			if (colorList == null) colorList = new ArrayList<>();
			WomanColorVO colorVO = new WomanColorVO();
			colorVO.setWoman_no(woman_no);
			colorVO.setWoman_color_name(colorName); // 컬러 이름 설정
			colorList.add(colorVO);  // 컬러 정보 추가
		}

		if (colorList != null) mapper.writeColor(colorList);  // 컬러 정보 등록

		return 1; // 등록 성공
	}

	// 상품 수정
	@Override
	@Transactional  // 트랜잭션 처리
	public Integer update(WomanVO vo, List<String> size_names, List<String> color_names) {
		// 상품 정보 수정
		Integer result = mapper.update(vo);  // 상품 기본 정보 수정
		result = mapper.updatePrice(vo);  // 가격 수정

		Long woman_no = vo.getWoman_no(); // 상품 번호 가져오기
		mapper.deleteSize(woman_no);  // 기존 사이즈 삭제

		// 새 사이즈 등록
		for (String sizeName : size_names) {
			WomanSizeVO sizeVO = new WomanSizeVO();
			sizeVO.setWoman_no(woman_no);
			sizeVO.setWoman_size_name(sizeName);  // 사이즈 이름 설정
			mapper.writeSize(sizeVO);  // 사이즈 등록
		}

		// 기존 컬러 삭제 후 새로운 컬러 등록
		mapper.deleteColor(woman_no);  
		List<WomanColorVO> colorList = null;
		for (String colorName : color_names) {
			if (colorList == null) colorList = new ArrayList<>();
			WomanColorVO colorVO = new WomanColorVO();
			colorVO.setWoman_no(woman_no);
			colorVO.setWoman_color_name(colorName);  // 컬러 이름 설정
			colorList.add(colorVO);  // 컬러 정보 추가
		}

		// 새 컬러 등록
		return result;
	}

	// 상품 삭제
    @Override
    @Transactional  // 트랜잭션 처리
    public Integer delete(Long woman_no) {
        log.info("상품 삭제 처리 - 상품 번호: " + woman_no);
        return mapper.delete(woman_no);  // 상품 삭제
    }

	// 대분류 / 중분류 카테고리 리스트 조회
	@Override
	public List<WomanCategoryVO> listwomanCategory(Integer woman_cate_code1) {
		// 대분류 코드에 맞는 중분류 카테고리 리스트 조회
		return mapper.getWomanCategory(woman_cate_code1);
	}
}
