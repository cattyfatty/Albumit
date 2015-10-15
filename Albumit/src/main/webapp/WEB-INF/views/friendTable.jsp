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
/****************************** slider Button CSS  ********************************/
/*********************************************************************************/

#sliderLabel {
     border: 2px solid black;
    border-radius: 7px;
    cursor: pointer;
    display: block;
    height: 30px;
    margin: 20px auto;
    overflow: hidden;
    position: relative;
    width: 100px;
}
#sliderLabel input {
    display: none;
}
#sliderLabel input:checked + #slider {
    left: 52px;
}
#slider {
    background: #457FCE;
    -moz-border-radius: 7px;
    display: block;
    height: 30px;
    position: absolute;
    top: 0px;
    -moz-transition: left .25s ease-out;
    transition: left .25s ease-out;
    width: 49px;
    z-index: 1;
}
#sliderOn, #sliderOff {
    display: block;
    font-family: verdana, arial, sans-serif;
    font-weight: bold;
    line-height: 30px;
    position: absolute;
    text-align: center;
    top: 0px;
    font-size: 10px;
    width: 50px;
    color: black;
}
}
#sliderOn {
 
    left: 0px;
}
#sliderOff {

    right: 0px;
}

/*********************************************************************************/
</style>

<script>

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

function ab(a){
	 console.log("row:  "+a.rowIndex);
	 var ab= a.rowIndex;
	 console.log("email:  "+document.getElementById("myTable").rows[ab].cells.namedItem("email").innerHTML);
	var ce= $( "input:checked" ).val();
	
	alert(ce);
}

</script>

<input type="hidden" id="contextpath" value="${pageContext.request.contextPath}"/>
<table id="myTable">
	<tr>
		<td>email</td>
		<td>profile</td>
		<td>block</td>
	</tr>
	
	
	<c:forEach var="f" items="${friendsList}">
		<tr id="status" onclick="ab(this)"  >
			<td id="email">${f.member_email}</td>
			<td>${f.member_nickname}</td>
			<td>${f.friend_block}</td>
			<td><label id="sliderLabel">
    			<input type="checkbox" />
    			
    			<span id="slider"></span>
    			<span id="sliderOn">Block</span>
    			<span id="sliderOff">UnBlock</span>
				</label></td>
		</tr>
       
	</c:forEach>
</table>

<input type="hidden" id="blockfriend" value="${f.member_email}"/>
