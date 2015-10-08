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
		
		ID <form:input path="member_email"  size="20"/>
		PW <form:password path="member_password"  size="20"/>

		</form:form>
		</div>


	</body>
</html>