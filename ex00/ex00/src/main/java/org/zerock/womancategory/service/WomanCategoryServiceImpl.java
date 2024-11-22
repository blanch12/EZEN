package org.zerock.womancategory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.womancategory.mapper.WomanCategoryMapper;
import org.zerock.womancategory.vo.WomanCategoryVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("womancategoryServiceImpl")
public class WomanCategoryServiceImpl implements WomanCategoryService {
	
	@Setter(onMethod_ = @Autowired)
	private WomanCategoryMapper mapper;

	// 1. 카테고리 리스트 조회
	@Override
	public List<WomanCategoryVO> list(Integer woman_cate_code1) {
		// 대분류 코드에 해당하는 카테고리 목록을 조회하여 반환
		return mapper.list(woman_cate_code1);
	}

	// 2. 카테고리 등록
	@Override
	public Integer write(WomanCategoryVO vo) {
		// cate_code1이 0이면 대분류 등록, 아니면 중분류 등록
		if (vo.getWoman_cate_code1() == 0) {
			return mapper.writeBig(vo);  // 대분류 등록
		} else {
			return mapper.writeMid(vo);  // 중분류 등록
		}
	}

	// 3. 카테고리 수정
	@Override
	public Integer update(WomanCategoryVO vo) {
		// 카테고리 정보를 수정하여 반환
		return mapper.update(vo);
	}

	// 4. 카테고리 삭제
	@Override
	public Integer delete(WomanCategoryVO vo) {
		// 카테고리를 삭제하고 반환
		return mapper.delete(vo);
	}
}
