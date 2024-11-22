package org.zerock.womancategory.service;

import java.util.List;

import org.zerock.womancategory.vo.WomanCategoryVO;

public interface WomanCategoryService {

	// 1. 카테고리 리스트 조회
	// 대분류 코드에 해당하는 카테고리 목록을 조회합니다.
	public List<WomanCategoryVO> list(Integer woman_cate_code1);

	// 2. 카테고리 등록
	// cate_code1이 없으면 대분류 카테고리를 등록하고, 있으면 중분류 카테고리를 등록합니다.
	public Integer write(WomanCategoryVO vo);

	// 3. 카테고리 수정
	// 카테고리 정보를 수정합니다.
	public Integer update(WomanCategoryVO vo);

	// 4. 카테고리 삭제
	// 카테고리를 삭제합니다.
	public Integer delete(WomanCategoryVO vo);
}
