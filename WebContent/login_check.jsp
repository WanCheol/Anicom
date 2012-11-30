<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page session="true" %>    
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
String dbUser = "id001";
String dbPassword = "pwd001";
String errorMsg = null;

String id = (request.getParameter("id"));
String pw = (request.getParameter("password"));	

try {
    Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
	stmt = conn.createStatement();	
	rs = stmt.executeQuery("select * from users where id='"+ id + "';"); 

	while(rs.next()) { 
	String password = rs.getString("pw"); 
	
	if(pw.equals(password)) { 
	out.println("일치"); 
	session.setAttribute("id", id); 
	session.setAttribute("pw", pw); 
	response.sendRedirect("login_Result.jsp"); 
	} else 
	out.println("비밀번호가 틀렸습니다."); 
	}
	
	}catch (SQLException e) {
	errorMsg = "SQL 에러: " + e.getMessage();
	}finally {
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
<title>Logincheck</title>
</head>
<body>

</body>
</html>