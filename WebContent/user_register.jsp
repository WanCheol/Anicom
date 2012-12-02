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
	String user_id = request.getParameter("user_id");
	String pw = request.getParameter("pw");
//	String pw_confirm = request.getParameter("pw_confirm");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	//String phone = request.getParameter("phone");
	String frontnumber = (request.getParameter("frontnumber"));
	String phonenumber1 = (request.getParameter("phonenumber1"));
	String phonenumber2 = (request.getParameter("phonenumber2"));
	
	String phone = frontnumber + phonenumber1 + phonenumber2;
	
	
	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	if (user_id == null || user_id.trim().length() == 0) {
		errorMsgs.add("ID를 반드시 입력해주세요.");
	}
	
	if (pw == null || pw.length() < 6) {
		errorMsgs.add("비밀번호는 6자 이상 입력해주세요.");
	} 
	
//	if (!pwd.equals(pwd_confirm)) {
//		errorMsgs.add("비밀번호가 일치하지 않습니다.");
//	}
	
	if (name == null || name.trim().length() == 0) {
		errorMsgs.add("이름을 반드시 입력해주세요.");
	}
	

	
	if (errorMsgs.size() == 0) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO users(user_id, name, pw, email, phone) " +
					"VALUES(?, ?, ?, ?, ?)"
					);
			stmt.setString(1,  user_id);
			stmt.setString(2,  name);
			stmt.setString(3,  pw);
			stmt.setString(4,  email);
			stmt.setString(5,  phone);

			
			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsgs.add("등록에 실패하였습니다.");
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
	<title>회원목록</title>
	<link href="css/base.css" rel="stylesheet">
	<script src="js/jquery-1.8.2.min.js"></script>
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
	 		<div class="alert alert-success">
	 			<b><%= name %></b>님 등록해주셔서 감사합니다.
	 			<a href = "main.jsp">홈</a>
	 		</div>
	 		
	 	<%}%>
 	</div>
</body>
</html>