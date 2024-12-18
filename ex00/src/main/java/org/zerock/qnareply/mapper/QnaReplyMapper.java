package org.zerock.qnareply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.qnareply.vo.QnaReplyVO;
import org.zerock.util.page.PageObject;

@Repository
public interface QnaReplyMapper {

	// 1-1  getTotalRow
	// mybatis에서 데이터 베이스 처리로 파라메터를 넘기는 개수는 1개입니다.
	// 2개의 자료형을 넘기고 싶을 때 하나로 만드는 작업이 필요합니다.
	// 그때 사용하는 어노테이션은 @Param 입니다.
	// @Param 은 자료형을 map (key, value) 으로 만들어 줍니다.
	public Long getTotalRow(
		@Param("pageObject") PageObject pageObject,
		@Param("no") Long no);
	// 1-2. list
	public List<QnaReplyVO> list(
		@Param("pageObject") PageObject pageObject,
		@Param("no") Long no);
	// 2. write
	public Integer write(QnaReplyVO vo);// no, content, id
	// 3. update
	public Integer update(QnaReplyVO vo);// rno, content, id
	// 4. delete
	public Integer delete(QnaReplyVO vo);// rno, id
}
