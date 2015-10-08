<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="photoList?album_no=2">포토리스트</a>
	<div>
		<form:form commandName="member">

		ID <form:input path="member_email" size="20" />
		PW <form:password path="member_password" size="20" />

			<input type="submit" value="login" />
		</form:form>
		
		<img src="resources/img/dddd.jpg"/>
	</div>

	<a href="join">SIGN UP!!</a>

</body>
</html>