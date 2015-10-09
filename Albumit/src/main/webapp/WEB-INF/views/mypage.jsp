<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script> 
var opener;
function init(){ 
    // 부모페이지의 값을 불러들이기 위함 window.dialogArguments 포인트! 
    opener = window.dialogArguments ;  
    var message = opener.message; // 부모창에서 object에 넣었던 값 
    alert(message);  
    
}
function send(){
	opener.message="test OK!!!"; // object 값을 변경 
    window.close(); 
}</script>
 

</head>
<body>
	<div id="member-detail">
			<div id="nickname"></div>
			<div id="email"> </div>
			<div id="profile"> </div>
			//<div id= "photo"><img src="${pageContext.request.contextPath}/resources/image/${member.member_filesystem_name}" width="100px" height="100px"/></div>
			<a href="#">change pw</a>
			<a href="#">Friend List</a>
		</div>
		
</body>
</html>