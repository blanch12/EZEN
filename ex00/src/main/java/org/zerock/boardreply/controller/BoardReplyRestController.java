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

	// 자동DI
	@Autowired
	@Qualifier("boardReplyServiceImpl")
	private BoardReplyService service;
	
	// 1.리스트 - get
	@GetMapping(value = "/list.do",
			produces = {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE
			})

	public ResponseEntity<Map<String, Object>> 
		list(PageObject pageObject, Long no) {
		log.info("list - page : " + pageObject.getPage() + ", no : " + no);

		List<BoardReplyVO> list = service.list(pageObject, no);
		
		// 데이터를 전달할 map 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageObject", pageObject);
		
		log.info("After map : " + map);
				
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	// 2. 일반게시판 댓글 쓰기 - write - post
	@PostMapping(value = "/write.do",
			consumes = "application/json", 
			produces = "text/plain; charset=UTF-8"
			)

	public ResponseEntity<String> write(@RequestBody BoardReplyVO vo, HttpSession session) {

		vo.setId(getId(session));
		
		// 댓글 등록 처리
		service.write(vo);
				
		return new ResponseEntity<String>("댓글 등록이 완료되었습니다.", HttpStatus.OK);
	}
	
	// 3. 일반게시판 댓글 수정 - update - post
	@PostMapping(value = "/update.do",
			consumes = "application/json", 
			produces = "text/plain; charset=UTF-8"
			)
	public ResponseEntity<String> update(@RequestBody BoardReplyVO vo, HttpSession session) {
		log.info("update.do ---------------------------------");
		
		// 로그인 되어야 사용 가능
		vo.setId(getId(session));
		
		// 수정 처리
		Integer result = service.update(vo);
		
		if (result == 1) {
			return new ResponseEntity<String>("댓글이 수정되었습니다.", HttpStatus.OK);
		}
		
		return new ResponseEntity<String>("댓글이 수정되지 않았습니다.", HttpStatus.BAD_REQUEST);
	}
	
	// 4. 일반 게시판 댓글 삭제 - delete - get
	@GetMapping(value = "/delete.do",
			produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> delete(BoardReplyVO vo, HttpSession session) {
		log.info("delete.do --------------------------------------");
		
		// 로그인 되어야 삭제할 수 있다.
		vo.setId(getId(session));
		
		// 삭제 처리
		Integer result = service.delete(vo);
		
		if (result == 1) {
			return new ResponseEntity<String>("댓글이 삭제 되었습니다.", HttpStatus.OK);
		}
		return new ResponseEntity<String>("댓글이 삭제 되지 않았습니다", HttpStatus.BAD_REQUEST);
	}
	
	
	private String getId(HttpSession session) {
		// LoginVO vo = (LoginVO) session.getAttribute("login");
		// String id = vo.getId();
		// 강제 로그인 처리를 합니다. - 테스트를 위해서
		return "test1";
	}
	
	
}








