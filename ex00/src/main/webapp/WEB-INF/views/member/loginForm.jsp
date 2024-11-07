<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- loginForm.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link>
<link rel="stylesheet" href="/resources/styles/loginForm.css">
<title>로그인 폼</title>

<style type="text/css">
.container {
	width: 100%;
	height: 80vh;
	position: relative;
}
</style>

</head>
<body>
	<div class="container">
		<div class="login_wrap">
			<div class="loginForm">
				<!-- 탭 버튼 -->
				<div class="tab-buttons">
					<button class="active" onclick="showTab('login')">로그인</button>
					<button onclick="showTab('register')">회원가입</button>
				</div>

				<!-- 로그인 폼 -->
				<div id="login" class="tab-content active">
					<form action="login.do" method="post">
						<div class="login_btn">
							<button type="submit" class="kakao_login">카카오계정 로그인</button>
							<button type="submit" class="naver_login">네이버 로그인</button>
						</div>
						<div class="or">
							<div class="line">
								<hr />
							</div>
						</div>
						<div class="form-group">
							<input type="text" name="id" id="id" placeholder="ID 입력" required />
						</div>
						<div class="form-group">
							<input type="password" name="pw" id="pw" placeholder="password 입력" required />
						</div>

						<button type="submit" class="loginForm_btn">로그인</button>


					</form>
				</div>

				<!-- 회원가입 폼 -->
				<div id="register" class="tab-content">
					<form action="/member/write.do" method="post">
						<div class="form-group">
							<label for="id">ID</label>
							<input type="text" name="id" id="id" placeholder="ID 입력" required />
						</div>
						<div class="form-group">
							<label for="pw">Password</label>
							<input type="password" name="pw" id="pw" placeholder="password 입력" required />
						</div>
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" name="email" id="email" placeholder="이메일 입력" required />
						</div>
						<div class="form-group">
							<label for="name">Name</label>
							<input type="text" name="name" id="name" placeholder="이름 입력" required />
						</div>
						<div class="form-group">
							<label for="gender">Gender</label>
							<select name="gender" id="gender" required>
								<option value="">성별 선택</option>
								<option value="male">남성</option>
								<option value="female">여성</option>
							</select>
						</div>
						<div class="form-group">
							<label for="birth">Birthdate</label>
							<input type="date" name="birth" id="birth" required />
						</div>
						<div class="form-group">
							<label for="tel">Phone Number</label>
							<input type="tel" name="tel" id="tel" placeholder="전화번호 입력" required />
						</div>
						<button type="submit" class="register_btn">회원가입</button>
					</form>
				</div>

			</div>
			<div class="login_bg">

				<img alt="로그인 이미지" src="/resources/image/login/loginbg.png">

				<a href="/main/main.do ">
					<img alt="로고 이미지" src="/resources/image/logo_light.svg">
				</a>
			</div>
		</div>
	</div>

</body>
</html>