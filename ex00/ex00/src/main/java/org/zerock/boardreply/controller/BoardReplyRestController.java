package org.zerock.boardreply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.boardreply.service.BoardReplyService;
import org.zerock.boardreply.vo.BoardReplyVO;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/boardreply")
@Log4j
public class BoardReplyRestController {

    // 댓글 서비스 주입
    @Autowired
    @Qualifier("boardReplyServiceImpl")
    private BoardReplyService service;

    // 1. 댓글 리스트 조회 (GET)
    @GetMapping(value = "/list.do",
            produces = {
                    MediaType.APPLICATION_XML_VALUE,
                    MediaType.APPLICATION_JSON_UTF8_VALUE
            })
    public ResponseEntity<Map<String, Object>> list(PageObject pageObject, Long no) {
        log.info("list - page : " + pageObject.getPage() + ", no : " + no);

        // 댓글 목록 가져오기
        List<BoardReplyVO> list = service.list(pageObject, no);

        // 데이터 전달을 위한 맵 객체 생성
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("pageObject", pageObject);

        log.info("After map : " + map);

        // 성공적으로 데이터 반환
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    // 2. 댓글 작성 (POST)
    @PostMapping(value = "/write.do",
            consumes = "application/json",
            produces = "text/plain; charset=UTF-8")
    public ResponseEntity<String> write(@RequestBody BoardReplyVO vo, HttpSession session) {

        // 세션에서 사용자 ID 가져오기 (강제 테스트 ID 사용)
        vo.setId(getId(session));

        // 댓글 등록 처리
        service.write(vo);

        // 성공 메시지 반환
        return new ResponseEntity<>("댓글 등록이 완료되었습니다.", HttpStatus.OK);
    }

    // 3. 댓글 수정 (POST)
    @PostMapping(value = "/update.do",
            consumes = "application/json",
            produces = "text/plain; charset=UTF-8")
    public ResponseEntity<String> update(@RequestBody BoardReplyVO vo, HttpSession session) {
        log.info("update.do ---------------------------------");

        // 세션에서 사용자 ID 가져오기
        vo.setId(getId(session));

        // 댓글 수정 처리
        Integer result = service.update(vo);

        if (result == 1) {
            // 성공 메시지 반환
            return new ResponseEntity<>("댓글이 수정되었습니다.", HttpStatus.OK);
        }

        // 실패 메시지 반환
        return new ResponseEntity<>("댓글이 수정되지 않았습니다.", HttpStatus.BAD_REQUEST);
    }

    // 4. 댓글 삭제 (GET)
    @GetMapping(value = "/delete.do",
            produces = "text/plain; charset=UTF-8")
    public ResponseEntity<String> delete(BoardReplyVO vo, HttpSession session) {
        log.info("delete.do --------------------------------------");

        // 세션에서 사용자 ID 가져오기
        vo.setId(getId(session));

        // 댓글 삭제 처리
        Integer result = service.delete(vo);

        if (result == 1) {
            // 성공 메시지 반환
            return new ResponseEntity<>("댓글이 삭제 되었습니다.", HttpStatus.OK);
        }
        // 실패 메시지 반환
        return new ResponseEntity<>("댓글이 삭제 되지 않았습니다", HttpStatus.BAD_REQUEST);
    }

    // 세션에서 ID를 가져오는 메서드 (현재는 강제 테스트 ID 사용)
    private String getId(HttpSession session) {
        // 테스트용 강제 로그인 처리
        return "test1";
    }
}
