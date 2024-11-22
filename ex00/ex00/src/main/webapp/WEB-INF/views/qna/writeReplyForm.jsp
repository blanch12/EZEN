<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery UI 스타일 및 스크립트 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>

<!-- 커스텀 스타일 -->

<link rel="stylesheet" href="/resources/styles/reset.css?after">
<link rel="stylesheet" href="/resources/styles/common.css?after">
<link rel="stylesheet" href="/resources/styles/root.css?after">
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">
<meta charset="UTF-8">
<title>QnA 글보기</title>
<script type="text/javascript">
let id = "${id}";// id를 하드코딩 - member table에 등록된 id중 - 로그인 id
let no = ${vo.no};
let gradeNo = ${gradeNo}
</script>
<style>
form {
	margin: 30px 0 0 0;
}
</style>
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
<div class="container" style="padding-top: 150px;">
<input type="hidden" name="id" value="${vo.id }">
  <h1><i class="fa fa-file-text-o"></i> QnA 답변 쓰기</h1>
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
	</div><!-- 글정보 -->
	<form action="writeReply.do" method="post" enctype="multipart/form-data">
  	<input type="hidden" name="page" value="${pageObject.page}">
  	<input type="hidden" name="perPageNum" value="${pageObject.perPageNum}">
  	<input type="hidden" name="no" value="${param.no }">
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title"
      	pattern="^[^ .].{2.99}$" required
      	title="맨앞에 공백문자 불가, 3~100자입력"
       placeholder="제목 입력" name="title">
    </div>
    <div class="form-group">
      <label for="content">내용</label>
      <textarea class="form-control" rows="7" id="content" required
      	name="content" placeholder="내용 입력"></textarea>
    </div>
    <div class="form-group">
      <label for="imageName">첨부이미지</label>
      <input type="file" class="form-control" id="imageName"
      	name="imageName">
    </div>
    <div class="custom-control custom-checkbox mb-3">
      <input type="checkbox" class="custom-control-input" id="secretCheck" name="secret"
      value="1" ${(vo.secret == 1)?"checked":"" }>
      <label class="custom-control-label" for="customCheck">비밀 글</label>
    </div>
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="reset" class="btn btn-secondary">새로입력</button>
    <button type="button" class="btn btn-success" onclick="history.back();"
    	id="cencelBtn">취소</button>
  </form>
	
</div> <!-- end of class="container" -->
</body>
</html>