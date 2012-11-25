<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--    <div class="container"> 
 <%-- <%	if (request.getMethod() == "POST") { %> 
		 <div class="well">
		  <ul>
		    <li>이름 : <%=request.getParameter("id")%></li>
		    <li>비밀번호 : <%=request.getParameter("password")%></li>
	    </ul>
		 </div>
		 	
  <% } else { %>
    <div>
		  <img src="images/4.jpg" alt="anicom로고">

		  <form class="form-horizontal" method="post">
		  <table >
				<tbody>
					<tr>
						<td>ID:</td>
						<td>
							<input type = "text" name = "id" size = "15"/> <br/>
						</td>
					</tr>
					<tr>
						<td>PW:</td>
						<td>
							<input type = "password" name = "password" size = "15"/> <br/>
						</td>
					</tr>
	
				</tbody>
			</table>
			<input type = "submit" value = "로그인"/>
			<input type = "submit" value = "회원가입"/>
		  </form>
	<% } %> --%>
</div> -->
	<div>
		<img src="images/4.jpg" alt="anicom로고">
		<form action = "LoginServlet" method = "post">
		  <table >
				<tbody>
					<tr>
						<td>ID:</td>
						<td>
							<input type = "text" name = "id" size = "14"/> <br/>
						</td>
					</tr>
					<tr>
						<td>PW:</td>
						<td>
							<input type = "password" name = "password" size = "15"/> <br/>
						</td>
					</tr>
	
				</tbody>
			</table>
			<input type = "submit" value = "로그인">
			<input type = "submit" value = "회원가입">
		</form>
	</div>

</body>
</html>