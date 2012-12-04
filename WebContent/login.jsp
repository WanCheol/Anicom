<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page session="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="./stylesheets/login,signup.css">
</head>
<body>
<div id = "container">
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
<!-- String id = (String)session.getAttribute("id")-->

		</tbody>
	</table>
	<input type = "radio" name = "guest" value ="guest" checked> 회원
	<input type = "radio" name = "guest" value = "hospital"> 병원 <br/>
	<input type = "submit" value = "로그인"/>
	<!-- <input type = "submit" value = "회원가입"/> -->
 </form>
 </div>
</body>
</html>