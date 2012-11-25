<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
</head>
<body>
 <div class="container">
<%-- --	<%	if (request.getMethod() == "POST") { %>
	 <div class="well">
		  <ul>
		 <%--   <li>ID : <%=request.getParameter("id")%></li>
		    <li>비밀번호 : <%=request.getParameter("password")%></li>
		    <li>이름 : <%=request.getParameter("name")%></li>
		    <li>휴대폰 : <%=request.getParameter("frontnumber")%> - <%=request.getParameter("phonenumber1")%> - <%=request.getParameter("phonenumber2")%></li>
		    <li>Email : <%=request.getParameter("email")%></li>
	    </ul>
		 </div> 
  <%} else { %>  --%> 
    <div>
		  <img src="images/4.jpg" alt="anicom로고">

		  <form method="post" action = "GSignupServlet">
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="id">ID</label>
					<div class="controls">
						<input type="text" placeholder="qwer" name="id">
						<input type = "button" value = "중복조회" >
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="pwd">Password</label>
					<div class="controls">
						<input type="password" name="password">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="pwd-confirm">Password 확인</label>
					<div class="controls">
						<input type="password" name="pwd-confirm">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="name">이름</label>
					<div class="controls">
						<input type="text" placeholder="홍길동" name="name">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="phonenumber">휴대폰</label>
					<div class="controls">
						<select name = "frontnumber" > 
								<option value = "010">010</option>
								<option value = "011">011</option>
								<option value = "016">016</option>
								<option value = "017">017</option>
								<option value = "018">018</option>
								<option value = "019">019</option> 
						</select> -
							<input type = "text" name = "phonenumber1" size = "2" /> -
							<input type = "text" name = "phonenumber2" size = "2" /> <br/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="email">Email</label>
					<div class="controls">
						<input type="email" placeholder="asd@abc.com" name="email">
					</div>
				</div>

				<div class="form-actions">
					<input type="submit" class="btn btn-primary" value = "회원가입">
				</div>
			</fieldset>
		  </form>
    </div>
	<%--<% } --%> 
  </div>
</body>
</html>