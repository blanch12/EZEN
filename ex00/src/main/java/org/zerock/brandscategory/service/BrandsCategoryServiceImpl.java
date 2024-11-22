package org.zerock.brandscategory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.brandscategory.mapper.BrandsCategoryMapper;
import org.zerock.brandscategory.vo.BrandsCategoryVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("brandscategoryServiceImpl")
public class BrandsCategoryServiceImpl implements BrandsCategoryService {
	
	@Setter(onMethod_ = @Autowired)
	private BrandsCategoryMapper mapper;

	// 1. 카테고리 리스트
	@Override
	public List<BrandsCategoryVO> list(Integer brands_cate_code1) {
		// TODO Auto-generated method stub
		return mapper.list(brands_cate_code1);
	}

	// 2. 카테고리 등록
	@Override
	public Integer write(BrandsCategoryVO vo) {
		// TODO Auto-generated method stub
		// cate_code1 이 있으면 중분류등록
		// 없으면 대분류등록
		if (vo.getBrands_cate_code1() == 0) {
			return mapper.writeBig(vo);
		}
		else {
			return mapper.writeMid(vo);
		}
	}

	// 3. 카테고리 수정
	@Override
	public Integer update(BrandsCategoryVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	// 4. 카테고리 삭제
	@Override
	public Integer delete(BrandsCategoryVO vo) {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}

}
