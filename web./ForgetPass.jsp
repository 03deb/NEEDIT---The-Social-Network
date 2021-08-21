<%@page import="com.needit.entities.Message"%>
<html>
    <head>
        <title>Recover Password</title>
        <link rel="stylesheet" href="css/ForgetPass.css"> 
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
        <div class="tophead">
            Recover your password
        </div>
        <div class="maindiv">
            <form action="ForgetPassServlet" method="post">
                <label class="userinfo">Please enter your email address below and we will send you information to change your password.</label>
                <br>
                <input class="outline" type="email" name="mail" placeholder="Enter your email address" required autofocus >
                <button class="vmail">Verify email</button>
                
            </form>
            
            <%
                String pass=(String)session.getAttribute("pass");
                System.out.println("password:-"+pass);
									
		if(pass!=null) 
                    {
                        out.println("<span style='color:red; font-size:15px;' name='msg' id='msg'>"+pass+"</span><br>");
                        session.removeAttribute("pass");

                    }
                else
                {
                    %>  
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
                        
            <%            
                }
            %>
         
            
   
        </div>
    </body>
</html>