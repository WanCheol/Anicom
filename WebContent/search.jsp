<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%	
if(session.getAttribute("id")==null){
	response.sendRedirect("login.jsp"); 
	
}else{
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	String errorMsg = null;
	String add=request.getParameter("address");

	try {
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
		stmt = conn.createStatement();	
 		rs = stmt.executeQuery("SELECT * FROM hospitals");
		rs.next();
		rs.close();
		stmt.close();
		
		stmt = conn.createStatement();
 		rs = stmt.executeQuery("SELECT * FROM hospitals WHERE address like '%"+add+"%' ");		
 		%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="stylesheets/main.css">
<title>Anicom에 오신것을 환영합니다</title>
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
			<div id ="content_left">
				<div id="searchbox">
				<form action="search.jsp" method="post">
					<h1>검색</h1><br/><br/>
					지역 또는 병원명 검색 :<br/><br/> <input type = "text" name = "address" size="10">		
					<input type = "submit" value = " 검색 "/> 
				</form>
				</div>
				<div id = "searchresult">
					<table border ="1">
						<tr>
							<th>병원명</th><th>주소</th><th>평점</th>
						</tr>
						<%while(rs.next()){ %>
						<tr>
							<td><a href="search.jsp" class = "hos_name"> <%= rs.getString("name") %></a> </td>
							<td><%=rs.getString("address") %> </td>
							<td><%=Integer.parseInt(rs.getString("grade")) %></td>							
							
						</tr>
						<%} 
						rs.close();
						stmt.close();
						stmt = conn.createStatement();
				 		rs = stmt.executeQuery("SELECT * FROM hospitals WHERE name like '%"+add+"%' ");
				 		while(rs.next()){ %>
						<tr>
							<td><a href="search.jsp" class = "hos_name"> <%= rs.getString("name") %></a> </td>
							<td><%=rs.getString("address") %> </td>
							<td><%=Integer.parseInt(rs.getString("grade")) %></td>							
							
						</tr>
						<%} 
						%>
					</table>
				</div>
			</div>
			<div id="hospitalinfo">
				<div id="hospitalinfo_top">
					<div id ="hospital_name" >병원이름</div>
					<div id = "button">
						<input type ="submit" value = " 예약 "/>
						<input type ="submit" value = " 관심병원 등록 "/>
					</div>
				</div>
				<div id="introduce">
					병원소개, 지도api
				</div>
				<div id="comment">
					평점 댓글 db
				</div>
			</div>
		</div>
		<div id="line"></div>
		<div id="footer">footer</div>
	</div>
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
</body>
</html>
