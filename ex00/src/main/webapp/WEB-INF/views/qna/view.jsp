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

<!-- datepicker: jquery는 bootstrap에서 정의한 라이브러리 사용 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/styles/reset.css?after">
<link rel="stylesheet" href="/resources/styles/common.css?after">
<link rel="stylesheet" href="/resources/styles/root.css?after">
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">
<meta charset="UTF-8">
<title>QnA 글보기</title>
<style>
</style>
<script type="text/javascript">
let id = "${id}";// id를 하드코딩 - member table에 등록된 id중 - 로그인 id
let no = ${vo.no};
let gradeNo = ${gradeNo};
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
	
		$(".card-header").on("change", ".status", function() {
			// 변경된 값을 알아내는 것
			let changeData = $(this).val();
			let data = $(this).data("data");
			console.log("원래데이터=" + data + ", 변경데이터=" + changeData);
			if (changeData == data) {
				$(this).next().find("button").prop("disabled", true);
			}
			else {
				$(this).next().find("button").prop("disabled", false);
			}
		});
		
	
});
</script>
<style>
.rvoCard{
	margin: 0 0 15px 0;
}
.container {
	padding-top : 130px;
}

</style>

</head>
<body>
<div class="container">
<input type="hidden" name="no" value="${vo.no }">
<input type="hidden" name="no" value="${vo.rno }">
<input type="hidden" name="id" value="${vo.id }">
  <h1><i class="fa fa-file-text-o"></i> Q&A</h1><br>
  <div class="card">
  	<!-- 작성자본인X and 일반회원: 비밀글 처리 -->
  	
  	<c:if test="${((id == rvo.writer || gradeNo == 9) || vo.secret == 0) && vo.ans == 1}">
  	<div class="card rvoCard">
  	<div class="card-header">
	  	<b>${rvo.title } <span style="color:gray">${(rvo.secret == 1)?'(비공개)':'' }</span></b> 
	  </div>
	  <div class="card-body">
	  	<div class="card">
			  <div class="card-body">
			    <p class="card-text">
			    	<pre>${rvo.content }</pre>
					</p>
			  </div>
			  <div class="card-body">
		<c:forEach items="${rvo.filename }">
	  	<div class="col-md-3">
	  		<div class="img-thumbnail">
			  <img class="card-img-top" src="${rvo.filename }" alt="image">
	  		</div>
	  		<a href="${rvo.filename}" target="_blank" style="border:1px solid black; margin:5px;">
                    ${rvo.filename}
                </a>
	  		</div>
		</c:forEach>
			  </div>
			</div>
		</div>
	  </div>
  	</c:if>
  	
  	<c:if test="${id != rvo.writer && gradeNo != 9 && id != vo.writer && vo.secret == 1}">
  	<div class="card">
  		<div class="card-header">
	  		<b>비밀글 입니다.</b> 
		</div>
		<div class="card-body">
	  		<div class="card">
				<div class="card-body">
					<p class="card-text">
				    	<pre>비밀글 입니다.</pre>
					</p>
				</div>
			  	<div class="card-footer">
				  	<c:if test="${vo.ans == 0 }">
				  	<c:set var="halfLength" value="${fn:length(vo.writer) / 2}" />
			        ${fn:substring(vo.writer, 0, halfLength-1)}**${fn:substring(vo.writer, halfLength+1, fn:length(vo.writer))}
				  	</c:if>
				  	<c:if test="${vo.ans == 1 }">
				  	Reve
				  	</c:if>
			  	<span style="color:gray">
		           	&emsp;<fmt:formatDate value="${vo.writeDate }"
					pattern="yyyy-MM-dd"/>
				</span>
			  	</div>
			</div>
		</div>
		</div>
  	</c:if>
  	
  	<c:if test="${id == rvo.writer || gradeNo == 9 || id == vo.writer || vo.secret == 0 }">
  	<div class="card">
	  <div class="card-header" style="${(vo.ans==1)?'background:#E2E1EE':''}">
	  <c:if test="${vo.ans == 0 }">
	  	<b>${vo.title } <span style="color:gray">${(vo.secret == 1)?'(비공개)':'' }</span></b> 
	  	</c:if>
	  <c:if test="${vo.ans == 1 }">
	  	<b>└ ${vo.title } <span style="color:gray">${(vo.secret == 1)?'(비공개)':'' }</span></b> 
	  	</c:if>
	  	<c:if test="${gradeNo == 9 && vo.ans == 0 }">
	  	<form action="changeStatus.do">
			<input name="no" value="${param.no }" type="hidden">
			<div class="input-group col-2 pull-right">
			  <select class="form-control status" name="status" data-data="${vo.status }">
			    <option ${(vo.status == "접수")?"selected":"" }>접수</option>
			    <option ${(vo.status == "확인")?"selected":"" }>확인</option>
			    <option ${(vo.status == "처리 중")?"selected":"" }>처리 중</option>
			    <option ${(vo.status == "처리 완료")?"selected":"" }>처리 완료</option>
			  </select>
			  <div class="input-group-append">
			  	<button class="btn btn-success" disabled>변경</button>
			  </div>
			</div>
		</form>
	  	</c:if>
	  </div>
	  <div class="card-body">
	  	<div class="card">
			  <div class="card-body">
			    <p class="card-text">
			    	<pre>${vo.content }</pre>
					</p>
			  </div>
			  <div class="card-body">
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
	  	<c:if test="${vo.ans == 1 }">
	  	Reve
	  	</c:if>
	  	<c:if test="${vo.ans == 0 }">
	  	${vo.writer}
	  	</c:if>
	  	<span style="color:gray">
           	&emsp;<fmt:formatDate value="${vo.writeDate }"
			pattern="yyyy-MM-dd"/>
		</span>
	  </div>
	  </div>
	  </c:if>
	</div>
	<!-- a tag : 데이터를 클릭하면 href 정보를 가져와서 페이지이동 -->
		<a href="list.do?no=${param.no }&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
			class="btn btn-info">리스트</a>
	<c:if test="${gradeNo == 9 || id == vo.writer }">
		<a href="updateForm.do?no=${param.no }" class="btn btn-secondary">수정</a>
		<form action="delete.do?no=${param.no }" method="post"  style="display:inline;">
		<button class="btn btn-danger" id="deleteBtn">삭제</button>
		</form>
		<c:if test="${gradeNo == 9 && vo.ans == 0}">
			<a href="writeReplyForm.do?no=${param.no }" class="btn btn-warning">답글 작성</a>
		</c:if>
	</c:if>
	
</div> <!-- end of class="container" -->
</body>
</html>