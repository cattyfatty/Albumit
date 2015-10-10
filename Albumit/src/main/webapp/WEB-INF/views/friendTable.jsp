<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<tr>
		<td>email</td>
		<td>profile</td>
		<td>block</td>
	</tr>

	<c:forEach var="friend" items="${friendList}">
		<tr>
			<td>${friend.member_eamil}</td>
			<td>${friend.member_profile}</td>
			<td>${friend.friend_block}</td>
		</tr>
	</c:forEach>
</table>