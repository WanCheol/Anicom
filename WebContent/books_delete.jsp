<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
 <%
	// 현재 메뉴
	String errorMsg = null;
	int result = 0;
	
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	
	request.setCharacterEncoding("utf-8");

	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("DELETE FROM books WHERE id=?");
		stmt.setInt(1, id);
		
		result = stmt.executeUpdate();
		if (result != 1) {
			errorMsg = "삭제에 실패했습니다.";
		}
	} catch (SQLException e) {
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
<title>예약 삭제 페이지</title>
</head>
<body>
 	<div class="container">
 		<% if (errorMsg != null) { %>
 			<div class="alert alert-error">
 				<h3>Errors:</h3>
 				<%= errorMsg %>
 			</div>
	 	<% } else { %>
	 		<div class="alert alert-success">
	 			<script type="text/javascript">
					alert("예약을 취소하였습니다."); 
					location.href="user_book.jsp";
				</script>	
	 		</div>
	 	<%}%>
	 	<div class="form-action">
	 		<a href="user_book.jsp" class="btn btm-mini">목록으로</a>
	 	</div>
 	</div>
</body>
</html>