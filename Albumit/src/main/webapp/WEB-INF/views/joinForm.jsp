<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
body {
	font-size: small;
	color: black;
}

input {
	font-size: 12px;
}
</style>
</head>

<body>

	<h4>회원가입</h4>

	<form:form  commandName ="member" enctype="multipart/form-data">
		
		<div>
		E-mail
		<form:input path="member_email" />
		<form:errors path="member_email"/>
		</div>
		<div>
		Password
				<form:input path="member_password" />
		<form:errors path="member_password"/>
		</div>
				
		<div>
		NickName
			<form:input path="member_nickname" />
		<form:errors path="member_nickname"/>
		</div>
			
		<div>
		Profile
				<form:input path="member_profile" />
		<form:errors path="member_profile"/>
		</div>
			
		<div>
		Profile
		<input type="file" name="attach"/>
		</div>		

		<br />
		<div>
			<input type="submit" value= "회원가입" />
			<input type="reset"  value= "다시작성" />
		</div>
</form:form>

</body>
</html>