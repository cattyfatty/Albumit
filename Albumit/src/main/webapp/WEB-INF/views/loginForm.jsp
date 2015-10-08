<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div>
		<form:form commandName="loginMember">
		

		<input type="text">
		
		<a href="photoList?album_no=1">포토리스트</a>

		ID <form:input path="member_email"  size="20"/>
		PW <form:password path="member_password"  size="20"/>

		</form:form>
		<a href="photoList">포토리스트</a>

		</div>

		<a href="join">SIGN UP!!</a>

	</body>
</html>