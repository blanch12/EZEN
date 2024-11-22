package org.zerock.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.notice.mapper.NoticeMapper;
import org.zerock.notice.vo.NoticeVO;
import org.zerock.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

    // NoticeMapper 주입
    @Setter(onMethod_ = @Autowired)
    private NoticeMapper mapper;

    // 1. 공지사항 리스트 처리
    @Override
    public List<NoticeVO> list(PageObject pageObject) {
        // 페이지 정보를 기반으로 전체 데이터 수 설정
        pageObject.setTotalRow(mapper.getTotalRow(pageObject));
        // 리스트 조회
        return mapper.list(pageObject);
    }

    // 2. 공지사항 상세 보기
    @Override
    public NoticeVO view(Long no) {
        return mapper.view(no);
    }

    // 3. 공지사항 글 쓰기
    @Override
    public Integer write(NoticeVO vo) {
        return mapper.write(vo);
    }

    // 4. 공지사항 글 수정
    @Override
    public Integer update(NoticeVO vo) {
        return mapper.update(vo);
    }

    // 5. 공지사항 글 삭제
    @Override
    public Integer delete(Long no) {
        return mapper.delete(no);
    }
}
