<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%	
if(session.getAttribute("id")==null){
	response.sendRedirect("login.jsp"); 	
}else{
	
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		request.setCharacterEncoding("utf-8");
		String s_id=(String)session.getAttribute("id");
		String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
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
			
			stmt = conn.prepareStatement("SELECT * FROM books WHERE hospital_id = ? ");
			stmt.setString(1, s_id);
			rs = stmt.executeQuery();

	 		%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 진료 소견서 </title>
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

			<div id="navbar_add">
				<ul>
					<li><a href="hospital_information.jsp">병원 정보</a></li>
					<li><a href="hospital_reports.jsp">진료관리</a></li>
				</ul>
			</div>

			<br/>
			<table id="u_report" border="1">
				<thead>
					<tr>
						<th>환자이름</th>
						<th>날짜</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					
				<% while(rs.next()){ %>
					<tr>
						<td><%=rs.getString("user_id")%></td>
						<td><%=rs.getString("date") %></td>
						<td>
							<!-- <input type="button" value=" 소견서작성 " id="change">	 -->
							<a href="report.jsp?id=<%=rs.getString("id")%>" class="btn">소견서 작성</a>
						</td>
					</tr>
<%} %>
				</tbody>
			</table>
			<br/>
		</div>
		<div id="line"></div>
		<div id="footer">2012, Copyright © Anicom. All rights reserved.</div>
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
	
}
%>