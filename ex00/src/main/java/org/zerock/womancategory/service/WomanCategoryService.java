package org.zerock.womancategory.service;

import java.util.List;

import org.zerock.womancategory.vo.WomanCategoryVO;

public interface WomanCategoryService {

	// 1.리스트
	public List<WomanCategoryVO> list(Integer woman_cate_code1);
	// 2.등록
	// cate_code1 이 없으면 대분류, cate_code1 이 있으면 중분류
	public Integer write(WomanCategoryVO vo);
	// 3.수정
	public Integer update(WomanCategoryVO vo);
	// 4.삭제
	public Integer delete(WomanCategoryVO vo);
}
