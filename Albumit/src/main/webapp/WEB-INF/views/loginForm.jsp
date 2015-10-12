

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Albumit!</title>
<style>
   * {
      margin: 0px;
      padding: 0px;
      }
      
   body {
      width: 960px;
      height : 600px;
      margin: 0 auto;
      background-color: gray;
      padding: 50px;
      background-image: url('${pageContext.request.contextPath}/resources/image/watercolor.jpg');
      background-repeat: no-repeat;
      background-size: cover;
      }      
   
   #albumit{
      width: 210px; 
      height: 78px; 
      padding :10px;
      }
      
   #loginForm{
      background-color: rgba(255, 255, 255, 0.5);
      margin: 150px 150px 150px 350px;
      width: 300px;
      height: 300px;
      border-radius:300px;
   }
   #login{
      padding: 10px 10px 10px 25px;
      /*  top-right-bottom-left]; */
   }
   
   #uname, #upw{
      font-color: rgb(255,255,255);
      margin: 5px 0px;
      height: 30px;
      width: 250px;
      border-radius: 5px;
      background-color: rgba(255,255,255,0.5);
      border-color: rgba(255,255,255,0);
   }
   
   #loginbtn{
      margin: 10px 0px;
      height: 30px;
      width: 250px;
      border-radius: 5px;
      background-color: rgba(255,255,255,0.5);
      border-color: rgba(255,255,255,0);
   }
   #albumit {
       width: 100%;
       height: 78px;
       text-align: center;
   }
   
</style>
</head>
<body>
      
      <div id="loginForm">
         <div id="albumit">
            <img src="#" alt="Albumit" title="Albumit"  >
         </div>
         <div id="login">
            <form:form commandName="member">
               <div id="username">
                  <form:input id="uname" path="member_email" size="20" placeholder="Your email"/><br/>
               </div>   
               <div id="userpw">   
                  <form:password id="upw" path="member_password" size="20"  placeholder="Your password"/><br/>
               </div>
               <div id="btn">
                  <input id="loginbtn" type="submit" value="login" />
               </div>
            </form:form>
         </div>
         <div id="findPW">
            <a href="findPWForm">Forgot your Password?</a>
            <a> | </a>
            <a href="join">Sign Up</a>
         </div>
            <a href="photoList?album_no=1">포토리스트</a>
            <a href="addPhoto">사진올리</a>
      </div> 
</body>
</html>