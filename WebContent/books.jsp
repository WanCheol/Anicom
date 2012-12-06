<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
    <%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String errorMsg = null;
	String actionUrl;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	
	String user_id = (String) session.getAttribute("id");
	String hospital_id=request.getParameter("hospital_id");
	String name = request.getParameter("hospital_name");
	
	
	String date = "";
	String patient = "";
	int time = 0;
	String descript = "";

	
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	
	if (id > 0) {
		// Request에 id가 있으면 update모드라 가정
		
		actionUrl = "books_update.jsp";
		
		
		try {
		    Class.forName("com.mysql.jdbc.Driver");

		    // DB 접속
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	 		// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM books WHERE id = ?");
			stmt.setInt(1, id);
			
			// 수행
	 		rs = stmt.executeQuery();
			
			if (rs.next()) {
				date = rs.getString("date");
				patient = rs.getString("patient");
				time = rs.getInt("time");
				descript = rs.getString("descript");
				name = rs.getString("hospital_id");
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
		actionUrl = "books2.jsp";
	}
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script src="calendar.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheets/main.css">
</head>
<body>
<div id="hospital_name_book"><%=name %></div><br/><br/>
<form action=<%=actionUrl %> method="post">
<input type='hidden' name='name' value='<%=name %>'/>
<input type='hidden' name='hospital_id' value="<%=hospital_id%>"/>
<input type='hidden' name='user_id' value="<%=user_id%>">
		<div id="book_form">
			<div class="control-group">
				날짜 선택 :
				<div class="controls">
					<input type="text" name="rdate" size="12" onClick=Calendar_D(this); value = <%=date %>><br />
				</div>
			</div>
			<div class="control-group">
				시간 선택 :
				<div class="controls">
					<input type="text" name="time" value = <%=time%>><br />
				</div>
			</div>
			<div class="control-group">
				증상 입력 :
				<div class="controls">
					<textarea name="descript" value = <%=descript %>></textarea>
					<br />
				</div>
			</div>
			<div class="control-group">
				동물 종류 :
				<div class="controls">
					<input type="text" name="patient" value = <%=patient %>><br />
				</div>
			</div>
			<div class = "control-group">
				<input type="submit" name="check" value="입력"> 
			</div>
		</div>
		
</form>
</body>
</html>