package org.zerock.brandscategory.service;

import java.util.List;

import org.zerock.brandscategory.vo.BrandsCategoryVO;

public interface BrandsCategoryService {

	// 1.리스트
	public List<BrandsCategoryVO> list(Integer brands_cate_code1);
	// 2.등록
	// cate_code1 이 없으면 대분류, cate_code1 이 있으면 중분류
	public Integer write(BrandsCategoryVO vo);
	// 3.수정
	public Integer update(BrandsCategoryVO vo);
	// 4.삭제
	public Integer delete(BrandsCategoryVO vo);
}
