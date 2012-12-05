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
	String hospital_id=request.getParameter("hospital_id");
	
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
<title>Insert title here</title>
<script src="calendar.js"></script>
<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>
 <%=hospital_id %>
<form action="books2.jsp" method="post">
<input type='hidden' name='hospital_id' value="<%=hospital_id%>"/>
<input type='hidden' name='user_id' value="<%=user_id%>">
날짜 선택 : <input type="text" name="rdate" size="12" onClick=Calendar_D(this);><br/>
시간 선택 : <input type="text" name="time"><br/>
증상 입력 : <textarea name="descript"></textarea><br/>
동물 종류 : <input type="text" name="patient"><br/>
<input type="submit" name="check" value="입력"> 
</form>
</body>
</html>