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

		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.createStatement();
		
 		rs = stmt.executeQuery("SELECT COUNT(*) FROM users");
		rs.next();
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT * FROM users ORDER BY id LIMIT ");

	}catch (SQLException e) {
		errorMsg = "SQL 에러: " + e.getMessage();
	} finally {
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}

%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./stylesheets/main.css">
<title>Anicom에 오신것을 환영합니다</title>
<link rel="stylesheet" href="./stylesheets/global.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<script src="slides.min.jquery.js"></script>
	<script>
		$(function(){
			// Set starting slide to 1
			var startSlide = 1;
			// Get slide number if it exists
			if (window.location.hash) {
				startSlide = window.location.hash.replace('#','');
			}
			// Initialize Slides
			$('#slides').slides({
				preload: true,
				preloadImage: 'img/loading.gif',
				generatePagination: true,
				play: 5000,
				pause: 2500,
				hoverPause: true,
				// Get the starting slide
				start: startSlide,
				animationComplete: function(current){
					// Set the slide number as a hash
					window.location.hash = '#' + current;
				}
			});
		});
	</script>
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

				<b><%=session.getAttribute("id")%></b>님 환영합니다</br>
			

				<a href="user_information.jsp" class="btn btn-mini">MyPage</a> 
				<a href="logout.jsp" class="btn btn-mini">로그아웃</a>
				<%
					}
				%>

			</div>

		</div>
		<div id="line"></div>
		<div id="content">
			<div id="fast_search"></div>
			<div id="main_content">
				<div id="example">
			<div id="slides">
				<div class="slides_container">
					<div class="slide">
						<h1>Anicom</h1>
						<p>환영합니다. 이곳은 동물병원 통합 웹사이트 입니다. 빠르고 간편한 예약을 할 수 있습니다.</p>
			
					</div>
					<div class="slide">
						
						<p><img src="images/1.PNG" width="570" height="270" alt="Slide 2"></p>
					
					</div>
					<div class="slide">
						<h1>3번째 슬라이드</h1>
						<p></p>
						
					</div>
					<div class="slide">
						<h1>4번째 슬라이드</h1>
						<p></p>
						
					</div>
				</div>
			</div>
		</div>
			</div>
		</div>
		<div id="line"></div>
		<div id="footer">
			2012, Copyright © Anicom. All rights reserved.
		</div>
	</div>
</body>
</html>