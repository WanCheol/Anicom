<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 
    %>
<%
if(session.getAttribute("id")==null){
	response.sendRedirect("login.jsp"); 	
}else{
	
	String errorMsg = null;
	String actionUrl;
	
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	String s_id = (String) session.getAttribute("id"); 
	request.setCharacterEncoding("utf-8");

	 // 사용자 정보를 위한 변수 초기화
	 String hospital_id = "";
	 String name = "";
	 String pw = "";
	 String address = "";
	 String phone = "";

	// Request로 ID가 있는지 확인
 	  int id = 0;
	  try {
	    id = Integer.parseInt(request.getParameter("id"));
	  } catch (Exception e) {}

	   
	    try {
	        Class.forName("com.mysql.jdbc.Driver");

	        // DB 접속
	      conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	      // 질의 준비
	      stmt = conn.prepareStatement("SELECT * FROM hospitals WHERE hospital_id = ?");
	      stmt.setString(1, s_id);
	      
	      // 수행
	      rs = stmt.executeQuery();
	      
	      if (rs.next()) {
	        hospital_id = rs.getString("hospital_id");
	        name = rs.getString("name");
	        pw = rs.getString("pw");
	        address = rs.getString("address");
	        phone = rs.getString("phone");
	        id = rs.getInt("id");
	      }
	    }catch (SQLException e) {
	      errorMsg = "SQL 에러: " + e.getMessage();
	    } finally {
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
	<title>병원 mypage</title>

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
								<%
					if(session.getAttribute("id")==null) {
				%>
				<a href="login.jsp" class="btn">로그인</a>
				<a href="signup.jsp" class="btn">회원가입</a>
				<%
					} else {
				%>

				<b><%=session.getAttribute("id")%></b>님 환영합니다
			
				<a href="user_information.jsp" class="btn btn-mini">MyPage</a> 
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
					<li><a href="#">병원 정보</a></li>
					<li><a href="#">진료관리</a></li>
				</ul>
			</div>
			<br/>
			
			<div class="control-group">
				ID : <%=hospital_id %>
			</div>
			
			<div class="control-group">
				병원이름 : <%=name%>
			</div>
			
			<div class="control-group">
				Phone : <%=phone %>
			</div>
		
			<div class="control-group">
				주소 : <%=address%>
			</div>

			<div class="form-actions">
				<a href="hospital_signup.jsp?id=<%=id %>" class="btn btn-mini">수정</a>
			</div>

	</div>
	
		<div id="line"></div>
		<div id="footer">footer</div>
	</div>

	

</body>

</html>
<%}%>