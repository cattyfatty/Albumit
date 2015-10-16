<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			body {
				font-size: small;
			
			}
			
			input {
				font-size: 12px;
			}
		</style>
		<script type="text/javascript"
		src='${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js'></script>
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		
		<script>
		/*$(function() {
			$("#opener").click(function() {
				$("#dialog").dialog("open");
			
		});
			
		$("#dialog").dialog({
				autoOpen : false,
				height : 500,
				width : 350,
				left : 0,
				aspectRatio : true,
				show : {
					effect : "blind",
					duration : 1000
				},
				hide : {
					effect : "explode",
					duration : 1000
				}
				
				
			});
			event.preventDefault();
			
		});*/
		
		</script>
		
	</head>
	
	<body>
		
		<div id="dialog">
		<form method="post" action="preaddPhoto" enctype="multipart/form-data">
		<input type="hidden" name="album_no" value="${album_no}"/>
				<p>첨부</p>
				<input type="file" name="attach"/>
				<input type="submit" value="확인"/>
		</form>
		</div>
		
		
		<h4>글쓰기</h4>
		<form method="post" action="addPhoto" enctype="multipart/form-data">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="photo_title" value="${photo.photo_title}"/></td>
				</tr>
				<tr>
					<td>장소</td>
					<td><input type="text" name="photo_place" value="${photo.photo_place}"/></td>
				</tr>
				<tr>
					<td>날짜</td>
					<td><input type="date" name="photo_place" value="${photo.photo_date}"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="photo_content" rows="5" cols="50""></textarea></td>
				</tr>
				<tr>
					<td><input type="hidden" name="album_no" value="${album_no}"/></td>
				</tr>
				<tr>
					<td>
					<input type="button" id="opener"/>
					</td>
				</tr>
				<tr>
				<td>
					<input type="file" name="attach"/>
				</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<br/>
						<input type="submit" value="글올리기"/>
						<input type="reset" value="다시작성"/>					
					</td>
				</tr>
			</table>
		</form>
		
			
	</body>
</html>