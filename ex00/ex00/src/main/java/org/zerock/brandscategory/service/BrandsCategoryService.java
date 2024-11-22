package org.zerock.brandscategory.service;

import java.util.List;

import org.zerock.brandscategory.vo.BrandsCategoryVO;

public interface BrandsCategoryService {

	// 1. 카테고리 리스트 조회
	// 주어진 대분류 코드에 해당하는 중분류 리스트를 반환
	public List<BrandsCategoryVO> list(Integer brands_cate_code1);

	// 2. 카테고리 등록
	// cate_code1이 없으면 대분류 카테고리를 등록하고, 있으면 중분류 카테고리를 등록
	public Integer write(BrandsCategoryVO vo);

	// 3. 카테고리 수정
	// 주어진 카테고리 정보를 수정
	public Integer update(BrandsCategoryVO vo);

	// 4. 카테고리 삭제
	// 주어진 카테고리를 삭제
	public Integer delete(BrandsCategoryVO vo);
}
