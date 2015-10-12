<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			body {
			
			}
			table {
				width: 100%;
				border-collapse: collapse;
				font-size: small;
			}
			table, th, td {
				border: 1px solid white;
				text-align: center;
			}
			th {
				background-color: orange;
				color: black;
			}
			
			#buttonGroup {
				margin: 10px;
				text-align: center;
			}
			
			#buttonGroup a {
				display:inline-block;
				width: 70px;
				line-height: 30px;
				text-decoration: none;
				font-size: small;
				color: white;
				border: 1px solid darkgray;
				background-color: gray;
				font-weight: bold;
			}
			
			#buttonGroup a:hover {
				color: black;
				background-color: lightgray;
			}
			
			#pager {
				margin-top: 5px;
				text-align: center;
				font-size: small;
			}
			
			#pager a {
				text-decoration: none;
				
			}
			
			#pager a:hover {
				color: orange;
			}
			
			#pager a.pageNo {
				margin-left: 5px;
				margin-right: 5px;
			}
			
			#pager a.pageNo.selected {
				color: aqua;
			}
			
			.title {
				text-decoration: none;
				color: white;
			}	
			.title:hover {
				color: orange;
			}
		</style>
	</head>
	
	<body>
		<h4>게시물 목록</h4>
		
		<table>
			<tr>
				<th style="width:50px">번호</th>
				<th>제목</th>
				<th style="width:60px">글쓴이</th>
				<th style="width:80px">날짜</th>
				<th style="width:60px">사진</th>
				
				
			</tr>
			



		
			<c:forEach var="photo" items="${laList}">
				<tr>
				
					<td>${photo.photo_no}</td>
					<td>${photo.photo_title}</td>
					<td>${photo.uid}</td>
					<td>${photo.photo_date}</td>
					<td><a class="title" href="photoDetail?photo_no=${photo_no}">${photo.photo_original_file_name}</a></td>
				
					
				</tr>
			</c:forEach>
			
		</table>
		<table>
		<tr>
				<th style="width:50px">번호</th>
				<th>제목</th>
				<th style="width:60px">글쓴이</th>
				<th style="width:80px">날짜</th>
				<th style="width:60px">사진</th>
			</tr>
			

	
			
			<c:forEach var="photo" items="${liList}">



				<tr>
				
					<td>${photo.photo_no}</td>
					<td>${photo.photo_title}</td>
					<td>${photo.uid}</td>
					<td>${photo.photo_date}</td>
					<td>${photo.photo_original_file_name}</td>
				
					
				</tr>
			</c:forEach>
		</table> 
		
		
		<div id="buttonGroup">
			<a href="addPhoto">글쓰기</a>
		</div>
		
	</body>
</html>		
		