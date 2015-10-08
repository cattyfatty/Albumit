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
		
		

		ID <form:input path="member_email"  size="20"/>
		PW <form:password path="member_password"  size="20"/>

		</form:form>
	<a href="photoList?album_no=1">포토리스트</a>

		</div>


	</body>
</html>