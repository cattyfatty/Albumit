<%@ page contentType="text/html; charset=UTF-8"%>
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
	<form method="POST" action="join" enctype="multipart/form-data">
		
		<div>
		E-mail
		<input name="member_email" />
		</div>
		<div>
		Password
		<input name="member_password" />
		</div>
				
		<div>
		NickName
		<input name="member_nickname" />
		</div>
			
		<div>
		Profile
		<input name="member_profile" />
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
	</form>

</body>
</html>