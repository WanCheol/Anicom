<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./stylesheets/main.css">
</head>
<body>
  <script type="text/javascript">
	alert("로그아웃 되었습니다"); 
	location.href="main.jsp";

</script>
</body>
</html>

