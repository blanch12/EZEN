package org.zerock.womancategory.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.womancategory.vo.WomanCategoryVO;

@Repository
public interface WomanCategoryMapper {

	// 1. 카테고리 리스트
	public List<WomanCategoryVO> list(@Param("woman_cate_code1")  Integer woman_cate_code1);

	// 2. 카테고리 등록
	// 2-1. 대분류 등록
	public Integer writeBig(WomanCategoryVO vo);
	// 2-2. 중분류 등록
	public Integer writeMid(WomanCategoryVO vo);

	// 3. 카테고리 수정
	public Integer update(WomanCategoryVO vo);

	// 4. 카테고리 삭제
	public Integer delete(WomanCategoryVO vo);
}





