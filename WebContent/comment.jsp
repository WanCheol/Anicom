<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>평점주기</title>
<link rel="stylesheet" type="text/css" href="./stylesheets/comment.css">
</head>
<body>
	<div id="cm_board">
	<h1>병원이름db</h1>
	<form action="#" method="post">
		<div id="grade">
			<div class="title">평점</div>
			<select name="grade">
				<!-- 자바스크립트로 이미지구현 -->
				<option
				
				 value="five">5</option>
				<option value="four">4</option>
				<option value="three">3</option>
				<option value="two">2</option>
				<option value="one">1</option>
			</select> 
		</div>
		<div id="comment">
			<div class="title">댓글</div>
			<textarea cols="20" rows="2" name="comment" class="textarea"></textarea>
		</div>
		<div id="subm"><br/><input type="submit" value="등록하기"></div>
	</form>
</div>
</body>
</html>