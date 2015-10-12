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
	</head>
	
	<body>
		
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="photo_title" value="${photo.photo_title}"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="text" rows="5" cols="50" value="${photo.photo_content}"></textarea></td>
				</tr>
				<tr>
					<td>장소</td>
					<td><input type="text" name="photo_place" value="${photo.photo_place}"/></td>
				</tr>
				<tr>
					<td>앨범</td>
					<td><input type="text" name="album_no" value="${photo.album_no}"/></td>
				</tr>
				<tr>
					<td>첨부</td>
					<td><input type="file" name="attach"/></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<br/>
						<input type="submit" value="글올리기"/>
						<input type="reset" value="다시작성"/>					
					</td>
				</tr>
			</table>
		
	</body>
</html>