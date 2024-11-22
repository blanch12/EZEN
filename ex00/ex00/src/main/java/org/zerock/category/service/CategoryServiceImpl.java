package org.zerock.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.category.mapper.CategoryMapper;
import org.zerock.category.vo.CategoryVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("categoryServiceImpl")
public class CategoryServiceImpl implements CategoryService {
    
    // CategoryMapper를 자동 주입하여 카테고리 관련 DB 작업을 처리
    @Setter(onMethod_ = @Autowired)
    private CategoryMapper mapper;

    // 1. 카테고리 리스트 조회
    @Override
    public List<CategoryVO> list(Integer cate_code1) {
        // cate_code1 값이 null이면 대분류 목록, 값이 있으면 해당 대분류에 속한 중분류 목록을 조회
        return mapper.list(cate_code1);
    }

    // 2. 카테고리 등록
    @Override
    public Integer write(CategoryVO vo) {
        // cate_code1 값이 0일 경우 대분류 등록, 그 외에는 중분류 등록
        if (vo.getCate_code1() == 0) {
            // 대분류 등록
            return mapper.writeBig(vo);
        } else {
            // 중분류 등록
            return mapper.writeMid(vo);
        }
    }

    // 3. 카테고리 수정
    @Override
    public Integer update(CategoryVO vo) {
        // 카테고리 정보를 수정하는 로직, mapper를 통해 DB에 반영
        return mapper.update(vo);
    }

    // 4. 카테고리 삭제
    @Override
    public Integer delete(CategoryVO vo) {
        // 카테고리 정보를 삭제하는 로직, mapper를 통해 DB에서 삭제
        return mapper.delete(vo);
    }
}
