<%@page import="com.needit.entities.Message"%>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="css/Login.css"> 
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Langar&display=swap" rel="stylesheet"> 
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Langar&family=Nova+Flat&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@500&display=swap" rel="stylesheet"> 
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500&display=swap" rel="stylesheet"> 
        
    </head>
    <body background="Images/cloud.png">
        <div class="info">
            <h2 class="welcome">Welcome</h2>
            <p class="creative">The   New  Era  Of <br><b>Social Engine</b><br> to   Share   Creativity   &   Idea...</p>
        </div>
        <div class="logininfo">
            <h1 class="needit">Needit</h1>
            <hr color="#02066F">
            <h2 class="login">Login</h2>
            <form action="LoginServlet" method="post"> 
                <div class="a1">
                    <p>Email</p>
                    <input class="outline" type="email" name="mail" required autofocus><br><br>
                    <p>Password</p>
                    <input class="outline" type="password" name="pass" required><br><br>
<!--                    <p>OTP</p>
                    <input class="outline" type="text" name="otp"><br><br><br>                 -->
                </div>
                <button class="lgnbtn"><b>Login</b></button><br>   
            </form>
            <div class="invalidmsg">
                <%
                    Message m = (Message)session.getAttribute("msg");
                    if(m != null){
                %>
                        
                <div class="alert <%= m.getCssClass() %>" role="alert">
                    <%= m.getContent() %>
                </div>
                
                
                <%
                    session.removeAttribute("msg");
                    }
                %>
            </div>
            <a href="ForgetPass.jsp" class="frgtpass" >Forget Password ?</a>   
        </div>
    </body>
</html>