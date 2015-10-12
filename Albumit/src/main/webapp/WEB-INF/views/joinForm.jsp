<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
   <head>
      <meta charset="UTF-8">
      <title>Albumit - SignUp</title>
      <style type="text/css">
         * {
            margin: 0px;
            padding: 0px;
         }
         body {
            width: 960px;
            height : 600px;
            margin: 0 auto;
            padding: 50px;
            font-size: small;
            color: black;
            font-family: Verdana,sans-serif;
            background-image: url('${pageContext.request.contextPath}/resources/image/watercolor.jpg');
            background-repeat: no-repeat;
            background-size: cover;
         }
         
         #pagewrapper{
            margin: 0px auto;
            padding: 50px;
            background-color: rgba(255,255,255,0.5);
            border-radius: 30px; 
            width: 400px; 
            height: 350px;
            text-align: center;
         }
         
         input {
            font-size: 12px;
         }
         
         #emailform, #passwordform, #nicknameform, #Smessageform {
            padding: 10px;
            margin: 3px;
            width: 90%;
            height: 10px;
            border-radius: 5px;
            background-color: rgba(255,255,255,0);
            font-family: Verdana,sans-serif;
            text-align: center;
            font-color: rgba(255,255,255,1);
         }
         
         ::-webkit-input-placeholder{color:rgb(204, 0, 82);}
         
         .signup{
            text-align: left;
         }
         
         #albumit {
             width: 100%;
             height: 78px;
             text-align: center;
         }
         
         #member{
            margin: 10px 0px 10px 0px;
            /*  top-right-bottom-left]; */
         }
               
      </style>
   </head>
   
   <body>
      <div id="pagewrapper">
      
         <div id="albumit">
            <img src="#" alt="Albumit" title="Albumit"  >
         </div>
         
         <div>      
            <h2 class="signup">Sign Up  : </h2><br/>
            <h2 class="signup">Create your Albumit Account!</h2>
         </div>
         
         <form:form  commandName ="member" enctype="multipart/form-data" >
            <!-- 입력란 -->
            <div id="textbox">
               <!-- E-mail -->
               <div id="email">
                  <form:input path="member_email" placeholder="Email address"  id="emailform"/>
                  <form:errors path="member_email"/>
               </div>
               
               <!-- Password -->
               <div id="password">
                  <form:input path="member_password" placeholder="Password"  id="passwordform"/>
                  <form:errors path="member_password"/>
               </div>
                     
               <!-- NickName -->
               <div id="nickname">
                  <form:input path="member_nickname" placeholder="Nickname" id="nicknameform"/>
                  <form:errors path="member_nickname"/>
               </div>
                  
               <!-- Status message -->
               <div id="Smessage">
                  <form:input path="member_profile" placeholder="Status message"  id="Smessageform"/>
                  <form:errors path="member_profile"/>
               </div>
            
            </div>
   <!--  --------------------------------------------------------------------------------- -->
            <div>
               Upload your Photo<br/>
               <input type="file" name="attach"/>
            </div>      
   <!--  --------------------------------------------------------------------------------- -->         
            <br />
            <div>
               <input type="submit" value= "회원가입" />
               <input type="reset"  value= "다시작성" />
            </div>
         </form:form>
      </div>
   </body>
</html>