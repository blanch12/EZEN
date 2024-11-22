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

	// 1. 카테고리 리스트 조회
	@Override
	public List<BrandsCategoryVO> list(Integer brands_cate_code1) {
		// 주어진 대분류 코드에 해당하는 중분류 리스트를 반환
		return mapper.list(brands_cate_code1);
	}

	// 2. 카테고리 등록
	@Override
	public Integer write(BrandsCategoryVO vo) {
		// 대분류 카테고리 등록 (brands_cate_code1이 0일 경우)
		// 중분류 카테고리 등록 (brands_cate_code1이 0이 아닐 경우)
		if (vo.getBrands_cate_code1() == 0) {
			return mapper.writeBig(vo); // 대분류 등록
		}
		else {
			return mapper.writeMid(vo); // 중분류 등록
		}
	}

	// 3. 카테고리 수정
	@Override
	public Integer update(BrandsCategoryVO vo) {
		// 카테고리 정보를 수정하고 수정된 결과 반환
		return mapper.update(vo);
	}

	// 4. 카테고리 삭제
	@Override
	public Integer delete(BrandsCategoryVO vo) {
		// 카테고리를 삭제하고 삭제된 결과 반환
		return mapper.delete(vo);
	}
}
