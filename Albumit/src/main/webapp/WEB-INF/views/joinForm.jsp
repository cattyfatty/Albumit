<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
body {
	font-size: small;
	color: white;
}

input {
	font-size: 12px;
}
</style>
</head>

<body>

	<h4>회원가입</h4>
	<form:form commandName="joinMember" enctype="multipart/form-data">
		
		<form:input path="member_email" />
		
		<div>
		<p>Password</p>
		<form:input path="member_password" />
		</div>
				
		<div>
		<p> NickName </p>
		<form:input path="member_nickname" />
		</div>
			
		<div>
		<p>Profile</p>
		<form:input path="member_profile" />
		</div>		
							
		<div>
		<p>Photo</p>
		<form:input path="attach" />
		</div>		

		<br />
		<div>
			<input type="submit" value= "회원가입" />
			<input type="reset"  value= "다시작성" />
		</div>
	</form:form>

</body>
</html>