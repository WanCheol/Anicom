<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 
    %>
<%
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test?chracterEncoding=utf-8";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	
	request.setCharacterEncoding("utf-8");

	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	String hospital_id = request.getParameter("hospital_id");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	
	//String phone = request.getParameter("phone");
	String frontnumber = (request.getParameter("frontnumber"));
	String phonenumber1 = (request.getParameter("phonenumber1"));
	String phonenumber2 = (request.getParameter("phonenumber2"));
		
	String phone = frontnumber + phonenumber1 + phonenumber2;


	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	/*if (hospital_id == null || hospital_id.trim().length() == 0) {
		errorMsgs.add("ID를 반드시 입력해주세요.");
	}*/
	
	if (name == null || name.trim().length() == 0) {
		errorMsgs.add("이름을 반드시 입력해주세요.");
	}
	
	

	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"UPDATE hospitals " +
					"SET  hospital_id=?, name=?, address=?, phone=? " +
					"WHERE id=?"
					);
			stmt.setString(1,  hospital_id);
			stmt.setString(2,  name);
			stmt.setString(3,  address);
			stmt.setString(4,  phone);
			stmt.setInt(5, id);

			
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
	<title>병원 정보수정</title>

	<link rel="stylesheet" type="text/css" href="./stylesheets/main.css">
	<script src="js/jquery-1.8.2.min.js"></script>
</head>

<body>
	<div id="wrap">
		<div id="header">
			<div id="header_left"><a href ="main.jsp"><img src="./images/4.jpg" alt="anicom로고"></a></div>
			<div id="navbar">
				<div id="navbar_top"></div>
				<div id="navbar_bottom">
				<ul>
					<li><a href="search.jsp">검색하기</a></li>
					<li><a href="#">커뮤니티</a></li>
					<li><a href="#">예약가이드</a></li>
				</ul>
				</div>
			</div>
			<div id="header_right">
								<%
					if(session.getAttribute("id")==null) {
				%>
				<a href="login.jsp" class="btn">로그인</a>
				<a href="signup.jsp" class="btn">회원가입</a>
				<%
					} else {
				%>

				<b><%=session.getAttribute("id")%></b>님 환영합니다</br>
			
				<a href="hospital_information.jsp" class="btn btn-mini">MyPage</a> 
				<a href="logout.jsp" class="btn btn-mini">로그아웃</a>
				<%
					}
				%>
			</div>
			
		</div>
		<div id="line"></div>
		
		<div id="content">

			<div id="navbar_add">
				<ul>
					<li><a href="hospital_information.jsp">병원 정보</a></li>
					<li><a href="hospital_reports.jsp">진료관리</a></li>
				</ul>
			</div>

			<br/>
			
	

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
	 			<script type="text/javascript">
					alert("<%= name %>님 정보가 수정되었습니다."); 
					location.href="hospital_information.jsp";
				</script>	
	 		<%--
	 		<div class="alert alert-success">
	 			<a href = "hospital_information.jsp"><b><%= name %></b>님 정보가 수정되었습니다.</a>
	 		</div>
		 	--%>
		 	
	 	<% } %>
 	</div>
	
</body>

</html>