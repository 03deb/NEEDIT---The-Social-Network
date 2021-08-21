<%@page import="com.needit.dao.UserDao"%>
<%@page import="com.needit.helper.ConnectionStarter"%>
<%@page import="com.needit.entities.User"%>


<%
    User user=(User)session.getAttribute("currentUser");
    if(user == null)
    {
        response.sendRedirect("LoginPage.jsp");
    }

%>

<%
    int ID = Integer.parseInt(request.getParameter("ID"));
    
    UserDao ud = new UserDao(ConnectionStarter.getConnection());
    
    User u = ud.getUserByUserId(ID);

%>

<html>
    <head>
        <title>profilelockedpage</title>
        <link rel="stylesheet" href="css/ProfilePage.css">
        <link rel="stylesheet" href="css/LockedPage.css" >
        <link rel="stylesheet" type="text/css" href="csshake.min.css">
        <link rel="stylesheet" type="text/css" href="https://csshake.surge.sh/csshake.min.css">
        <link rel="stylesheet" href="yourpath/magic.css">
        <link rel="stylesheet" href="yourpath/magic.min.css">
         <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/d2a666bcc8.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/fbe1220bf5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@200;300&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
        
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
            <div class="navmaindiv"><a href="ScrollFeed.jsp" id="notification"><i class="fab fa-gripfire"></i></a></div>
            <div class="navmaindiv"><a href="FriendList.jsp"><img style=" width: 9%; height: 103%; left: 148px; top: 1px; position: absolute;" src="Images/preview.png"></a></div>
            <div class="navmaindiv"><a href="DYOR.jsp" id="notification"><i class="far fa-compass"></i></a></div>
            <div class="navmaindiv"><a href="Notification.jsp" id="notification"><i class="fa fa-bell-o" aria-hidden="true"></i></a></div>
            <div id="mySidebar" class="sidebar">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                <a href="ProfilePage.jsp"><i class="fas fa-user-circle"></i> &nbsp;Profile</a>
                <a href="#"><i class="fas fa-user-shield"></i> Privacy</a>
                <a href="ActivityPage.jsp"><i class="fas fa-history"></i> &nbsp;Activity</a>
                <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> &nbsp;Logout</a>
            </div>
            <div class="navmaindiv"><a href="javascript:void(0)" id="notification" class="openbtn" onclick="openNav()"><i class="fas fa-bars"></i></a></div>
        </nav>
        <div id="maindiv">
            <div class="glassmorphism">
                <div id="userinfo" >
                    <label id="username"><b><%=u.getNAME()%></b></label><br><br>
                    <label id="location"><i class="fas fa-map-marker-alt"></i>&nbsp; <%=u.getLOCATION()%></label>
                    <label id="birthday"><i class="fas fa-birthday-cake"></i> &nbsp; <%=u.getDOB()%> </label>
                    <label id="userbio"><i class="fas fa-user-edit"></i> &nbsp; <%=u.getABOUT()%> </label>
                    <button class="shake-little" id="rqstbtn"><b>Request</b></button>
                </div> 
                <div id="userprofile"><img src="Pics/<%=u.getPROFILE()%>" alt="not found"></div>
                <a href="#" id="ofrl" onclick="openNavforrqst()"><i class="fas fa-user-friends"></i> &nbsp; Mate-</a>
            </div>
            <div id="lockedmsg">
                    <p>PROFILE IS PROTECTED<br>REQUEST TO SEE
                        <br><br>
                        <i class="shake-little fas fa-lock fa-2x"></i>
                    </p>                    
            </div>
        </div>
    </body>
</html>