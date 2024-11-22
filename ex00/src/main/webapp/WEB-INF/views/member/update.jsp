<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    /* 기본 스타일 */
		/* 전체 페이지의 폰트를 Arial로 설정 */
		body {
		    font-family: Arial, sans-serif;
		}
		
		/* 링크 기본 색상 및 밑줄 제거 */
		a {
		    color: #333; /* 기본 링크 색상: 진한 회색 */
		    text-decoration: none; /* 링크 밑줄 제거 */
		}
		
		/* 링크에 마우스를 올렸을 때 색상 변경 */
		a:hover {
		    color: #555; /* 호버 시 색상: 더 밝은 회색 */
		}
	    /* 수정 버튼 스타일 (흰색) */
	    .btn-custom.btn-primary {
	        background-color: #ffffff; /* 흰색 배경 */
	        color: #333; /* 텍스트 색은 어두운 색 */
	        border: 1px solid #ccc; /* 테두리 색 */
	    }
	
	    .btn-custom.btn-primary:hover {
	        background-color: #f8f9fa; /* 호버 시 배경색 */
	        color: #333; /* 호버 시 텍스트 색 */
	    }
	
	    /* 탈퇴 버튼 스타일 (검은색) */
	    .btn-custom.btn-danger {
	        background-color: #000000; /* 검은색 배경 */
	        color: #ffffff; /* 텍스트 색은 흰색 */
	        border: 1px solid #000000; /* 검은색 테두리 */
	    }
	
	    .btn-custom.btn-danger:hover {
	        background-color: #444444; /* 호버 시 어두운 회색 배경 */
	        color: #ffffff; /* 호버 시 텍스트 색 */
	    }
	    
		.container {
		    max-width: 1200px; /* 최대 너비를 1200px로 제한 */
		    margin: 50px auto; /* 수직으로 50px 간격, 수평 중앙 정렬 */
		}
		
		/* 제목 스타일 */
		/* 페이지 제목 디자인 */
		.title {
		    font-size: 1.8rem; /* 제목 폰트 크기 */
		    font-weight: bold; /* 제목 굵게 */
		    margin-bottom: 50px; /* 아래쪽 여백 */
		    border-bottom: 2px solid #000; /* 제목 하단에 검은색 선 추가 */
		    padding-bottom: 25px; /* 제목 하단 여백 */
		    margin-top: 20px; /* 위쪽 여백 */
		}
		
		/* 사이드 메뉴 스타일 */
		/* 리스트의 기본 스타일 제거 */
		.side-menu ul {
		    list-style: none; /* 불릿 포인트 제거 */
		    padding: 0; /* 패딩 제거 */
		}
		
		/* 사이드 메뉴 아이템 간격 조정 */
		.side-menu ul li {
		    padding: 10px 0; /* 각 항목 위아래로 10px 간격 추가 */
		}
		
		/* 사이드 메뉴 링크 기본 스타일 */
		.side-menu ul li a {
		    color: #555; /* 기본 링크 색상 */
		    text-decoration: none; /* 링크 밑줄 제거 */
		    font-size: 1.1em; /* 링크 텍스트 크기 */
		}
		
		/* 사이드 메뉴 링크에 마우스를 올렸을 때 색상 변경 */
		.side-menu ul li a:hover {
		    color: #000; /* 호버 시 색상: 검정 */
		}

        .main-content {
            flex: 1; /* 남은 공간 차지 */
            margin-left: 20px; /* 사이드 메뉴와 간격 추가 */
        }
		.card-footer {
		    display: flex;
		    justify-content: center; /* 버튼들을 가로로 정렬 */
		    align-items: center; /* 버튼들을 세로로 정렬 */
		    position: relative; /* 상대 위치 지정 */
		    background-color: white;
		}
        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #e9ecef;
        }

        .info-label {
            font-weight: bold;
            color: #666;
            width: 30%;
        }

        .info-value {
            color: #333;
            font-size: 1em;
            width: 70%;
            text-align: right;
        }

        .badge-secondary {
            background-color: #6c757d;
            color: white;
            padding: 5px 10px;
            border-radius: 12px;
            font-size: 0.9em;
        }

        .info-box {
            background-color: #f8f9fa; /* 안내 박스 회색 배경 */
            padding: 15px;
            margin-top: 0; /* 테이블의 위쪽 여백 제거 */
            border-radius: 5px;
        }

        .info-box h5 {
            font-weight: bold;
        }
        
        /* 탈퇴 모달 스타일 */
	    .modal-content {
	        background-color: #f8f9fa;
	        color: #333;
	    }
	    .modal-header {
	        border-bottom: none;
	    }
		
		.center-buttons {
		    display: flex;
		    gap: 5px; /* 수정과 탈퇴 버튼 사이의 간격 */
		}
		
		.cancel-button {
			margin-right: 10px;
		    position: absolute;
		    right: 0; /* 취소 버튼을 카드 푸터의 오른쪽으로 이동 */
		}
		.main-content h2 {
		    font-size: 2rem !important; /* 글씨 크기 */
		    font-weight: bold !important; /* 글씨 굵게 */
		    margin-bottom: 20px !important; /* 제목 아래 여백 추가 */
		    color: #333 !important; /* 글씨 색상 */
		}
		.label {
		    font-size: 1.8rem; /* 제목 폰트 크기 */
		    font-weight: bold; /* 굵은 텍스트 */
		    border-bottom: 2px solid #000; /* 제목 아래 선 */
		    padding-bottom: 10px; /* 제목과 아래 선 사이 간격 */
		    margin-bottom: 0; /* 제목의 아래 여백 제거 */
		    margin-top: 20px; /* 제목의 위쪽 여백 */
		}	
        
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
		$(function() {
		    $("#deleteBtn").click(function(){
		        $("#pw").val("");
		        $("#deleteModal").modal("show");
		    });
		    
		    $("#deleteCancelBtn").click(function(){
		        $("#pw").val("");
		        $("#deleteModal").modal("hide");
		    });
		    document.getElementById("deleteBtn").onclick = function() {
		        $("#deleteModal").modal("show");
		    };
		});
	</script>
    
</head>
<body>

<div class="container">
	<h1 class="title">회원정보</h1>
	<div class="row">
    <!-- 사이드 메뉴 -->
    <div class="col-md-3 side-menu">
        <ul>
            <li><a href="/myreview/list.do">상품 리뷰</a></li>
            <li><a href="/myorder/list.do">주문내역</a></li>
            <li><a href="/qna/list.do">Q&A</a></li>
            <li><a href="/mycoupon/list.do">쿠폰</a></li>
            <li><a href="/myrate/list.do">적립금</a></li>
            <li><a href="/mygiftcard/list.do">상품권</a></li>
            <li><a href="/member/addr.do">배송지 관리</a></li>
            <li><a href="/recent/list.do">최근 본 상품</a></li>
            <li><a href="/member/update.do">개인정보 수정</a></li>
        </ul>
    </div>

    <!-- 메인 콘텐츠 -->
    <div class="col-md-9 main-content">
    	<h1 class="label">${vo.name}님</h1>
        <div class="info-box">
            <div class="info-row">
                <div class="info-label">성별</div>
                <div class="info-value">${vo.gender}</div>
            </div>
            <div class="info-row">
                <div class="info-label">생년월일</div>
                <div class="info-value"><fmt:formatDate value="${vo.birth}" pattern="yyyy-MM-dd"/></div>
            </div>
            <div class="info-row">
                <div class="info-label">연락처</div>
                <div class="info-value">${vo.tel}</div>
            </div>
            <div class="info-row">
                <div class="info-label">이메일</div>
                <div class="info-value">${vo.email}</div>
            </div>
            <div class="info-row">
                <div class="info-label">가입일</div>
                <div class="info-value"><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/></div>
            </div>
            <div class="info-row">
                <div class="info-label">최근접속일</div>
                <div class="info-value"><fmt:formatDate value="${vo.conDate}" pattern="yyyy-MM-dd"/></div>
            </div>
            <div class="info-row">
                <div class="info-label">회원등급</div>
                <div class="info-value"><span class="badge badge-secondary">${vo.gradeName}</span></div>
            </div>
            <div class="info-row">
                <div class="info-label">회원상태</div>
                <div class="info-value">${vo.status}</div>
            </div>
        </div>
        <div class="card-footer d-flex">
		    <div class="center-buttons">
		        <c:if test="${vo.id == login.id }">
		            <a href="/member/updateForm.do?id=${vo.id }" class="btn btn-primary btn-custom">수정</a>
		            <button type="button" class="btn btn-danger btn-custom" id="deleteBtn">탈퇴</button>
		        </c:if>
		    </div>
		    <button onclick="window.location.href='http://localhost/member/view.do'" class="btn btn-secondary btn-custom cancel-button">취소</button>
		</div>
          
    </div>
  </div>
</div>
<!-- 탈퇴 확인 모달 -->
<div class="modal fade" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">탈퇴를 위한 비밀번호 입력</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="/member/delete.do" method="post" id="deleteForm">
                    <input type="hidden" name="id" value="${vo.id}">
                    <label>비밀번호 입력:</label>
                    <input type="password" name="pw" required maxlength="20" pattern="^.{3,20}$" title="3~20자 입력 가능" placeholder="비밀번호" class="form-control mb-3">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" form="deleteForm" class="btn btn-danger">탈퇴하기</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
