<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
 <%
	if(session.getAttribute("id")==null){
			out.print("로그인하세요");
			
	}else{
    String errorMsg;
	String actionUrl;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/ani_test?chracterEncoding=utf-8";
	String dbUser = "id001";
	String dbPassword = "pwd001";

	String user_id = "";
	String patient="";
	String hospital_id="";
	String name="";
	String comment="";
	String descript="";
	String phone="";
	String address="";
	String date="";
	//int hos_id;
	
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}

	if (id > 0) {
	
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement("SELECT * FROM reports where id =?");
			stmt.setInt(1, id);
			
	 		rs = stmt.executeQuery();
	 		rs.next();
			user_id=rs.getString("user_id");
			patient=rs.getString("patient");
			comment=rs.getString("comment");
			descript=rs.getString("descript");
			date=rs.getString("date");
			hospital_id=rs.getString("hospital_id");
			//name=rs.getString("name");
			rs.close();
			stmt.close();
			
			stmt = conn.prepareStatement("SELECT * FROM hospitals WHERE hospital_id=?");
			stmt.setString(1, hospital_id);
			
		 	rs = stmt.executeQuery();
			if(rs.next()){
				phone=rs.getString("phone");
				address=rs.getString("address");
				//hos_id=rs.getInt("id");
				//hospital_id=rs.getString("hospital_id");
				name=rs.getString("name");
			}
			} catch(SQLException e){
				out.print("error");
			} finally {
			      // 무슨 일이 있어도 리소스를 제대로 종료
			  if (rs != null) try{rs.close();} catch(SQLException e) {}
			  if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			  if (conn != null) try{conn.close();} catch(SQLException e) {}
			} 
		actionUrl = "report2.jsp";
	}else{actionUrl="#";}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료 소견서</title>
<link href="./stylesheets/report.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="report">
		<h1>진료 소견서</h1>
		<form action="<%=actionUrl%>" method="post">
	<%
			if (id > 0) {
			  	out.println("<input type='hidden' name='id' value='"+id+"'>");
			}
	%>
		<div id="content">
			<div class="row_1">
				<div class="title">이름 :<%=user_id %></div><input type='hidden' name='user_id' value='<%=user_id %>'/>
				<div class="title">동물종류 :<%=patient %></div><input type="hidden" name="patient" value="<%=patient%>"/><br>
			</div>
			<div class="row_2">
				<div class="title">진료내용</div><textarea readonly="readonly" cols="35" rows="10" name="comment"><%=comment %></textarea>
			</div>
			<div class="row_2">
				<div class="title">향후치료의견</div><textarea readonly="readonly" cols="35" rows="10" name="descript"><%=descript %></textarea>
			</div>
			<div id="r_footer">
				발행일  : <%=date %><br/>
				병원이름 : <%=name %> &nbsp; 전화번호 : <%=phone %><br/>
				주소 : <%=address %>
				<input type="hidden" name="hospital_id" value="<%=hospital_id%>"/>
				<input type="hidden" name="phone" value="<%=phone%>"/>
				<input type="hidden" name="address" value="<%=address%>"/>
			</div>
		</div>
				<input type="reset" value="닫기" onclick="window.close('report_result')">
					<% }%>
	</form>
	</div>
</body>
</html>