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

	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	String user_id = request.getParameter("user_id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");


	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	if (user_id == null || user_id.trim().length() == 0) {
		errorMsgs.add("ID를 반드시 입력해주세요.");
	}
	
	if (name == null || name.trim().length() == 0) {
		errorMsgs.add("이름을 반드시 입력해주세요.");
	}
	
	

	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"UPDATE users " +
					"SET  user_id=?, name=?, email=?, phone=? " +
					"WHERE id=?"
					);
			stmt.setString(1,  user_id);
			stmt.setString(2,  name);
			stmt.setString(3,  email);
			stmt.setString(4,  phone);

			
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
	<title>회원목록</title>

	<link rel="stylesheet" type="text/css" href="./stylesheets/main.css">
	<script src="js/jquery-1.8.2.min.js"></script>
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

			<div id="navbar_add">
				<ul>
					<li><a href="#">내 정보</a></li>
					<li><a href="#">관심병원</a></li>
					<li><a href="#">예약확인</a></li>
					<li><a href="#">진료소견서</a></li>
				</ul>
			</div>

			<br/>
			
<%-- 
			<form id="infoform" action = "" method = "post">
					아이디 : <input type = "text" name = "id" size = "20" value = " hello"/> <br/>
					비밀번호 : <input type = "password" name = "password" size = "20" value = " hello"/> <br/>
					비밀번호 재입력: <input type = "password" name = "password check" size = "20" value = " hello"/> <br/>
					이름: <input type = "text" name = "name" size = "10" value = "홍길동"/> <br/>
					휴대폰:<select name = "frontnumber" > 
								<option value = "010">010</option>
								<option value = "011">011</option>
								<option value = "016">016</option>
								<option value = "017">017</option>
								<option value = "018">018</option>
								<option value = "019">019</option> 
						</select> -
					<input type = "text" name = "phone" size = "4" value = " 1234"/> -
					<input type = "text" name = "phone" size = "4" value = " 1234"/> <br/>
					<input type = "submit" value = " 수정 "/>	
				</form>
				
			<br/>
--%>

		</div>
		<div id="line"></div>
		<div id="footer">footer</div>
	</div>

	
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
	 			<b><%= name %></b>님 정보가 수정되었습니다.
	 			<a href = "main.jsp">홈</a>
	 		</div>
		 	
	 	<% } %>
 	</div>
	
</body>

</html>