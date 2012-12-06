<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*"
%>

<%
	String errorMsg = null;

	String actionUrl;
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	
	// 사용자 정보를 위한 변수 초기화
	String hospital_id = "";
	String pw = "";
	String name = "";
	String address = "";
	String phone = "";
	int grade = 0; 
	String guest = "hospital";
	
	
	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}

	if (id > 0) {
		// Request에 id가 있으면 update모드라 가정
		actionUrl = "hospital_update.jsp";
		try {
		    Class.forName("com.mysql.jdbc.Driver");

		    // DB 접속
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	 		// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM hospitals WHERE id = ?");
			stmt.setInt(1, id);
			
			// 수행
	 		rs = stmt.executeQuery();
			
			if (rs.next()) {
				hospital_id = rs.getString("hospital_id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				address = rs.getString("address");
				phone = rs.getString("phone");
				//grade = rs.getInt("grade");
				
			}
		}catch (SQLException e) {
			errorMsg = "SQL 에러: " + e.getMessage();
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	} else {
		actionUrl = "hospital_register.jsp";
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>병원 Sign up</title>
		<link rel="stylesheet" type="text/css" href="./stylesheets/login,signup.css">
		<script src="js/jquery-1.8.2.min.js"></script>
	</head>
	
	<body>
	 <div id="container">
	 <%
 		if (errorMsg != null && errorMsg.length() > 0 ) {
		// SQL 에러의 경우 에러 메시지 출력
		out.print("<div class='alert'>" + errorMsg + "</div>");
 }
 %>	
 		<div>
		  <img src="images/4.jpg" alt="anicom로고">
		
		<form class="form-horizontal" action="<%=actionUrl%>" method="post">	
		  <fieldset>
			<%
			  	if (id > 0) {
			  		out.println("<input type='hidden' name='id' value='"+id+"'>");
			  	}
			  	%>
			  
			  <div class="control-group">
						ID
						<div class="controls">
							<input type="text" name="hospital_id" value="<%=hospital_id%>">
						</div>
					</div>	
			  
			  <% if (id <= 0) { %>
					<%-- 신규 가입일 때만 아이디,비밀번호 입력창을 나타냄 --%>
				
					<div class="control-group">
						Password
						<div class="controls">
							<input type="password" name="pw">
						</div>
					</div>
	
					<div class="control-group">
						Password 확인
						<div class="controls">
							<input type="password" name="pw_confirm">
						</div>
					</div>
	
				<% } %>
				
				<div class="control-group">
					병원Name
					<div class="controls">
						<input type="text" placeholder="우리들의원" name="name" value="<%=name%>">
					</div>
				</div>

<%--		
				<div class="control-group">
					Phone
					<div class="controls">
						<input type="text" name="phone" value="<%=phone%>">
					</div>
				</div>
--%>
				
				<div class="control-group">
					Phone
					<div class="controls">
							<input type = "text" name = "frontnumber" size = "2" /> -
							<input type = "text" name = "phonenumber1" size = "2" /> -
							<input type = "text" name = "phonenumber2" size = "2" /> <br/>
					</div>
				</div>
				
				<div class="control-group">
					Address
					<div class="controls">
						<input type="text" name="address" value="<%=address%>">
					</div>
				</div>
			
				<div class="form-actions">
					<% if (id <= 0) { %>
						<input type="submit" class="btn btn-primary" value="회원가입">
					<% } else { %>
						<input type="submit" class="btn btn-primary" value="수정">
					<% } %>
				</div>

			</fieldset>
		  </form>
    </div>
  </div>
</body>
</html>
