<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송지 관리</title>
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
		
		/* 기본 버튼 스타일 */
		/* 버튼 기본 배경색 및 텍스트 색상 */
		.btn-primary {
		    background-color: #4e73df; /* 파란색 버튼 배경 */
		    color: white; /* 버튼 텍스트 색상 */
		}
		
		/* 버튼 호버 시 배경색 변경 */
		.btn-primary:hover {
		    background-color: #375a7f; /* 어두운 파란색으로 변경 */
		}
		
		/* 레이아웃 */
		/* 전체 컨테이너 스타일 */
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
		
		/* 메인 콘텐츠 스타일 */
		/* 메인 콘텐츠 공간 정의 */
		.main-content {
		    flex: 1; /* 남은 공간을 차지하도록 설정 */
		    margin-left: 5px; /* 사이드 메뉴와 간격 추가 */
		}
		
		/* 테이블 스타일 */
		.table {
		    margin-top: 0; /* 테이블의 위쪽 여백 제거 */
		    border-collapse: collapse; /* 테이블 경계선 중복 제거 */
		    width: 100%; /* 테이블 너비 */
		}
			
		/* 테이블 셀 기본 스타일 */
		/* 헤더 및 셀 간격, 경계선 설정 */
		.table th, .table td {
		    vertical-align: middle; /* 셀의 내용 수직 중앙 정렬 */
		    border: 1px solid #dee2e6; /* 셀 경계선 색상 */
		    padding: 10px; /* 셀 내부 여백 */
		    text-align: center; /* 텍스트 중앙 정렬 */
		    border-left: none; /* 왼쪽 테두리 제거 */
    		border-right: none; /* 오른쪽 테두리 제거 */
		}
		
		/* 테이블 헤더 스타일 */
		/* 테이블 헤더 배경색 및 글씨 스타일 */
		.table thead th {
		    background-color: #f8f9fa; /* 연한 회색 배경 */
		    font-weight: bold; /* 굵은 글씨 */
		    text-align: center; /* 텍스트 중앙 정렬 */
		    padding: 10px; /* 헤더 내부 여백 */
		    border-left: none; /* 왼쪽 테두리 제거 */
    		border-right: none; /* 오른쪽 테두리 제거 */
		}
		
		/* 데이터가 없을 경우 표시되는 메시지 스타일 */
		/* 빈 데이터 메시지 */
		.no-data {
		    text-align: center; /* 텍스트 중앙 정렬 */
		    color: #333; /* 텍스트 색상: 진한 회색 */
		    font-size: 1rem; /* 텍스트 크기 */
		    font-weight: 500; /* 텍스트 두께 */
		    padding: 20px; /* 내부 여백 */
		}
		
		/* 정보 박스 스타일 */
		/* 추가 설명 박스 디자인 */
		.info-box {
		    background-color: #f8f9fa; /* 연한 회색 배경 */
		    padding: 15px; /* 내부 여백 */
		    margin-top: 30px; /* 위쪽 간격 */
		    border-radius: 5px; /* 모서리를 둥글게 설정 */
		}
		
		/* 정보 박스 제목 스타일 */
		.info-box h5 {
		    font-weight: bold; /* 굵은 글씨 */
		}
		
		/* 버튼 스타일 */
		.register-btn button {
		    background-color: #333; /* 검정색 배경 */
		    color: #fff; /* 흰색 텍스트 */
		    border: none; /* 버튼 테두리 제거 */
		    padding: 10px 20px; /* 버튼 내부 여백 */
		}
		/* 제목 스타일 수정 */
		.label {
		    font-size: 1.8rem; /* 제목 폰트 크기 */
		    font-weight: bold; /* 굵은 텍스트 */
		    border-bottom: 2px solid #000; /* 제목 아래 선 */
		    padding-bottom: 10px; /* 제목과 아래 선 사이 간격 */
		    margin-bottom: 0; /* 제목의 아래 여백 제거 */
		    margin-top: 20px; /* 제목의 위쪽 여백 */
		}	
</style>
</head>
<body>

<div class="container" style="padding-top: 100px;">
	<h1 class="title">배송지 관리</h1>
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
    <h1 class="label">배송지 관리</h1>  
        <table class="table">
            <thead>
                <tr>
                    <th>배송지명</th>
                    <th>수령인</th>
                    <th>전화번호</th>
                    <th>주소</th>
                    <th>수정</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty addrs}">
                        <c:forEach var="addr" items="${addrs}">
                            <tr style="<c:if test='${addr.isDefault == "Y"}'>background-color: #E0F7FA;</c:if>">
                                <td>${addr.addrName}</td>
                                <td>${addr.recipientName}</td>
                                <td>${addr.phoneNumber}</td>
                                <td>${addr.fullAddr}</td>
                                <td><a href="/member/addr/edit?id=${addr.id}">수정</a></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
				            <td colspan="7" class="no-data">등록된 주소가 없습니다.</td>
				        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        
		<div class="register-btn text-center mt-4">
	        <button class="btn btn-dark btn-lg" onclick="window.location.href='/member/addrForm.do'">배송지 등록</button>
	    </div>
	    
        <div class="d-flex justify-content-end mt-3">
            <button class="btn btn-outline-secondary" onclick="window.location.href='http://localhost/member/view.do'">뒤로가기</button>
        </div>

        <div class="info-box">
            <h5>배송 주소록 유의사항</h5>
            <p>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</p>
            <p>자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</p>
            <p>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</p>
        </div>
    </div>
  </div>
</div>
</body>
</html>
