<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8">
	<title>Albumit! Album</title>
	
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<script type="text/javascript"
		src='${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js'></script>
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	
	<script>
		$(function() {
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
	
			$("#opener").click(function() {
				$("#dialog").dialog("open");
				$("#tabs").tabs();
			});
		
			$("#modifyProfile").click(function(){
				var contextpath= $("#contextpath").val();
				console.log(contextpath);
				console.log( "adaf"+$("#email").val() );
				$.ajax({
					type: "post",
					url: contextpath+"/modifyProfile",
					  data : { "email" :$("#email").val() },
					dataType : "html",
					success : function(data){
						console.log(data);
						$("#mypage").html(data);
					}
				});
			});	
			
			$("#addfriend").click(function(){
				var femail = $("#femail").val();
				var loginEmail= $("#loginEmail").val();
				if(femail == loginEmail){
					alert("It's you!!! Please enter other email");
					$("#femail").val("");
				}else{
					var contextpath= $("#contextpath").val();
					console.log(contextpath);
					$.ajax({
						type: "post",
						url: contextpath+"/addFriend",
						  data : { "femail" :$("#femail").val() },
						dataType : "html",
						success : function(data){
							console.log(data);
							$("#frtable").html(data);
						}
					});
				}
				});
			
			
			
		});
		
		function search() {
			var selection = $("#search").val();
			var content = $("#searchContent").val();
	
			//검색할 내용 공백 유무 검증
			if (content == "" || content == null) {
				var status = $("em").attr("title");
				$("#validation-content").text(status);
			}
			//앨범 선택시
			else if (selection == "Album") {
				console.log("앨범");
				$("#validation-content").text("");
				//이동할 페이지 주소 입력
	
			}
			//사진 선택시
			else if (selection == "Photo") {
				console.log("사진");
				$("#validation-content").text("");
				//이동할 페이지 주소 입력
			}
		}
		
		//친구 목록, 추가 기능 Ajax
	
		
	</script>
	
	
		<style type="text/css">
		
			* {
		      margin: 0px;
		      padding: 0px;
		      }
		     
		     body{
		      width: 1000px;
		      height : 600px;
		      background-color: gray;
		     }
		      
		     #pagewrapper{
		 	    width:100%;
		     }
		     
			.menu {
				 display: inline; 
			}
			
			#menubar {
				/* background-color: rgba(255,255,255,0.5); */
				background-image: url('${pageContext.request.contextPath}/resources/image/watercolor.jpg');
		    	background-repeat: no-repeat;
		    	background-size: cover;
				width: 100%;
			}
			
			.ui-dialog.ui-widget.ui-widget-content.ui-corner-all.ui-front.ui-draggable.ui-resizable{
				position: relative !important;
				margin: 0 auto !important;
				left: 0px !important;
				top: 30px !important;
			}
			
			#albumit{
		 	    top: 0;
			    right: 0;
			    left: 0;
			    z-index: 10000;
			}
			
			.album{
			  display: inline-block;
			  padding: 5px;
			  width: 150px;
			  height: 150px;
			  margin: 1em;
			  border: 1px;
			  border-color: white;
			}
			
		</style>
	
	</head>
	
	<body>
		<div id="pagewrapper">
			<header id="menubar">
			
				<div class="menu">
					<input type="button" id="opener" value="${member.member_email}" />
		
					<div class="menu">
						<a href="#"><i class="fa fa-plus-square"></i></a>
					</div>
				</div>
				
				<div id="albumit">
					<img src="#" alt="Albumit" title="Albumit"  >
				</div>
	         
				
				<div class="menu">
					<select id="search">
						<option> ALBUM </option>
						<option> PHOTO </option>
					</select>
				</div>
		
				<div class="input-group margin-bottom-sm menu">
					<span class="input-group-addon"><i class="fa fa-search fa-fw"></i></span>
					<input id="searchContent" type="text" placeholder="Search">
					<button onclick="search()">search!</button>
					<p id="validation">
						<em title="Please enter something you want to search"></em>
					</p>
		
					<div id="validation-content"></div>
				</div>
				
			</header>
		
		<!-- --------------------------------------------------------------------------------------------------------- -->
			<div id="dialog">
				<div id="tabs">
					<ul>
						<li><a href="#mypage">MyPage</a></li>
						<li><a href="#flist">Friends</a></li>
					</ul>
					<input type="hidden" id="email" value="${member.member_email}"/>
					<div id="mypage">
						<div id="nickname">
							nickname :
							<c:out value="${member.member_nickname }" />
						</div>
						<div>
							email :
							<c:out value="${member.member_email}" />
						</div>
						<div id="profile">
							profile :
							<c:out value="${member.member_profile }" />
						</div>
						<div id="photo"></div>
		
						<img
							src="${pageContext.request.contextPath}/resources/image/${member.member_filesystem_name}"
							width="100px" height="100px" /><br /> 
							<a href="#">pw ?</a> 
							<a href="leave">leave Albumit</a>
							<button id="modifyProfile">modifyProfile</button>
					</div>
					
						<div id="flist">
					
							<input type="text" id="femail" placeholder="Enter Friend's email"/>
							<input type="hidden" id="contextpath" value="${pageContext.request.contextPath}"/>
							<button id="addfriend">Add Friend</button>
					
								<div id="frtable">
								</div>
						</div>
				</div>
				</div>
				</div>
		<!-- --------------------------------------------------------------------------------------------------------- -->
			
				
		<!-- --------------------------------------------------------------------------------------------------------- -->
			<div>
				<a href="photoList" class="album">
					<input type="image" />
				</a>	
				<a href="photoList" class="album">
					<input type="image" />
				</a>	
				<a href="photoList" class="album">
					<input type="image" />
				</a>		
				<a href="photoList" class="album">
					<input type="image" />
				</a>	
				<a href="photoList" class="album">
					<input type="image" />
				</a>	
				<a href="photoList" class="album">
					<input type="image" />
				</a>	
				<a href="photoList" class="album">
					<input type="image" />
				</a>	
				<a href="photoList" class="album">
					<input type="image" />
				</a>	
			</div>
		</div>
	</body>
	</div>
	
	<div>
	<p>앨범 예시</p>
	
	<a href="photoList?album_no=1">album1</a>	
	<a href="photoList?album_no=2">album2</a>	
	

	</div>
</body>
</html>