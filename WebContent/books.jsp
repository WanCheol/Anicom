<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
    <%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	String user_id = (String) session.getAttribute("id");
	String hospital_id=request.getParameter("hospital_id"); //
	String name = request.getParameter("hospital_name");
	
	request.setCharacterEncoding("utf-8");
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	
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
<form action="books2.jsp" method="post">
<input type='hidden' name='name' value='<%=name %>'/>
<input type='hidden' name='hospital_id' value="<%=hospital_id%>"/>
<input type='hidden' name='user_id' value="<%=user_id%>">
		<div id="book_form">
			<div class="control-group">
				날짜 선택 :
				<div class="controls">
					<input type="text" name="rdate" size="12" onClick=Calendar_D(this);><br />
				</div>
			</div>
			<div class="control-group">
				시간 선택 :
				<div class="controls">
					<input type="text" name="time"><br />
				</div>
			</div>
			<div class="control-group">
				증상 입력 :
				<div class="controls">
					<textarea name="descript"></textarea>
					<br />
				</div>
			</div>
			<div class="control-group">
				동물 종류 :
				<div class="controls">
					<input type="text" name="patient"><br />
				</div>
			</div>
			<div class = "control-group">
				<input type="submit" name="check" value="입력"> 
			</div>
		</div>
		
</form>
</body>
</html>