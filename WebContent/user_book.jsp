<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
       <%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		request.setCharacterEncoding("utf-8");
		
		String s_id=(String)session.getAttribute("id");
		String dbUrl = "jdbc:mysql://localhost:3306/ani_test?chracterEncoding=utf-8";
		String dbUser = "id001";
		String dbPassword = "pwd001";
		String errorMsg = null;
		
	
 	  int id = 0;
	  try {
	    id = Integer.parseInt(request.getParameter("id"));
	  } catch (Exception e) {}

		try {
		  Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
			
			stmt = conn.prepareStatement("SELECT * FROM books WHERE user_id = ? ");
			stmt.setString(1, s_id);
			

			rs = stmt.executeQuery();
			
  //   if (rs.next()) {
	//        id = rs.getInt("id");
	//      }

	%>
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
			<div id="header_left">
				<a href ="main.jsp"><img src="./images/4.jpg" alt="anicom로고"></a>
			</div>
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
				<% while(rs.next()){ %>
					<tr>
						<td><%=rs.getString("hospital_id")%></td>
						<td><%=rs.getString("date") %></td>
						<td>
							<a href="books.jsp?id=<%=rs.getInt("id")%>" class="btn btn-mini">수정</a>
							<a href="books_delete.jsp?id=<%=rs.getInt("id")%>" class="btn btn-mini">X</a>

						</td>
					</tr>
				<% }%>
				</tbody>
			</table>
			<br/>
		</div>
		<div id="line"></div>
		<div id="footer">
			2012, Copyright © Anicom. All rights reserved.
		</div>
	</div>
</body>
</html>
<%
			
	}catch (SQLException e) {
	errorMsg = "SQL 에러: " + e.getMessage();
	}finally {
	// 무슨 일이 있어도 리소스를 제대로 종료
	if (rs != null) try{rs.close();} catch(SQLException e) {}
	if (stmt != null) try{stmt.close();} catch(SQLException e) {}
	if (conn != null) try{conn.close();} catch(SQLException e) {}
	}

%>