<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>적립금</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        a {
            color: #333;
            text-decoration: none;
        }

        a:hover {
            color: #555;
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
        }

        .title {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 50px;
            border-bottom: 2px solid #000;
            padding-bottom: 25px;
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

        .main-content {
            padding-left: 20px;
        }

        .summary-box {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    background-color: #000;
		    color: #fff;
		    padding: 20px;
		    margin-bottom: 30px;
		    height: 120px; /* 높이를 고정으로 설정 */
		}
		
		.summary-item {
		    text-align: center;
		    flex: 1;
		}
		
		.summary-item .label {
		    font-size: 0.9rem;
		    color: #ccc;
		    margin-bottom: 5px;
		}
		
		.summary-item .value {
		    font-size: 1.5rem;
		    font-weight: bold;
		}

		.divider {
		    width: 1px;
		    height: 40px;
		    background-color: #333;
		    margin: 0 10px;
		}


        .tabs {
        	display: flex;
            border-bottom: 3px solid #000;
            margin-bottom: 30px;
            justify-content: flex-start; /* 왼쪽 정렬 */
        }

        .tabs .nav-link {
		    flex: none; /* 버튼 너비 고정 */
		    width: 200px; /* 버튼의 가로 길이를 고정 */
		    text-align: center; /* 텍스트 중앙 정렬 */
		    padding: 10px 20px; /* 상하 패딩만 적용 */
		    font-size: 1rem; /* 글자 크기 */
		    background-color: #f9f9f9; /* 기본 배경색 */
		    color: #000; /* 텍스트 색상 */
		    border-right: 1px solid #ddd; /* 버튼 사이 구분선 */
		    border-bottom: none; /* 아래쪽 테두리 제거 */
		    text-decoration: none; /* 링크 밑줄 제거 */
		}

		.tabs {
		    display: flex;
		    justify-content: flex-start; /* 버튼들을 왼쪽 정렬 */
		    border-bottom: 3px solid #000;
		    margin-bottom: 30px;
		}

		
		.tabs .nav-link:last-child {
		    border-right: none; /* 마지막 버튼은 오른쪽 테두리 제거 */
		}
		
		.tabs .nav-link.active {
		    background-color: #000; /* 활성화된 버튼 배경색 */
		    color: #fff; /* 활성화된 버튼 텍스트 색상 */
		    font-weight: bold; /* 강조 */
		    border-bottom: 3px solid #000; /* 활성화된 버튼 아래 굵은 라인 */
		}

        .info-section {
            margin-bottom: 30px;
        }

        .info-section h5 {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .info-section p {
            line-height: 1.5;
            font-size: 1rem;
            color: #555;
        }

        .table-container {
            margin-top: 30px;
        }

        .table-container h5 {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 15px;
            border-bottom: 2px solid #000;
            padding-bottom: 5px;
        }

        .table th, .table td {
            text-align: center;
            padding: 10px;
        }

        .no-data {
            text-align: center;
            font-size: 1rem;
            color: #999;
        }
    </style>
</head>
<body>
    <div class="container" style="padding-top: 100px;">
        <h1 class="title">적립금</h1>
        <div class="row">
            <!-- 사이드 메뉴 -->
            <div class="col-md-3 side-menu">
                <ul>
                    <li><a href="/myreview/list.do" class="active">상품 리뷰</a></li>
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
                <!-- 적립금 요약 -->
                <div class="summary-box">
				    <div class="summary-item">
				        <div class="label">사용가능한 적립금</div>
				        <div class="value">0원</div>
				    </div>
				    <div class="divider"></div>
				    <div class="summary-item">
				        <div class="label">총 적립금</div>
				        <div class="value">0원</div>
				    </div>
				    <div class="divider"></div>
				    <div class="summary-item">
				        <div class="label">사용 적립금</div>
				        <div class="value">0원</div>
				    </div>
				    <div class="divider"></div>
				    <div class="summary-item">
				        <div class="label">미사용 적립금</div>
				        <div class="value">0원</div>
				    </div>
				    <div class="divider"></div>
				    <div class="summary-item">
				        <div class="label">환불예정 적립금</div>
				        <div class="value">0원</div>
				    </div>
				</div>

                <!-- 탭 -->
                <div class="tabs">
				    <a href="#" class="nav-link active" onclick="activateTab(this)">적립내역보기</a>
				    <a href="#" class="nav-link" onclick="activateTab(this)">미사용적립내역보기</a>
				    <a href="#" class="nav-link" onclick="activateTab(this)">미사용쿠폰/회원등급적립내역</a>
				</div>

                <!-- 적립금 안내 -->
                <div class="info-section">
                    <h5>적립금 안내</h5>
                    <p>
                        주문으로 발생한 적립금은 배송완료 후 14일 부터 실제 사용 가능한 적립금으로 전환됩니다.
                        배송완료 시점으로부터 14일 동안은 미사용 적립금으로 분류됩니다.
                    </p>
                    <p>
                        사용가능 적립금 - 사용된 적립금<br>
                        미사용적립금은 상품 구매 시 바로 사용 가능한 적립금입니다.
                    </p>
                    <p>* 적립금은 지급 후 1년 이내 사용 가능합니다.</p>
                </div>

                <!-- 적립내역 -->
                <div class="table-container">
                    <h5>적립내역보기</h5>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>주문날짜</th>
                                <th>적립금</th>
                                <th>관련주문</th>
                                <th>적립내용</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="4" class="no-data">적립금 내역이 없습니다.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
    function activateTab(clickedTab) {
        // 모든 탭의 active 클래스 제거
        const tabs = document.querySelectorAll('.tabs .nav-link');
        tabs.forEach((tab) => {
            tab.classList.remove('active');
        });

        // 클릭된 탭에 active 클래스 추가
        clickedTab.classList.add('active');
    }
</script>
</body>
</html>
