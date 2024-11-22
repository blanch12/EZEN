<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap 스타일 및 스크립트 -->
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
<title>마이페이지 - ${vo.name}님</title>
<style>
    .container {
        max-width: 1200px;
        margin: 20px auto;
    }
    .profile-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .profile-summary h1 {
        font-size: 3em;
        font-weight: bold;
        margin-top: 10px;
        color: #333;
    }
    .side-menu {
        margin-top: 20px;
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
    .order-status {
        margin-top: 30px;
    }
    .order-status h3 {
        font-size: 1.5em;
        font-weight: bold;
        margin-bottom: 20px;
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
    }
    .order-status div {
        display: inline-block;
        width: 20%;
        font-size: 1.1em;
    }
    /* 회색 박스 스타일 */
    .grade-badge {
        background-color: #f0f0f0;
        color: #555;
        padding: 5px 10px;
        border-radius: 5px;
        font-size: 0.9em;
        font-weight: bold;
    }
</style>
</head> 
<body>
<div class="container" style="padding-top: 200px;">
    <!-- 회원 프로필 섹션 -->
    <div class="profile-header">
        <div class="profile-summary">
            <h1>${vo.name}님은 레브 <span class="grade-badge">${vo.gradeName}</span>입니다.</h1>
        </div>
    </div>
    
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

        <!-- 주문 처리 현황 -->
        <div class="col-md-9">
            <div class="order-status">
                <h3>나의 주문처리 현황 <small>(최근 3개월 기준)</small></h3>
                <hr>
                <div>입금 전 <strong>0</strong></div>
                <div>배송 준비 중 <strong>0</strong></div>
                <div>배송 중 <strong>0</strong></div>
                <div>배송 완료 <strong>0</strong></div>
            </div>
            <div class="text-right mt-3">
                <button class="btn btn-secondary">취소/교환/반품 내역</button>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
