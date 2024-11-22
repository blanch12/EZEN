<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 및 게시글 관리</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
	href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/styles/reset.css?after">
	<link rel="stylesheet" href="/resources/styles/common.css?after">
	<link rel="stylesheet" href="/resources/styles/root.css?after">
	<link rel="stylesheet" href="/resources/styles/main.css?after">
	<link rel="stylesheet" href="/resources/styles/reponsive.css?after">
    <style>
    .dataRow>.card-header{
		background: #e0e0e0;
	}
	.dataRow:hover{
		border-color: #000000;
		cursor: pointer;
	}
	
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
        }

        a {
            color: #333; /* 링크 기본 색상 */
            text-decoration: none; /* 링크 밑줄 제거 */
        }

        a:hover {
            color: #555; /* 호버 시 색상 */
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
        }

        .title {
		    font-size: 1.8rem;
		    font-weight: bold;
		    margin-bottom: 50px; /* 제목과 라인 사이 여백 */
		    border-bottom: 2px solid #000; /* 밑줄 */
		    padding-bottom: 25px; /* 텍스트와 밑줄 사이 간격 추가 */
		    margin-top: 20px; /* 제목 위쪽 여백 추가 */
		}
		.nav-tabs {
		    margin-top: 30px; /* 라인 아래쪽 공간 추가 */
		    display: flex;
		    border-bottom: 2px solid #ccc;
		}
        .nav-tabs a {
            text-decoration: none;
            color: #555;
            padding: 10px 20px;
            margin-right: 10px;
        }

        .nav-tabs a.active {
            font-weight: bold;
            color: #000;
            border-bottom: 2px solid #000;
        }

        .empty-message {
		    margin-top: 20px; /* 이전 30px에서 50px로 늘림 */
		    color: #999;
		    text-align: center;
		    font-size: 1.2rem;
		}
		
		.content-section {
		    margin-top: 20px; /* 기존 20px에서 40px로 증가 */
		}

        .sub-message {
            color: #aaa;
            margin-top: 10px;
        }

        .side-menu ul {
            list-style: none;
            padding: 0;
        }

        .side-menu ul li {
            padding: 10px 0;
        }

        .side-menu ul li a {
            color: #555;
            text-decoration: none;
            font-size: 1.1em;
        }

        .side-menu ul li a:hover {
            color: #000;
        }
        .tab-pane{
        	margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container" style="padding-top: 100px;">
        <h1 class="title">Q&A</h1>
        
        <div class="row">
            <!-- 사이드 메뉴 -->
            <div class="col-md-3 side-menu">
                <ul>
                    <li><a href="/myreview/list.do" class="active">상품 리뷰</a></li>
                    <li><a href="/myorder/list.do">주문내역</a></li>
                    <li><a href="/qna/list.do">Q&A</a></li>
                    <li><a href="/mycoupon/list.do">쿠폰</a></li>
                    <li><a href="/member/points">적립금</a></li>
                    <li><a href="/member/giftcards">상품권</a></li>
                    <li><a href="/member/addr.do">배송지 관리</a></li>
                    <li><a href="/recent/list.do">최근 본 상품</a></li>
                    <li><a href="/member/update.do">개인정보 수정</a></li>
                </ul>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="col-md-9">
                <!-- 탭 -->
                <ul class="nav nav-tabs">
                
				    <li class="nav-item">
				      <a class="nav-link active" data-toggle="tab" href="#QNA">Q&A</a>
				    </li>
				    
				    <li class="nav-item">
				      <a class="nav-link" data-toggle="tab" href="#myQNA">내가 작성한 글</a>
				    </li>
				    
				  </ul>
				
				  <!-- Tab panes -->
				  <div class="tab-content">
				    <div id="QNA" class="container tab-pane active">
				      <form action="list.do" id="searchForm">
						<input type="hidden" name="page" value="1"> <!-- 초기값세팅 -->
						<input type="hidden" name="perPageNum" value="5"> <!-- 초기값세팅 -->
						<div class="row">
							<div class="col-md-8">
					  			<div class="input-group mt-3 mb-3">
									<div class="input-group-prepend">
										<select class="form-control" id="key" name="key">
											<option value="t">제목</option>
									        <option value="c">내용</option>
									        <option value="w">작성자</option>
									        <option value="tc">제목/내용</option>
									        <option value="tw">제목/작성자</option>
									        <option value="cw">내용/작성자</option>
									        <option value="tcw">모두</option>
										</select>
									</div>
						      		<input type="text" class="form-control" placeholder="검색어입력"
					      				id="word" name="word" value="${pageObject.word }">
									<div class="input-group-prepend">
										<button type="submit" class="btn btn-primary">
											<i class="fa fa-search"></i></button>
									</div>
							    </div>
							</div> <!-- end of class="col-md-8" -->
						</div><!-- end of class="row" -->
					</form>
					
		                    <c:forEach items="${list }" var="vo">
						<div class="card dataRow" data-no="${vo.no }"
						style="${(vo.ans == 0)?'margin-top:10px;':''}">
							
							<!-- 작성글(ans==0)이면 상태 출력 -->
							<c:if test="${vo.ans == 0 }">
								<div class="card-header">
								상태 : ${vo.status }
								</div>
							</c:if>
							
							<!-- 작성자 본인 or 관리자만 정보볼 수 있게 -->
							<c:if test="${id == vo.writer || gradeNo == 9 || id == vo.parent_writer || vo.secret == 0}">
								<!-- 작성글: 제목출력 -->
								<c:if test="${vo.ans == 0 }">
									<div class="card-body">
										<pre>${vo.title } <span style="color:gray">${(vo.secret == 1)?'(비공개)':'' }</span></pre>
									</div>
								</c:if>
								<!-- 답글: 제목 앞 답글기호 -->
								<c:if test="${vo.ans == 1 }">
									<div class="card-body" style="background: #E2E1EE">
										<pre> └ ${vo.title } <span style="color:gray">${(vo.secret == 1)?'(비공개)':'' }</span></pre>
									</div>
								</c:if>
							</c:if>
							
							<!-- 작성자 본인X and 일반회원: 비밀글 처리 -->
							<c:if test="${id != vo.writer && gradeNo != 9 && id != vo.parent_writer && vo.secret == 1}">
								<!-- 작성글 -->
								<c:if test="${vo.ans == 0 }">
									<div class="card-body">
										<pre style="color:gray;">비밀글 입니다.</pre>
									</div>
								</c:if>
								<!-- 답글 -->
								<c:if test="${vo.ans == 1 }">
									<div class="card-body" style="background: #E2E1EE">
										<pre style="color:gray;">└ 비밀 답변 입니다.</pre>
									</div>
								</c:if>
							</c:if>
							
							<div class="card-footer">
								<!-- (작성자본인 or 관리자) and 작성글: writer 전체출력 -->
								<c:if test="${(id == vo.writer || gradeNo == 9) && vo.ans == 0 }">
									${vo.writer }
		               			</c:if>
		               			<!-- (작성자본인X and 일반회원) and 작성글: writer 일부가리기 -->
								<c:if test="${(id != vo.writer && gradeNo != 9) && vo.ans == 0}">
									<!-- vo.writer를 절반으로 나눠 halfLength로 지정 -->
									<c:set var="halfLength" value="${fn:length(vo.writer) / 2}" />
			               			 ${fn:substring(vo.writer, 0, halfLength-1)}**${fn:substring(vo.writer, halfLength+1, fn:length(vo.writer))}
								</c:if>
								<!-- 작성일 -->
								<span style="color:gray">
			               			 &emsp;<fmt:formatDate value="${vo.writeDate }"
										pattern="yyyy-MM-dd"/>
								</span>
							</div>
						</div>
					</c:forEach>
					<br>
					
					<!-- 글등록 버튼 -->
					<a href="writeForm.do" class="btn btn-primary">글등록</a>
					<a href="qnaList.do" class="btn btn-secondary pull-right">게시물 더보기 +</a>
				    </div>
				    
				    <div id="myQNA" class="container tab-pane fade">
						<!-- 본인 글 여부 판단 -->
    					<!-- 본인 글 여부 판단 -->
					    <c:set var="hasMyPosts" value="false" />
					    <c:forEach items="${list}" var="vo">
					        <c:if test="${id == vo.writer}">
					            <!-- 본인 글이 있으면 플래그를 true로 설정 -->
					            <c:set var="hasMyPosts" value="true" />
					        </c:if>
					    </c:forEach>
					    
					     <c:if test="${hasMyPosts}">
		                 <c:forEach items="${list }" var="vo">
		                 <c:if test="${id == vo.writer || id == vo.parent_writer}">
						<div class="card dataRow" data-no="${vo.no }"
						style="${(vo.ans == 0)?'margin-top:10px;':''}">
							
							<!-- 작성글(ans==0)이면 상태 출력 -->
							<c:if test="${vo.ans == 0 }">
								<div class="card-header">
								상태 : ${vo.status }
								</div>
							</c:if>
							
							
								<!-- 작성글: 제목출력 -->
								<c:if test="${vo.ans == 0 }">
									<div class="card-body">
										<pre>${vo.title } <span style="color:gray">${(vo.secret == 1)?'(비공개)':'' }</span></pre>
									</div>
								</c:if>
								<!-- 답글: 제목 앞 답글기호 -->
								<c:if test="${vo.ans == 1 }">
									<div class="card-body" style="background: #E2E1EE">
										<pre> └ ${vo.title } <span style="color:gray">${(vo.secret == 1)?'(비공개)':'' }</span></pre>
									</div>
								</c:if>
							
							<div class="card-footer">
								${vo.writer }
								<!-- 작성일 -->
								<span style="color:gray">
			               			 &emsp;<fmt:formatDate value="${vo.writeDate }"
										pattern="yyyy-MM-dd"/>
								</span>
							</div>
						</div>
						</c:if>
					</c:forEach>
					<br>
					<div>
						<pageNav:pageNav listURI="list.do" pageObject="${pageObject}"></pageNav:pageNav>
					</div>
					<!-- 글등록 버튼 -->
					<a href="writeForm.do" class="btn btn-primary">글등록</a>
					</c:if>
					
					 <c:if test="${not hasMyPosts}">
				        <div class="empty-message">
                        작성하신 글이 없습니다.
                        <div class="sub-message">궁금하신 점을 Q&A로 문의해보세요.</div>
                    </div>
				    </c:if>
					<br>
				    </div>
				    
				  </div>
            </div>
        </div>
</div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
        	

            
         // jquery 이벤트 코드는 이안에 작성한다.
        	$(".dataRow").click(function() {
        		// tag에 적힌 data-no="${vo.no}"
        		let no = $(this).data("no");
        		//alert(no);
        		location = "view.do?no=" + no
        			+ "&${pageObject.pageQuery}";
        			// pageObject의 getPageQuery()를 가져와서
        			// page, perPageNum, key, word를 붙인다.
        	});
        	
        	
        	// 검색 데이터 세팅
        	// key 값이 없으면 '제목' 으로 세팅
        	$("#key").val('${(empty pageObject.key)?"t":pageObject.key}');
        	
        		
        	
        });
    </script>
</body>
</html>
