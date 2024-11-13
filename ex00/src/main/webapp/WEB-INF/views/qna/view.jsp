<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 글보기</title>
<script type="text/javascript">
let id = "${id}";// id를 하드코딩 - member table에 등록된 id중 - 로그인 id
let no = ${vo.no};
let gradeNo = ${gradeNo}
let replyPage = 1; // 댓글의 현재 페이지
console.log("전역변수 no : " + no);
console.log("id : " +id);
</script>
<!-- 2. 날짜 및 시간 처리함수 선언 -->
<script type="text/javascript" src="/js/dateTime.js"></script>

<!-- 댓글 페이지네이션 함수 선언 -->
<script type="text/javascript" src="/js/util.js"></script>

<!-- 3. 댓글 객체 (replySerive) 를 선언 : Ajax 처리부분 포함 -->
<!-- 댓글 처리하는 모든 곳에 사용하는 부분을 코딩 -->
<script type="text/javascript" src="/js/qnaReply.js"></script>
<script type="text/javascript" src="/js/qnaReplyProcess.js"></script>
<!-- 2.라이브러리 확인 -->
<script type="text/javascript">
// jquery: $(ducument).ready(function(){~~~});
// 페이지가 로딩완료 후 세팅이 진행된다.
$(function(){
	console.log("jquery loading......");
	
	$('[data-toggle="tooltip"]').tooltip();   
	
	$("#deleteBtn").click(function(){
		console.log("deleteBtn event......");
		if (!confirm("정말삭제하시겠습니까?")) return false;
	});
	
	
	
});
</script>


</head>
<body>
<div class="container">
<input type="hidden" name="id" value="${vo.id }">
  <h1><i class="fa fa-file-text-o"></i> QnA 글보기</h1>
  <div class="card">
	  <div class="card-header">
	  	<b>${vo.title }</b> 
	  </div>
	  <div class="card-body">
	  	<div class="card">
			  <div class="card-body">
			    <p class="card-text">
			    	<pre>${vo.content }</pre>
					</p>
		<c:forEach items="${vo.filename }">
	  	<div class="col-md-3">
	  		<div class="img-thumbnail">
			  <img class="card-img-top" src="${vo.filename }" alt="image">
	  		</div>
	  		<a href="${vo.filename}" target="_blank" style="border:1px solid black; margin:5px;">
                    ${vo.filename}
                </a>
	  		</div>
		</c:forEach>
			  </div>
			</div>
		</div>
	  <div class="card-footer">
	  	<span class="float-right"><fmt:formatDate value="${vo.writeDate }" pattern="yyyy년 MM월 dd일"/></span>
	  	${vo.writer}
	  </div>
	</div>
	<!-- a tag : 데이터를 클릭하면 href 정보를 가져와서 페이지이동 -->
	<form action="delete.do?no=${param.no }" method="post">
	<button class="btn btn-danger" id="deleteBtn">삭제</button>
	</form>
	<a href="list.do?no=${param.no }&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
		class="btn btn-info">리스트</a>
	<a href="updateForm.do?no=${param.no }" class="btn btn-secondary">수정</a>
		<div>
		<jsp:include page="qnareply.jsp"></jsp:include>
	</div>
	
	
</div> <!-- end of class="container" -->
</body>
</html>