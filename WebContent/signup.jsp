<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택</title>
<link rel="stylesheet" type="text/css" href="./stylesheets/main.css">
</head>
<body>

<div id="wrap">
		<div id="header">
			<div id="header_left"><a href ="main.jsp"><img src="./images/4.jpg" alt="anicom로고"></a></div>
			<div id="navbar">
				<div id="navbar_top"></div>
				<div id="navbar_bottom">
				<ul>
					<li><a href="search.jsp">검색하기</a></li>
					<li><a href="#">커뮤니티</a></li>
					<li><a href="#">예약가이드</a></li>
				</ul>
				</div>
			</div>
			<div id="header_right">
				<a href="login.jsp" class="btn">로그인</a>
				<a href="signup.jsp" class="btn">회원가입</a>
			</div>	
		</div>
	<div id="line"></div>
	<div id="content">
		<div id="sign">
		<div class="btn_signup">
			<a href = "user_signup.jsp" class="btn">일반회원</a>
			<a href = "hospital_signup.jsp" class="btn">병원회원</a>
		</div>
		</div>
	</div>
	
	<div id="line"></div>
	<div id="footer">2012, Copyright © Anicom. All rights reserved.</div>

</div>
</body>
</html>