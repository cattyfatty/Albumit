<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script type="text/javascript"
	src='${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js'></script>
<script>
	function search() {
		var selection = $("#search").val();
		var content = $("#searchContent").val();
		
			//검색할 내용 공백 유무 검증
			if(content =="" || content ==null){
				var status = $("em").attr("title");
				$("#validation-content").text(status);
			}
			//앨범 선택시
			else if(selection =="Album"){
				console.log("앨범");
				//이동할 페이지 주소 입력
				
			}
			//사진 선택시
			else if(selection =="Photo"){
				console.log("사진");
				//이동할 페이지 주소 입력
			}
	}
</script>
</head>
<body>
	<header>
		<div>
			<ul>
				<li><p>Albumit</p></li>
				<li><div>
						<select id="search">
							<option>Album</option>
							<option>Photo</option>
						</select>
					</div></li>

				<li><div>
						<a href="#"><i class="fa fa-plus-square"></i></a>
					</div></li>

				<li><div class="input-group margin-bottom-sm">
						<span class="input-group-addon"><i class="fa fa-search fa-fw"></i></span> 
						<input id="searchContent" type="text" placeholder="Search">
						<p id="validation" ><em title="Please enter something you want to search"></em> </p>
						<div id="validation-content"></div>
						<button onclick="search()">search!</button>
					</div></li>
			</ul>
		</div>
	</header>
</body>
</html>