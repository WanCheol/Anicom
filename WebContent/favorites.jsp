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
String user_id = (String)session.getAttribute("id");

String hospital_name = request.getParameter("hospital_name");
if (hospital_name != null) {
	hospital_name = new String(hospital_name.getBytes("8859_1"), "UTF-8");
}

List<String> errorMsgs = new ArrayList<String>();
int result = 0;

if (errorMsgs.size() == 0) {
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement(
				"INSERT INTO favorites(user_id, hospital_name) " +
				"VALUES(?, ?)"
				);
		stmt.setString(1,  user_id);
		stmt.setString(2,  hospital_name);

		
		result = stmt.executeUpdate();
		if (result != 1) {
			errorMsgs.add("등록에 실패하였습니다.");
		}
	} catch (SQLException e) {
		
		%>
		 <script type="text/javascript">
      alert("이미 등록되어 있는 관심병원입니다. 확인해주세요");
			location.href(-1);    
			</script> 
		<%
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
<title>관심병원</title>
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
					alert("관심병원이 등록되었습니다.");
				</script>	

		 	
	 	<% } %>
 	</div>

</body>
</html>