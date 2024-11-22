package org.zerock.category.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.category.vo.CategoryVO;

@Repository
public interface CategoryMapper {

    // 1. 카테고리 리스트
    // cate_code1을 파라미터로 받아 대분류 또는 중분류 목록을 조회한다.
    // cate_code1이 0이면 대분류를 조회, cate_code1이 특정 값이면 해당 대분류에 대한 중분류를 조회한다.
    public List<CategoryVO> list(@Param("cate_code1") Integer cate_code1);

    // 2. 카테고리 등록
    // 2-1. 대분류 등록: 대분류 카테고리를 등록하는 메소드
    public Integer writeBig(CategoryVO vo);

    // 2-2. 중분류 등록: 중분류 카테고리를 등록하는 메소드
    public Integer writeMid(CategoryVO vo);

    // 3. 카테고리 수정
    // 카테고리 정보를 수정하는 메소드 (대분류/중분류 모두 가능)
    public Integer update(CategoryVO vo);

    // 4. 카테고리 삭제
    // 카테고리를 삭제하는 메소드 (대분류/중분류 모두 가능)
    public Integer delete(CategoryVO vo);
}
