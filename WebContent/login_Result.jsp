<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page session="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginResult</title>
</head>
<body>
<% 
String id = (String) session.getAttribute("id"); 
String pw = (String) session.getAttribute("pw"); 

if (id == null || pw == null) { 
out.println("로그인 실패(세션값 상실)"); 

} else { 

out.println(id + "님 환영합니다."); 

} 
%> 

</body>
</html>