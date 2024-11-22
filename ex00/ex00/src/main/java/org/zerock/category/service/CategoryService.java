package org.zerock.category.service;

import java.util.List;

import org.zerock.category.vo.CategoryVO;

public interface CategoryService {

    // 1. 카테고리 리스트
    // cate_code1을 파라미터로 받아 해당 대분류에 대한 중분류를 조회하거나, 
    // cate_code1이 없으면 대분류 목록을 조회한다.
    public List<CategoryVO> list(Integer cate_code1);

    // 2. 카테고리 등록
    // cate_code1이 null이면 대분류를, 존재하면 중분류를 등록한다.
    public Integer write(CategoryVO vo);

    // 3. 카테고리 수정
    // 카테고리의 정보를 수정한다. 대분류 또는 중분류 모두 해당된다.
    public Integer update(CategoryVO vo);

    // 4. 카테고리 삭제
    // 카테고리 정보를 삭제한다. 대분류 또는 중분류 모두 해당된다.
    public Integer delete(CategoryVO vo);
}
