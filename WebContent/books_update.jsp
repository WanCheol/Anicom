<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 
    %>
    <%
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	
	request.setCharacterEncoding("utf-8");
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	
	String rdate = request.getParameter("rdate");
	int time = Integer.parseInt(request.getParameter("time"));
	String descript = request.getParameter("descript");
	String patient = request.getParameter("patient");
	//String user_id = request.getParamethe("user_id");
	
	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	if (rdate == null || rdate.trim().length() == 0) {
		errorMsgs.add("날짜를 입력하세요");
	}
	if (time == 0) {
		errorMsgs.add("시간을 입력하세요");
	}
	if (descript == null || descript.trim().length() == 0) {
		errorMsgs.add("증상을 입력하세요");
	}
	if (patient == null || patient.trim().length() == 0) {
		errorMsgs.add("환자를 입력하세요");
	}


	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"UPDATE books " +
					"SET  date=?, time=?, descript=?, patient=? " +
					"WHERE id=?"
					);
			stmt.setString(1,  rdate);
			stmt.setInt(2,  time);
			stmt.setString(3,  descript);
			stmt.setString(4,  patient);
			stmt.setInt(5, id);

			
			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsgs.add("변경에 실패하였습니다.");
			}
		} catch (SQLException e) {
			errorMsgs.add("SQL 에러: " + e.getMessage());
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 수정 페이지</title>
</head>
<body>
	 	<div class="container">
 		<% if (errorMsgs.size() > 0) { %>
 			<div class="alert alert-error">
 				<h3>Errors:</h3>
 				<ul>
 					<% for(String msg: errorMsgs) { %>
 						<li><%=msg %></li>
 					<% } %>
 				</ul>
 			</div>
		 	<div class="form-action">
		 		<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
		 	</div>
	 	<% } else if (result == 1) { %>
	 		  <script type="text/javascript">
					alert("예앾 정보가 수정되었습니다."); 
					location.href="user_book.jsp";
				</script>	
	 		<%--
	 		<div class="alert alert-success">
	 			<a href = "user_information.jsp"><b><%= name %></b>님 정보가 수정되었습니다.</a>
	 		</div>
	 		--%>
		 	
	 	<% } %>
 	</div>
	
</body>
</html>