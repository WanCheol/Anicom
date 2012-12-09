<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
    <%
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	String dbUrl="jdbc:mysql://localhost:3306/ani_test?chracterEncoding=utf-8";
	String dbUser="id001";
	String dbPassword="pwd001";

	request.setCharacterEncoding("utf-8");
	String patient = request.getParameter("patient");
	String comment =request.getParameter("comment");
	String descript =request.getParameter("descript");
	String user_id=request.getParameter("user_id");
	String hospital_id=request.getParameter("hospital_id");
	String hospital_name=request.getParameter("hospital_name");
	//String name = request.getParameter("name");
	Calendar cal = Calendar.getInstance();
			
	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	if ( comment== null || comment.trim().length() == 0) {
		errorMsgs.add("내욜을 입력해주세요");
	}
	if ( patient== null || patient.trim().length() == 0) {
		errorMsgs.add("내욜을 입력해주세요");
	}
	if ( descript== null || descript.trim().length() == 0) {
		errorMsgs.add("내욜을 입력해주세요");
	}

	if (errorMsgs.size() == 0) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO reports(patient,comment,descript,date,user_id,hospital_id,hospital_name) " +
					"VALUES(?,?,?,?,?,?,?)"
					);
			stmt.setString(1, patient );
			stmt.setString(2, comment);
			stmt.setString(3,descript );
			stmt.setDate(4, new java.sql.Date(cal.getTimeInMillis()));
			stmt.setString(5, user_id);
			stmt.setString(6, hospital_id);
			stmt.setString(7,hospital_name);
			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsgs.add("등록에 실패하였습니다.");
			}
		} catch (SQLException e) {
			errorMsgs.add("SQL 에러: " + e.getMessage());
		} finally {
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
</head>
<body>
<% if (errorMsgs.size() > 0) { %>
 				<h3>Errors:</h3>
 				<ul>
 					<% for(String msg: errorMsgs) { %>
 						<li><%=msg %></li>
 					<% } %>
 				</ul>
		 		<a onclick="history.back();">뒤로 돌아가기</a> 	
	 	<% } else if (result == 1) { %>
	 		<script type="text/javascript">
		        alert("완료되었습니다.");
		        self.close();
		        parent.location.replace("hospital_reports.jsp"); 
     		</script>


	 	<%}%>
</body>
</html>