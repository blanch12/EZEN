<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 및 게시글 관리</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
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
		.tabs {
		    margin-top: 30px; /* 라인 아래쪽 공간 추가 */
		    display: flex;
		    border-bottom: 2px solid #ccc;
		}
        .tabs a {
            text-decoration: none;
            color: #555;
            padding: 10px 20px;
            margin-right: 10px;
        }

        .tabs a.active {
            font-weight: bold;
            color: #000;
            border-bottom: 2px solid #000;
        }

        .empty-message {
		    margin-top: 10px; /* 이전 30px에서 50px로 늘림 */
		    color: #999;
		    text-align: center;
		    font-size: 1.2rem;
		}
		
		.content-section {
		    margin-top: 100px; /* 기존 20px에서 40px로 증가 */
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
        
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">리뷰 및 게시글 관리</h1>
        
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
                <div class="tabs">
                    <a href="#available-reviews" class="active">작성 가능한 리뷰 (0)</a>
                    <a href="#written-reviews">작성한 리뷰 (0)</a>
                </div>

                <!-- 작성 가능한 리뷰 -->
                <div id="available-reviews" class="content-section">
                    <div class="empty-message">
                        작성 가능한 리뷰가 없습니다.
                        <div class="sub-message">마음에 드는 상품을 구매하시고, 리뷰를 남겨보세요.</div>
                    </div>
                </div>

                <!-- 작성한 리뷰 -->
                <div id="written-reviews" class="content-section">
                    <div class="empty-message">
                        아직 작성한 리뷰가 없습니다.
                        <div class="sub-message">구매한 상품에 대한 리뷰를 남겨보세요.</div>
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
            $(".tabs a").on("click", function (e) {
                e.preventDefault();

                // 탭 활성화 상태 변경
                $(".tabs a").removeClass("active");
                $(this).addClass("active");

                // 탭에 따라 컨텐츠 변경
                const target = $(this).attr("href");
                $(".content-section").hide(); // 모든 섹션 숨기기
                $(target).show(); // 선택한 섹션만 표시
            });

            // 기본으로 첫 번째 탭의 내용 표시
            $(".content-section").hide();
            $("#available-reviews").show();
        });
    </script>
</body>
</html>
