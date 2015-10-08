<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<a href="photoList?album_no=1">포토리스트</a>
	
		
		
		
		<div>
<<<<<<< HEAD
		<form:form commandName="loginMember">

		<input type="text">
		
		
=======
	<form:form commandName="member">
>>>>>>> branch 'master' of https://github.com/cattyfatty/Albumit.git

		ID <form:input path="member_email"  size="20"/>
		PW <form:password path="member_password"  size="20"/>

		<input type="submit" value="login"/>
		</form:form>
<<<<<<< HEAD
	<a href="photoList?album_no=1">포토리스트</a>
=======
	
>>>>>>> branch 'master' of https://github.com/cattyfatty/Albumit.git

		</div>

		<a href="join">SIGN UP!!</a>

	</body>
</html>