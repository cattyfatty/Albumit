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
      margin: 0 auto;
      width: 350px;
      height: 350px;
      border-radius:350px;
   }
   #login{
      padding: 10px 10px 10px 10px;
      /*  top-right-bottom-left]; */
   }
   
   #uname, #upw{
      font-color: rgb(255,255,255);
      margin: 5px 0px;
      height: 30px;
      width: 90%;
/*       border-radius: 5px; */
      background-color: rgba(255,255,255,0);
      border-color: rgba(255,255,255,1);
      font-family: Verdana,sans-serif;
      text-align: center;
   }
   
   ::-webkit-input-placeholder{color:rgb(204, 0, 82);}
   
   #loginbtn{
      margin: 10px 0px;
      height: 30px;
      width: 100%;
      /* border-radius: 5px; */
      background-color: rgba(255,255,255,0.5);
      border-color: rgba(255,255,255,0);
      vertical-align: middle;
      text-align: center;
      cursor: pointer;
      font-size: 14pt;
      color: rgb(204, 0, 82);
      font-family: Verdana,sans-serif;
   }
   #albumit {
       width: 100%;
       height: 78px;
       text-align: center;
   }
   
   #findPW{
      font-size: 10pt;
      text-align: center;
      vertical-align: middle;
      font-family: Verdana,sans-serif;
   }
   #pagewrapper{
      margin: 0 auto;
      vertical-align: middle;
      
   }
   

</style>
</head>
<body>
   <div id="pagewrapper">
      <div id="loginForm">
      
         <div id="albumit">
            <img src="#" alt="Albumit" title="Albumit"  >
         </div>
         
         <div id="login">
            <form:form commandName="member">
               <div id="username">
                  <form:input type="e-mail"  id="uname" path="member_email" size="20" placeholder="Your@email.com" style="text-align: center; border-top: rgba(255,255,255,0.3); 1px solid; border-bottom: rgba(255,255,255,0.3);1px solid;"/><br/>
               </div>   
               <div id="userpw">   
                  <form:password id="upw" path="member_password" size="20"  placeholder="Your password" style="text-align: center"/><br/>
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
            
            <a href="addPhoto">사진올리</a>
      </div> 
      
      <footer>
         <a href="photoList?album_no=1">포토리스트</a>
      </footer>
   </div>
</body>
</html>