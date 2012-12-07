<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
    <%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test?chracterEncoding=utf-8";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	
	request.setCharacterEncoding("utf-8");
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	String rdate = request.getParameter("rdate");
	String time = request.getParameter("time");
	String descript = request.getParameter("descript");
	String patient = request.getParameter("patient");
	String user_id=request.getParameter("user_id");
	String hospital_id=request.getParameter("hospital_id");
	String hospital_name=request.getParameter("name");
	
	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	if (rdate == null || rdate.trim().length() == 0) {
		errorMsgs.add("날짜를 입력하세요");
	}
	/* if (time == null || time.trim().length() == 0) {
		errorMsgs.add("시간을 입력하세요");
	} */
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
					"INSERT INTO books(date,time,descript,patient,hospital_id,user_id) " +
					"VALUES(?,?,?,?,?,?)"
					);
			stmt.setString(1,  rdate);
			stmt.setString(2,  time);
			stmt.setString(3, descript);
			stmt.setString(4, patient);
			stmt.setString(5, hospital_name);
			stmt.setString(6, user_id);
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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./stylesheets/main.css">
</head>
<body>
<% if (errorMsgs.size() > 0) { %>
 				<h3>Errors:</h3>
 				<ul>
 					<% for(String msg: errorMsgs) { %>
 						<li><%=msg %></li>
 					<% } %>
 				</ul>
		 		<a onclick="history.back();" class = "btn">뒤로 돌아가기</a> 	
	 	<% } else if (result == 1) { %>
	 		<script type="text/javascript">
		        alert("완료되었습니다.");
		        self.close();
		        parent.location.replace("search.jsp"); 
     		</script>


	 	<%}%>
</body>
</html>