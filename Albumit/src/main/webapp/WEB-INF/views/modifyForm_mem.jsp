<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
function goMypage() {
	var contextpath = $("#contextpath").val();
	console.log("modifyForm에서 컨텍스트 루"+contextpath);
	$.ajax({
		type: "get",
		url: contextpath+"/showProfile",
		data: {"email" : $("#email").val()},
		dataType : "html",
		success : function(data){
			$("#mypage").html(data);
		}
	});
	
}

function commit(){
	var = 
	
}
</script>


email: <c:out value="${Modifiedmem.member_email}"/>
<form action="modifyMember" method="post" enctype="multipart/form-data">
	
	<input type="hidden" id="contextpath" value="${pageContext.request.contextPath}"/>
	<input type="hidden" id="email" value="${Modifiedmem.member_email}"/>
	nickName<input type="text" name="member_nickname"/>
	profile<input type="text" name="member_profile"/>
	password<input type="text" name="member_password"/>
	photo<input type="file" name="attach"/>
	<input type="button" onclick="commit()" value="commit!"/>
</form>

	<input type="button" onclick="goMypage()" value="back"/>