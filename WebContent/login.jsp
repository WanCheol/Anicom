<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page session="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<img src="images/4.jpg" alt="anicom로고">

 <form action = "login_check.jsp"class="form-horizontal" method="post">
  <table>
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
	<input type = "submit" value = "로그인"/>
	<!-- <input type = "submit" value = "회원가입"/> -->
 </form>
 
</body>
</html>