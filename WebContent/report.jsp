<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>진료 소견서</title>
<link href="./stylesheets/report.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="report">
		<h1>진료 소견서</h1>
		<form action="#" method="post">
		<div id="content">
			<div class="row_1">
				<div class="title">이름 : <!--  <input type="text" name="user_id"> --></div>
				<div class="title">동물종류</div><input type="text" name="patient">
			</div>
			<div class="row_2">
				<div class="title">진료내용</div><textarea cols="35" rows="10" name="comment"></textarea>
			</div>
			<div class="row_2">
				<div class="title">향후치료의견</div><textarea cols="35" rows="10" name="descript"></textarea>
			</div>
			<div id="r_footer">
				발행일 <!-- <input type="text" name="Date"> --><br/>
				병원이름<!-- <input type="text" name="name"> --> 전화번호<!-- <input type="text" name="phone"> --> <br/>주소<!-- <input type="text" name="address"> -->
			</div>
		</div>
		<div id="btn">
		<input class="r_btn" type="submit" value="등록하기">
		</div>
	</form>
	</div>
</body>
</html>