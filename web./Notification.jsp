<%@page import="com.needit.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.needit.dao.UserDao"%>
<%@page import="com.needit.helper.ConnectionStarter"%>
<%@page import="com.needit.servlets.LoginServlet"%>
<%@page import="com.needit.entities.User"%>
<%@page errorPage="error.jsp" %>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user == null)
    {
        response.sendRedirect("LoginPage.jsp");
    }

%>

<html>
    <head>
        <title>notification</title>
        <link rel="stylesheet" href="css/Notification.css">
        <script src="https://kit.fontawesome.com/d2a666bcc8.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/fbe1220bf5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
        <script>
            function openNav() {
              document.getElementById("mySidebar").style.width = "250px";
              document.getElementById("main").style.marginRight = "250px";
            }
            
            function closeNav() {
              document.getElementById("mySidebar").style.width = "0";
              document.getElementById("main").style.marginRight= "0";
            }
            
        </script>
    </head>
    <body>
        <nav id="navbar"> 
            <div class="navmaindiv"><a href="ScrollFeed.jsp" id="notification"><i class="fab fa-gripfire"></i><!--<img style="width: 98%;" src="/images/home2.png">--></a></div>
            <div class="navmaindiv"><a href="FriendList.jsp"><img style=" width: 9%; height: 103%; left: 148px; top: 1px; position: absolute;" src="Images/preview.png"></a></div>
            <div class="navmaindiv"><a href="DYOR.jsp" id="notification"><i class="far fa-compass"></i></a></div>
            <div class="navmaindiv"><a href="javascript:void(0)" id="notification"><i class="fa fa-bell-o" aria-hidden="true"></i><!--<img style="width: 98%;" src="/images/notify.png">--></a></div>
            <div id="mySidebar" class="sidebar">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                <a href="ProfilePage.jsp"><i class="fas fa-user-circle"></i> &nbsp;Profile</a>
                <a href="#"><i class="fas fa-user-shield"></i> Privacy</a>
                <a href="#"><i class="fas fa-history"></i> &nbsp;Activity</a>
                <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> &nbsp;Logout</a>
            </div>
            <div class="navmaindiv"><a href="javascript:void(0)" id="notification" class="openbtn" onclick="openNav()"><i class="fas fa-bars"></i><!--<img style="width: 98%;" src="/images/menu.png">--></a></div>
        </nav> 
        <div id="maindiv">
            <!--<div id="Notifiydiv">
                <div id="mynamenotfyprofile"><img src=" Pics/<%= user.getPROFILE() %>" alt="not found"></div>
                <div id="notfymsg"><a href="#"><%= user.getNAME()%></a>&nbsp;<label>Likes Your Photo</label></div>
            </div>
            <div id="Notifiydiv2">
                <div id="mynamenotfyprofile"><img src=" Pics/<%= user.getPROFILE() %>" alt="not found"></div>
                <div id="notfymsg"><a href="#"><%= user.getNAME()%></a>&nbsp;<label>Send You A Request</label></div>
            </div> -->
            <div class="invalidmsg">
                <%
                        Message m = (Message)session.getAttribute("msg");
                        if(m != null){
                    %>

                    <div class="alert <%= m.getCssClass() %>" role="alert">
                        <%= m.getContent() %>
                    </div>


                    <%
                        //session.removeAttribute("msg");
                        }
                    %>
            </div>
            
        </div>
    </body>
</html>