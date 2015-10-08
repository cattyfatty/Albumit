<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			/*------------------------------------*/
			body {
				width: 960px;
				margin: 0px auto;
				background-color: #292929;
				color: #FFFFFF;
			}	
			/*------------------------------------*/				
			#page {
				height: 100vh;
				display: flex;
				flex-direction: column;
			}
			/*------------------------------------*/			
			#header {
				margin: 20px 0px;
				font-style: italic;
			}
			#content1 {
				height: 200px;
				display: flex;
			}
			#content2 {
				flex: 1;
				margin-top: 10px;
				min-height: 300px;
				display: flex;
			}
			#footer {
				margin: 20px 0px;
			}			
			/*------------------------------------*/	
			#content1 #login {
				width: 250px;
				border: 3px solid #464646;	
				border-radius: 10px;			
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

			/*------------------------------------*/
			#content2 #menu {
				width: 250px;
				border: 3px solid #464646;	
				border-radius: 10px;
				padding: 10px;
				overflow-y: scroll;
			}
			
			#content2 #menu ul {
				margin-top: 10px;
			}
			
			#content2 #menu ul h4 {
				margin-top: 10px;
			}
			
			#content2 #menu a {
				display:block;
				margin: 1px 10px 1px 20px;
				text-decoration: none;
				font-size: small;
				color: white;
			}
			
			#content2 #menu a:hover {
				color: orange;
			}
			
			#content2 #content {
				flex: 1;	
				margin-left: 10px;		
				position: relative;		
			}
			
			#content2 #content iframe {
				width: 100%;
				height: 100%;
				position: absolute;
				border: none;
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
			</div>c
	</div>

	<a href="join">SIGN UP!!</a>

</body>
</html>