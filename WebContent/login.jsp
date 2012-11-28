<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!--
 <script language = "javascript">
	function login_check(){
		var theform = document.frm;
		if(theform.id.value =""){
			alert('아이디를 입력하세요');
		}else if(theform.pw.value=""){
			alert('암호를 입력하세요');				
		}else{
			theform.action = "loginCheck.jsp";
			theform.submit();
		}
	}
</script>
 -->
</head>
<body>
    <div class="container"> 
  <%	if (request.getMethod() == "POST") { %> 
		<%--  <div class="well">
		  <ul>
		    <li>이름 : <%=request.getParameter("id")%></li>
		    <li>비밀번호 : <%=request.getParameter("password")%></li>
	    </ul>
	    --%>
 <% 	  String id = (request.getParameter("id"));
				String pw = (request.getParameter("password"));	
	
	//			String checksql = "select count(*) from guest where id = '"+id+"' and pw = '"+pw+"' ";
	//			String sql_id = "select id from guest where id = '"+id+"' and pw = '"+pw+"' ";
			
				if(id == null || pw == null || id.length() == 0 || pw.length() == 0){
					out.println("아이디와 비밀번호를 입력하세요.");
					
				}else if(id.equals(" ") && pw.equals(" ")){ // " "안에 DB에 저장된 회원정보
					//로그인 성공
					session.setAttribute("userid", " ");
					session.setAttribute("username", " ");
					response.sendRedirect(" "); //돌아갈 페이지
				}else
					out.println("아이디나 비밀번호가 잘못되었습니다.");
				
			 
			%> 
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
			<input type = "submit" value = "회원가입"/>
		  </form>
	<% } %>
</div> 
<!-- 
	<div>
		<img src="images/4.jpg" alt="anicom로고">
		<form name = "frm" method = "post">
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
			<a href ="#" onClick = "login_check()"><input type = "submit" value = "로그인"></a>
			<a href ="#"><input type = "submit" value = "회원가입"></a>
		</form>
	</div>
 -->

</body>
</html>