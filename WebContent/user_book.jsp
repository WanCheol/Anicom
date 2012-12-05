<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>회원 예약확인</title>
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
								<%
					if(session.getAttribute("id")==null) {
				%>
				<a href="login.jsp" class="btn">로그인</a>
				<a href="signup.jsp" class="btn">회원가입</a>
				<%
					} else {
				%>

				<b><%=session.getAttribute("id")%></b>님 환영합니다
			
				<a href="user_information.jsp" class="btn btn-mini">MyPage</a> 
				<a href="logout.jsp" class="btn btn-mini">로그아웃</a>
				<%
					}
				%>
			</div>
			
		</div>
		<div id="line"></div>
		
		<div id="content">

			<div id="navbar_add">
				<ul>
					<li><a href="user_information.jsp">내 정보</a></li>
					<li><a href="user_favorites.jsp">관심병원</a></li>
					<li><a href="user_book.jsp">예약확인</a></li>
					<li><a href="user_reports.jsp">진료소견서</a></li>
				</ul>
			</div>

			<br/>
		
		<table id="u_book" border="1">
				<thead>
					<tr>
						<th>병원이름</th>
						<th>날짜</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>우리들의원</td>
						<td>2012-01-27</td>
						<td>
							<input type="button" value=" 수정 " id="change">
							<input type="button" value="  X  " id="cancel">
						</td>
					</tr>

					<tr>
						<td>우리들의원</td>
						<td>2012-01-27</td>
						<td>
							<input type="button" value=" 수정 " id="change">
							<input type="button" value="  X  " id="cancel">
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