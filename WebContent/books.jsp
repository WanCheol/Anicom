<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String errorMsg = null;
	String actionUrl = "";

	String dbUrl = "jdbc:mysql://localhost:3306/ani_test?chracterEncoding=utf-8";
	String dbUser = "id001";
	String dbPassword = "pwd001";

	int id = 0;
	String user_id = (String) session.getAttribute("id");
	String hospital_id = request.getParameter("hospital_id");
	String hospital_name = request.getParameter("hospital_name");
	List<String> times =new LinkedList<String>(Arrays.asList("9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "18"));

	String time = "";
	String date = "";
	String patient = "";
	String descript = "";

	if (hospital_name != null) {
		hospital_name = new String(hospital_name.getBytes("8859_1"), "UTF-8");
	}

	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {
		id = -1;
	}

	try {
		Class.forName("com.mysql.jdbc.Driver");

		// DB 접속
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		// 질의 준비
		if (id > 0) {
			// Request에 id가 있으면 update모드라 가정
			actionUrl = "books_update.jsp";
			stmt = conn.prepareStatement("SELECT * FROM books WHERE id = ?");
			stmt.setInt(1, id);

			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				date = rs.getString("date");
				patient = rs.getString("patient");
				time = rs.getString("time");
				descript = rs.getString("descript");
				hospital_id = rs.getString("hospital_id");
			}
		} else {
			actionUrl = "books2.jsp";
		/* 	stmt = conn.prepareStatement("SELECT time FROM books WHERE hospital_id = ? AND date = ? Order By time desc");
		 	stmt.setString(1, hospital_id);
			String date1 = "2012-12-11";
			stmt.setString(2, date1);
			rs = stmt.executeQuery();
 
			while(rs.next()){
				String temp = rs.getString("time");
				System.out.println(temp);
				times.remove(temp);
			} */
		}

	} catch (SQLException e) {
		errorMsg = "SQL 에러: " + e.getMessage();
	} finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try {rs.close();} catch (SQLException e) {}
		if (stmt != null) try {stmt.close();} catch (SQLException e) {}
		if (conn != null) try {conn.close();} catch (SQLException e) {}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script src="js/calendar.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheets/main.css">
</head>
<body>
	<div id="hospital_name_book"><%=hospital_name%></div>
	<br />
	<br />
	<form action=<%=actionUrl%> method="post">
		<%
			if (id > 0) {
				out.println("<input type = 'hidden' name = 'id' value = '" + id + "'>");
			}
		%>

		<input type='hidden' name='name' value='<%=hospital_name%>' /> <input
			type='hidden' name='hospital_id' value="<%=hospital_id%>" /> <input
			type='hidden' name='user_id' value="<%=user_id%>">
		<div id="book_form">
			<div class="control-group">
				날짜 선택 :
				<div class="controls">
					<input type="text" class="calendar" id="calendar" name="rdate" size="12" onClick="Calendar_D(this)"
						value=<%=date%>><br />
				</div>
			</div>
			<div class="control-group">
				시간 선택 :
				<div class="controls">
					<select name="time">
						<%
							for (String timeName : times) {
								out.print("<option");
								if (timeName.equals(time)) {
									out.print(" selected");
								}
								out.println(">" + timeName + "</option>");
							}
						%>
					</select>시
				</div>
			</div>
			<div class="control-group">
				증상 입력 :
				<div class="controls">
					<textarea name="descript" value=<%=descript%>></textarea>
					<br />
				</div>
			</div>
			<div class="control-group">
				동물 종류 :
				<div class="controls">
					<input type="text" name="patient" value=<%=patient%>><br />
				</div>
			</div>
			<div class="control-group">
				<input type="submit" name="check" value="입력">
			</div>
		</div>

	</form>
</body>
</html>