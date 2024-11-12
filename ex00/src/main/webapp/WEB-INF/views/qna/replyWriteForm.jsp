<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 글보기</title>

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
	  	<div class="col-md-3">
	  		<div class="img-thumbnail">
			  <img class="card-img-top" src="${vo.filename }" alt="image">
	  		</div>
	  		<a href="${vo.filename }" style="border:1px solid black;" download>${vo.filename }</a>
	  		</div>
			  </div>
			</div>
		</div>
	  <div class="card-footer">
	  	<span class="float-right">${vo.writeDate }</span>
	  	${vo.writer}
	  </div>
	</div>
	<!-- a tag : 데이터를 클릭하면 href 정보를 가져와서 페이지이동 -->
	
  <form action="/qnareply/write.do" method="post" enctype="multipart/form-data">
  	<input type="hidden" id="replyRno">
  	<input type="hidden" name="perPageNum" value="${param.perPageNum }">
    <div class="form-group">
      <label for="replyContent">내용</label>
      <textarea class="form-control" rows="7" id="content" required
      	name="replyContent" placeholder="내용 입력"></textarea>
    </div>
<!--     <div class="form-group"> -->
<!--       <label for="imageName">첨부이미지</label> -->
<!--       <input type="file" class="form-control" id="imageName" -->
<!--       	name="imageName"> -->
<!--     </div> -->
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="reset" class="btn btn-secondary">새로입력</button>
    <button type="button" class="btn btn-success" onclick="history.back();"
    	id="cencelBtn">취소</button>
  </form>
</div> <!-- end of class="container" -->


</body>
</html>