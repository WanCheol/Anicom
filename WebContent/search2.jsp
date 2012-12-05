<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/ani_test";
	String dbUser = "id001";
	String dbPassword = "pwd001";
	String errorMsg = null;
	String name = "";
	String phone = "";
	String address = "";
	String user_id = (String) session.getAttribute("id");
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {
	}
	if (id > 0) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);
			stmt = conn
					.prepareStatement("SELECT * FROM hospitals WHERE id=?");
			stmt.setInt(1, id);

			rs = stmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
				phone = rs.getString("phone");
				address = rs.getString("address");
				
			}
		} catch (SQLException e) {
			errorMsg = "SQL 에러: " + e.getMessage();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	} else {

	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="stylesheets/main.css">
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false">
</script>
<script type="text/javascript">

	var map;
	var infowindow = new google.maps.InfoWindow();
	var marker = [];
	var geocoder;
	var geocodemarker = [];

	var GreenIcon = new google.maps.MarkerImage(
			   "http://labs.google.com/ridefinder/images/mm_20_green.png",
			   new google.maps.Size(12, 20),
			   new google.maps.Point(0, 0),
			   new google.maps.Point(6, 20));
	
	function initialize() {

		var latlng = new google.maps.LatLng(37.5240220, 126.9265940);
		var myOptions = {
			zoom : 10,
			center : latlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		map = new google.maps.Map(document.getElementById("map_canvas"),
				myOptions);
		geocoder = new google.maps.Geocoder();
		codeAddress();
	}

	function Setmarker(latLng) {

		if (marker.length > 0) {
			marker[0].setMap(null);
		}

		marker = [];
		marker.length = 0;

		marker.push(new google.maps.Marker({
			position : latLng,
			map : map
		}));
	}

	function codeAddress() {

		if (geocodemarker.length > 0) {
			for ( var i = 0; i < geocodemarker.length; i++) {
				geocodemarker[i].setMap(null);
			}
			geocodemarker = [];
			geocodemarker.length = 0;
		}
		var address = "<%=address%>";
		
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK)
			{
				for ( var i = 0; i < results.length; i++) {
					map.setCenter(results[i].geometry.location);
					geocodemarker.push(new google.maps.Marker({
						center : results[i].geometry.location,
						position : results[i].geometry.location,
						icon : GreenIcon,
						map : map
					}));
				}
			} else {
				alert("Geocode was not successful for the following reason: "
						+ status);
			}
		});
	}

	function codeCoordinate(event) {

		Setmarker(event.latLng);
		geocoder.geocode({
			'latLng' : event.latLng
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[1]) {
					infowindow.setContent(results[1].formatted_address);
					infowindow.open(map, marker[0]);

				}
			}
		});
	}
</script>
</head>
<body onload="initialize()">
	<div id="hospitalinfo_top">
		<div id="hospital_name"><%=name%></div>
		<div id="button">
			<form action="books.jsp" method="post">	
				<input type='hidden' name='hospital_id' value='<%=name%>'>
				<input type='hidden' name='user_id' value='<%=user_id%>'>
				<input type="submit" value=" 예약 ">
			</form>
		</div>
	</div>
	<div id="introduce">
		환영합니다!
		<ul>
			<li>name: <%=name%></li>
			<li>phone: <%=phone%></li>
			<li>address: <%=address%></li>
		</ul>
	</div>
	<div id="comment">
		
	</div>
	<div id="map_canvas" style="width: 500px; height: 500px"></div>
</body>
</html>