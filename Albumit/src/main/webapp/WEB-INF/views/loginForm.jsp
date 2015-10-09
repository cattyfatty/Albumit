<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
				margin: 0px;
				padding: 0px;
			}
		
			
			#content1 #frontImage {
				flex: 1;
				border: 3px solid #464646;
				border-radius: 10px;
				margin-left: 10px;
				padding: 10px;
			}
			
			#content1 #frontImage img {
				width: 665px;
				height: 175px;
			}

	
			

</style>
</head>
<body>
	<a href="photoList?album_no=2">포토리스트</a>
	<div>
		<form:form commandName="member">
		ID <form:input path="member_email" size="20" />
		PW <form:password path="member_password" size="20" />
			<input type="submit" value="login" />
		</form:form>
		
		<div id="content1">
				<div id="login"></div>
				<div id="frontImage">
					<img src="${pageContext.request.contextPath}/resources/image/abcd.jpg"/>
				</div>
			</div>
	</div>
	<a href="join">SIGN UP!!</a>
	<a >Do you forget your PassWord?? </a>
</body>
</html>