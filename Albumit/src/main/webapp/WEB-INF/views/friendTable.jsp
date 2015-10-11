<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>
	<tr>
		<td>email</td>
		<td>profile</td>
		<td>block</td>
	</tr>
	<c:forEach var="f" items="${friendsList}">
		<tr>
			<td>${f.member_email}</td>
			<td>${f.member_nickname}</td>
			<td>${f.friend_block}</td>
		</tr>
	</c:forEach>
</table>
