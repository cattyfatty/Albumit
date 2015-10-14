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
			var femail = $("#femail").val();
			var loginEmail= $("#loginEmail").val();
			if(femail == loginEmail){
				alert("It's you!!! Please enter other email");
				$("#femail").val("");
			}
			else{
			$("#addfriend").click(function(){
				
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
				});
			}
			
			addAlbumBox = $("#addAlbumBox").dialog({
				autoOpen : false,
				height : 300,
				width : 500,
				modal: true,
				buttons: {
					Create : function() {},
					Cancel: function() {
						addAlbumBox.dialog("close");
					}
				},
				close: function() {
					form[0].reset();
				}
			});
			
			$("#addAlbumButton").on("click", function() {
				console.log("addAlbumButton");
				$("#addAlbumBox").dialog("open");
			});
			
			form = addAlbumBox.find("form").on("submit", function(event){
				event.preventDefault();
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
			
			fieldset {padding:0; border:0; margin-top: 5px;}
		</style>
	
	</head>
	
	<body>
		<div id="pagewrapper">
			<header id="menubar">
			
				<div class="menu">
					<input type="button" id="opener" value="${member.member_email}" />
		
					<div class="menu">
						<a href="#" id="addAlbumButton"><i class="fa fa-plus-square"></i></a>
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
		
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->	
		<!-- --------------------------------------------------------------------------------------------------------- -->
			<div id="dialog">
		<!-- --------------------------------------------------------------------------------------------------------- -->
				<div id="tabs">
					<ul>
						<li><a href="#tabs-1">MyPage</a></li>
						<li><a href="#tabs-2">Friends</a></li>
					</ul>
					
					<div id="tabs-1">
						<div id="nickname">
							nickname :
							<c:out value="${member.member_nickname }" />
						</div>
						<div id="email">
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
							<a href="modifyProfile">Modify Profile</a>
					</div>
					
		<!-- --------------------------------------------------------------------------------------------------------- -->
					<div id="tabs-2">
						<div id="frtable">
						
						</div>
						<input type="text" id="femail" placeholder="Enter Friend's email"/>
						<input type="hidden" id="contextpath" value="${pageContext.request.contextPath}"/>
						<button id="addfriend">Add Friend</button>
					</div>
				</div>
			</div>
		<!-- --------------------------------------------------------------------------------------------------------- -->
			<div id="addAlbumBox" title="Create a new Album">
				<form>
					<fieldset>
						<label for="album_name">Album Name</label>
						<input type="text" id="album_name" name="album_name" size="20"/><br/>
						<hr/>
						<p>Would you like to open this album to public?</p>
						<input type="radio" name="album_publicity" value="true"/>yes
						<input type="radio" name="album_publicity" value="false"/>no<br/>
						<hr/>
						<p>Invite Your friends to this Album!!!</p>
						<a href="#" id="showMyFriendsList">show my friends</a>
					</fieldset>
				</form>
			</div>
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