<%@page import="java.util.List"%>
<%@page import="com.needit.entities.FriendList"%>
<%@page import="com.needit.dao.FriendDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.needit.dao.UserDao"%>
<%@page import="com.needit.helper.ConnectionStarter"%>
<%@page import="com.needit.servlets.LoginServlet"%>
<%@page import="com.needit.entities.User"%>
<%@page errorPage="error.jsp" %>
<%
    User  Cu=(User)session.getAttribute("currentUser");
    if(Cu == null)
    {
        response.sendRedirect("LoginPage.jsp");
    }

%>

<html>
    <head>
        <title>friend</title>
        <link rel="stylesheet" href="css/FriendList.css">
        <script src="https://kit.fontawesome.com/d2a666bcc8.js" crossorigin="anonymous"></script>
        <link href="your-project-dir/font-css/LineIcons.css" rel="stylesheet">
        <link href="https://cdn.lineicons.com/2.0/LineIcons.css" rel="stylesheet">
        <script>
            function openNav() {
              document.getElementById("mySidebar").style.width = "250px";
              document.getElementById("main").style.marginRight = "250px";
            }
            
            function closeNav() {
              document.getElementById("mySidebar").style.width = "0";
              document.getElementById("main").style.marginRight= "0";
            }

            function openNavforrqst() {
                document.getElementById("mySidebarqst").style.width = "250px";
            }

            function closeNavforrqst() {
                document.getElementById("mySidebarqst").style.width = "0";
            }
        </script> 
    </head>
    <body>
        <nav id="navbar"> 
            <div class="navmaindiv"><a href="ScrollFeed.jsp" id="notification"><i class="fab fa-gripfire"></i><!--<img style="width: 98%;" src="/images/home2.png">--></a></div>
            <div class="navmaindiv"><a href="FriendList.jsp"><img style=" width: 9%; height: 103%; left: 148px; top: 1px; position: absolute;" src="Images/preview.png"></a></div>
            <div class="navmaindiv"><a href="DYOR.jsp" id="notification"><i class="far fa-compass"></i></a></div>
            <div class="navmaindiv"><a href="Notification.jsp" id="notification"><i class="fa fa-bell-o" aria-hidden="true"></i><!--<img style="width: 98%;" src="/images/notify.png">--></a></div>
            <div id="mySidebar" class="sidebar">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                <a href="ProfilePage.jsp"><i class="fas fa-user-circle"></i> &nbsp;Profile</a>
                <a href="#"><i class="fas fa-user-shield"></i> Privacy</a>
                <a href="#"><i class="fas fa-history"></i> &nbsp;Activity</a>
                <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> &nbsp;Logout</a>
            </div>
            <div class="navmaindiv"><a href="javascript:void(0)" id="notification" class="openbtn" onclick="openNav()"><i class="fas fa-bars"></i><!--<img style="width: 98%;" src="/images/menu.png">--></a></div>
        </nav>
        <div class="header">
                <form>
                    <input type="text" name="search" placeholder="Search..">
                    <button type="submit"><i class="fas fa-search"></i></button>
                </form>
                    <div id="mySidebarqst" class="rqstsidenav">
                        <a href="javascript:void(0)" class="rqstclosebtn" onclick="closeNavforrqst()"><b>×</b></a>
                        
                        <%
                                UserDao ud = new UserDao(ConnectionStarter.getConnection());
                                
                                FriendDao fd = new FriendDao(ConnectionStarter.getConnection());

                                int User_Id = Cu.getID();
                                
                                
                              //  out.println(User_Id);
                                
                                List<FriendList> list3 = fd.getFriendList(User_Id);
                           
                                for (FriendList fdl: list3)
                                {
                               
                              // FriendList fdl = fd.getFriendList(CU);


                        %>
                        
                        <div id="rqstlst">
                            <div id="rqstusrprfl"><img src="Pics/<%= ud.getUserByUserId(fdl.getUser_Id()).getPROFILE()%>"></div>
                            <a href="#" id="rqstusrname"><%= ud.getUserByUserId(fdl.getUser_Id()).getNAME()%></a>
                            <button onclick="acceptRequest(<%= fdl.getUser_Id()%>,<%= Cu.getID()%>)" id="rqstusrightbtn">ACCEPT</button>
                            <button onclick="deleteRequest(<%=fdl.getF_Id()%>)" id="cnclbtn"><i class="fa fa-times" aria-hidden="true"></i></button>
                        </div>
                        
                            
                            
                        <%
                            }
                        %> 
                    </div>
                    <a href="#" id="usrgrp" onclick="openNavforrqst()"><i class="fa fa-users" aria-hidden="true"></i></a>
            </div>
        <div id="maindiv">
            
            
            <%
                
                   ArrayList<User> list2 = ud.getAllUser();
                        for (User uu : list2)
                        {
                            
            %>
            
            <div id="usrfrddiv">
                <div id="usrprofile">
                    <img src="Pics/<%=uu.getPROFILE()%>" alt="not found">
                </div>
                <div id="a1">
                    <a href="LockedPage.jsp?ID=<%=uu.getID()%>" id="usrname"><%=uu.getNAME()%> &nbsp; <i class="fa fa-check-circle" aria-hidden="true"></i></a><br>
                    <label id="usrloction"><i class="fas fa-map-marker-alt"></i> <%=uu.getLOCATION()%></label><br>
                    <button onclick="sendRequest(<%= uu.getID()%>,<%= Cu.getID()%>)" id="rqstbtn">Request &nbsp;<i class="fas fa-user-plus"></i></button>
                </div>
            </div>
            
            <%
                }
            %>
            
        </div>
          <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
          <script>
                
                 function sendRequest(User_Id, CU_Id)
                        {
                            console.log(User_Id + "," + CU_Id);
                            const T = {
                                User_Id: User_Id,
                                CU_Id: CU_Id,
                                operation: 'request'
                            };
                            
                            $.ajax({
                                
                                url:"RequestServlet",
                                data:T,
                                success:function (data, textStatus, jqXHR)
                                {
                                    console.log(data);
                                },
                               
                                error:function (jqXHR, textStatus, errorThrown)
                                {
                                    console.log(data);
                                }
                                
                            });
                      
                        }
                        
                        
                        function acceptRequest(User_Id, CU_Id)
                        {
                            console.log(User_Id + "," + CU_Id);
                            const A = {
                                User_Id: User_Id,
                                CU_Id: CU_Id,
                                operation: 'accept'
                            };
                            
                            $.ajax({
                                
                                url:"RequestServlet",
                                data:A,
                                success:function (data, textStatus, jqXHR)
                                {
                                    console.log(data);
                                },
                               
                                error:function (jqXHR, textStatus, errorThrown)
                                {
                                    console.log(data);
                                }
                                
                            });
                      
                        }
                        
                        function deleteRequest(F_Id)
                        {
                            console.log(F_Id);
                            const S = {
                                F_Id: F_Id,
                                operation: 'delete'
                            };
                            
                            $.ajax({
                                
                                url:"RequestServlet",
                                data:S,
                                success:function (data, textStatus, jqXHR)
                                {
                                    console.log(data);
                                },
                               
                                error:function (jqXHR, textStatus, errorThrown)
                                {
                                    console.log(data);
                                }
                                
                            });
                      
                        }
                        
                        
            </script>  
            
    </body>
</html>