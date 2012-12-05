<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<%	
	String errorMsg = null;

	String actionUrl;
	// DB 접속을 위한 준비
	Connection conn = null;
	//PreparedStatement stmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	
	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}


	try {
	    Class.forName("com.mysql.jdbc.Driver");

	    // DB 접속
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

 		// 질의 준비
		//stmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
		//stmt.setInt(1, id);
		
		// 수행
 		//rs = stmt.executeQuery();
		stmt = conn.createStatement();
		
		// users 테이블: user 수 페이지수 개산
 		rs = stmt.executeQuery("SELECT COUNT(*) FROM users");
		rs.next();
		
 		// users 테이블 SELECT
		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT * FROM users ORDER BY id LIMIT ");

	}catch (SQLException e) {
		errorMsg = "SQL 에러: " + e.getMessage();
	} finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./stylesheets/main.css">
<title>Anicom에 오신것을 환영합니다</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="header_left">
				<a href="main.jsp"><img src="./images/4.jpg" alt="anicom로고"></a>
			</div>
			<div id="navbar">
				<div id="navbar_top">
				</div>
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
			<div id="fast_search">빠른검색</div>
			<div id="main_content">페이지소개</div>
		</div>
		<div id="line"></div>
		<div id="footer">
			2012, Copyright © Anicom. All rights reserved.
		</div>
	</div>
</body>
</html>