<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>회원 징료 소견서 페이지</title>
	<link rel="stylesheet" type="text/css" href="./stylesheets/main.css">
</head>
<body>
<div id="wrap">
		<div id="header">
			<div id="header_left"><a href ="#"><img src="./images/4.jpg" alt="anicom로고"></a></div>
			<div id="navbar">
				<div id="navbar_top"></div>
				<div id="navbar_bottom">
				<ul>
					<li><a href="#">검색하기</a></li>
					<li><a href="#">커뮤니티</a></li>
					<li><a href="#">예약가이드</a></li>
				</ul>
				</div>
			</div>
			<div id="header_right">
				
					<a href="#">로그인</a>
					<a href="#">회원가입</a>
				
			</div>
			
		</div>
		<div id="line"></div>
		
		<div id="content">

			<div id="navbar_add">
				<ul>
					<li><a href="#">내 정보</a></li>
					<li><a href="#">관심병원</a></li>
					<li><a href="#">예약확인</a></li>
					<li><a href="#">진료소견서</a></li>
				</ul>
			</div>

			<br/>
			<table id="u_report" border="1">
				<thead>
					<tr>
						<th>병원이름</th>
						<th>날짜</th>
						<th>평점주기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="report.jsp">우리들의원</a></td>
						<td>2012-11-14</td>
						<td>
							<input type="button" value=" 평점주기 " id="change">
						
						</td>
					</tr>

					<tr>
						<td>우리들의원</td>
						<td>2012-11-14</td>
						<td>
							<input type="button" value=" 평점주기 " id="change">
							
						</td>
					</tr>

				</tbody>
			</table>
			<br/>
		</div>
		<div id="line"></div>
		<div id="footer">footer</div>
	</div>
</body>
</html>