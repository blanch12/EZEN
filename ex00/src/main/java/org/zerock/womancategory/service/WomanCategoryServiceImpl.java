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

	// 1. 카테고리 리스트
	@Override
	public List<WomanCategoryVO> list(Integer woman_cate_code1) {
		// TODO Auto-generated method stub
		return mapper.list(woman_cate_code1);
	}

	// 2. 카테고리 등록
	@Override
	public Integer write(WomanCategoryVO vo) {
		// TODO Auto-generated method stub
		// cate_code1 이 있으면 중분류등록
		// 없으면 대분류등록
		if (vo.getWoman_cate_code1() == 0) {
			return mapper.writeBig(vo);
		}
		else {
			return mapper.writeMid(vo);
		}
	}

	// 3. 카테고리 수정
	@Override
	public Integer update(WomanCategoryVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	// 4. 카테고리 삭제
	@Override
	public Integer delete(WomanCategoryVO vo) {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}

}
