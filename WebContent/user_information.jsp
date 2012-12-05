<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 
    %>
<%
String guest = (String) session.getAttribute("guest");
if(guest.length() >= 6  ){
	response.sendRedirect("hospital_information.jsp"); 	
}else{
	
	String errorMsg = null;
	String actionUrl;
	
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	String s_id = (String) session.getAttribute("id"); 
	request.setCharacterEncoding("utf-8");

	 // 사용자 정보를 위한 변수 초기화
	 String user_id = "";
	 String name = "";
	 String pw = "";
	 String email = "";
	 String phone = "";

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
	      stmt = conn.prepareStatement("SELECT * FROM users WHERE user_id = ?");
	      stmt.setString(1, s_id);
	      
	      // 수행
	      rs = stmt.executeQuery();
	      
	      if (rs.next()) {
	        user_id = rs.getString("user_id");
	        name = rs.getString("name");
	        pw = rs.getString("pw");
	        email = rs.getString("email");
	        phone = rs.getString("phone");
	        id = rs.getInt("id");
	      }
	    }catch (SQLException e) {
	      errorMsg = "SQL 에러: " + e.getMessage();
	    } finally {
	      // 무슨 일이 있어도 리소스를 제대로 종료
	      if (rs != null) try{rs.close();} catch(SQLException e) {}
	      if (stmt != null) try{stmt.close();} catch(SQLException e) {}
	      if (conn != null) try{conn.close();} catch(SQLException e) {}
	    }
	  
%>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원목록</title>

	<link rel="stylesheet" type="text/css" href="./stylesheets/main.css">
	<script src="js/jquery-1.8.2.min.js"></script>
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
			<div id="content_userinformaion">
				<div class="control-group_userinformaion">
					<b>ID :</b>

					<%=user_id%>

				</div>
				<br />
				<div class="control-group_userinformaion">
					<b>Name :</b>
					<%=name%>

				</div>
				<br />
				<div class="control-group_userinformaion">
					<b>Phone :</b>

					<%=phone%>

				</div>
				<br />
				<div class="control-group_userinformaion">
					<b>E-mail :</b>
					<%=email%>

				</div>
				<br />
				<div class="form-actions_userinformaion">
					<a href="user_signup.jsp?id=<%=id%>" class="btn btn-mini">수정</a>
				</div>

			</div>

			<div id="line"></div>
		<div id="footer">2012, Copyright © Anicom. All rights reserved.</div>
	</div>

	

</body>

</html>
<%}%>