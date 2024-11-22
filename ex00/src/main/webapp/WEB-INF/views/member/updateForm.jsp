<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <!-- Bootstrap CSS -->
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
<link rel="stylesheet" href="/resources/styles/main.css?after">
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">
    <style>
	     /* 링크 기본 색상 변경 */
	    a {
	        color: #333; /* 원하는 색상으로 변경 */
	        text-decoration: none; /* 링크 밑줄 없애기 */
	    }
	    a:hover {
	        color: #555; /* 원하는 호버 색상으로 변경 */
	    }
	
	    /* 버튼 텍스트 색상 변경 */
	    .btn-primary {
	        background-color: #4e73df; /* 기본 배경색 */
	        color: white; /* 버튼 텍스트 색상 */
	    }
	    .btn-primary:hover {
	        background-color: #375a7f;
	    }
        /* 전체 배경 스타일 */
        body {
            background-color: #f8f9fc;
            font-family: 'Arial', sans-serif;
        }

        /* 컨테이너 및 카드 스타일 */
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
            background: linear-gradient(to right, #ffffff, #f3f4f6);
        }

        .card-title {
            font-size: 1.8em;
            font-weight: bold;
            text-align: center;
            color: #495057;
            margin-bottom: 25px;
        }

        /* 입력 필드 및 라벨 스타일 */
        .form-group label {
            font-weight: 600;
            color: #495057;
        }

        .form-control {
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            font-size: 1em;
            background-color: #f9fafb;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .form-control:focus {
            background-color: #fff;
            border-color: #86b7fe;
            box-shadow: 0 0 10px rgba(78, 115, 223, 0.3);
        }

        /* 성별 라디오 버튼 스타일 */
        .form-check-inline {
            display: inline-block;
            margin-right: 20px;
            font-weight: 500;
        }

        /* 버튼 스타일 */
        .btn-custom {
            padding: 12px;
            font-weight: bold;
            border-radius: 10px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #4e73df;
            color: white;
            border: none;
        }
        .btn-primary:hover {
            background-color: #375a7f;
        }

        .btn-secondary {
            background-color: #1cc88a;
            color: white;
            border: none;
        }
        .btn-secondary:hover {
            background-color: #17a673;
        }

        .btn-warning {
            background-color: #f6c23e;
            color: white;
            border: none;
        }
        .btn-warning:hover {
            background-color: #dda20a;
        }

        /* 비밀번호 확인 경고 메시지 */
        .alert {
            font-size: 0.9em;
            margin-top: 5px;
            color: #e74a3b;
        }

        /* 버튼 그룹 스타일 */
        .button-group {
            display: flex;
            gap: 10px;
        }
    </style>

    <script type="text/javascript">
    $(function() {
        // datepicker 설정
        $(".datepicker").datepicker({
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            changeYear: true,
            yearRange: "c-100:c+0",
            monthNamesShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
            dayNamesMin: ["일","월","화","수","목","금","토"]
        });
        
        // 비밀번호 확인 유효성 검사
        $("#pw, #pw2").keyup(function(){
            let pw = $("#pw").val();
            let pw2 = $("#pw2").val();
            
            if (pw.length < 3) {
                $("#pwDiv").removeClass("alert-success").addClass("alert-danger").text("비밀번호는 필수 입력입니다. 3자 이상 입력하세요").show();
            } else {
                $("#pwDiv").removeClass("alert-danger").addClass("alert-success").text("사용할 수 있는 비밀번호 입니다.").show();
            }
            
            if (pw2.length < 3) {
                $("#pw2Div").removeClass("alert-success").addClass("alert-danger").text("비밀번호는 필수 입력입니다. 3자 이상 입력하세요").show();
            } else if (pw != pw2) {
                $("#pw2Div").removeClass("alert-success").addClass("alert-danger").text("비밀번호와 일치하지 않습니다.").show();
            } else {
                $("#pw2Div").removeClass("alert-danger").addClass("alert-success").text("비밀번호가 일치합니다.").show();
            }
        });
    });
    </script>
</head>
<body>

<div class="container" style="padding-top: 200px;">   
    <div class="card">
        <h2 class="card-title">회원 정보 수정</h2>
        <form action="/member/update.do" method="post">
            <input type="hidden" name="id" value="${vo.id}">
            
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" class="form-control" maxlength="10" pattern="^[a-zA-Z가-힝]{2,10}$" required
                       title="한글 또는 영문으로 2자 이상 10자 이내" name="name" id="name" value="${vo.name}">
            </div>
            
            <div class="form-group">
                <label>성별</label><br>
                <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" name="gender" value="male" ${vo.gender == 'male' ? 'checked' : ''}>
                    <label class="form-check-label">남자</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" name="gender" value="female" ${vo.gender == 'female' ? 'checked' : ''}>
                    <label class="form-check-label">여자</label>
                </div>
            </div>

            <div class="form-group">
                <label for="birth">생년월일</label>
                <input type="text" class="form-control datepicker" required name="birth" id="birth"
                       value="<fmt:formatDate value='${vo.birth}' pattern='yyyy-MM-dd'/>">
            </div>
            
            <div class="form-group">
                <label for="tel">연락처</label>
                <input type="text" class="form-control" placeholder="xxx-xxxx-xxxx" name="tel" id="tel" value="${vo.tel}">
            </div>
            
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" class="form-control" required placeholder="id@도메인" name="email" id="email" value="${vo.email}">
            </div>
            
            <div class="form-group">
                <label for="pw">비밀번호 확인</label>      
                <input type="password" class="form-control" maxlength="20" required pattern="^.{3,20}$" 
                       placeholder="초기비밀번호는 '1111' 입니다." name="pw" id="pw">
                <div id="pwDiv" class="alert" style="display: none;">수정을 위해 비밀번호는 필수 입력입니다. 3글자에서 20글자까지 사용합니다.</div>
                <div id="pw2Div" class="alert mt-2" style="display: none;"></div>
            </div>
            
            <div class="button-group mt-4">
                <button type="submit" class="btn btn-primary btn-custom">수정</button>
                <button type="reset" class="btn btn-secondary btn-custom">다시입력</button>
                <button type="button" onclick="window.location.href='http://localhost/member/view.do'" class="btn btn-warning btn-custom">취소</button>
            </div>
        </form>
    </div>
</div>
