<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.blockCheck{
	display:none;
}
#blockBtn{
	display:block;
}
#commitBlock{
	display:none;
}
</style>

<script>
function block(){
	$(".blockCheck").css("display","block");
	$("#blockBtn").css("display","none");
	$("#commitBlock").css("display","block");
	
}
function commitBlock(){
	alert("commitBlock !!! check~!!#!");
	var contextpath = $("#contextpath").val();
	alert('seonmi');
	$.ajax({
		type: "post",
		url: contextpath+"/blockFriend",
		data: {"blockFriend" : $("#blockfriend").val()},
		dataType : "html",
		success : function(data){
			$("#frtable").html(data);
		}
	});
	
}

</script>

<input type="hidden" id="contextpath" value="${pageContext.request.contextPath}"/>
<table>
	<tr>
		<td>email</td>
		<td>profile</td>
		<td>block</td>
	</tr>
	
	
	<c:forEach var="f" items="${friendsList}">
		<tr id="status">
			<td>${f.member_email}</td>
			<td>${f.member_nickname}</td>
			<td>${f.friend_block}</td>
			<td><input type="checkbox" class ="blockCheck"/></td>
		</tr>
	</c:forEach>
</table>

<input type="hidden" id="blockfriend" value="${f.member_email}"/>
<input type="button" onclick="block()" id ="blockBtn" value="Block!"/>
<input type="button" onclick="commitBlock()" id="commitBlock" value="commit!"/>