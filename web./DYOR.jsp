<%@page import="java.util.List"%>
<%@page import="com.needit.entities.Post"%>
<%@page import="com.needit.dao.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.needit.entities.Category"%>
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
        <title>Discover</title>
        <link rel="stylesheet" href="css/DYOR.css">
        <script src="https://kit.fontawesome.com/d2a666bcc8.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/fbe1220bf5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
        <div id="maindiv">
            
            <div class="container">
                <div class="row">
                    <div class="col-sm" onclick="getPost(0)">All</div>  
                    <%
                        PostDao d = new PostDao(ConnectionStarter.getConnection());
                            ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {
                    
                    %>
                    
                    <div class="col-sm" onclick="getPost(<%= cc.getCat_id()%>)"><%= cc.getCat_Name()%></div>
                  
                    <%
                            }
                    %>
                    
                    
                </div>
            </div>
            <div class="container text-center" id="loader">
                    <i class="fas fa-redo fa-1x fa-spin"></i>
            </div>
            <br>
            <div id="postdata">
                
                
            </div>
              
      
        </div>
         
                    
                    
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
           
        <script>
            
            function getPost(Cat_Id){
               
               $("#loader").show();
               $("#postdata").hide();
               
                $.ajax({
                    url:"loadpost.jsp",
                    data:{Cust_Id:Cat_Id},
                    success: function (data, textStatus, jqXHR) {
                        
                        console.log(data);
                        $("#loader").hide();
                        $("#postdata").show();
                        $("#postdata").html(data);
                        
                    }
                });
            }
            
            
            
            
            $(document).ready(function(e){
                
               getPost(0)
               
            });
            
        </script>  
   
   
                    
                    
                    
                    
                    
                    
                    
    </body>
</html>