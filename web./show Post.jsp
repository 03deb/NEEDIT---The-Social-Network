<%@page import="com.needit.dao.UserLike"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.needit.entities.Post"%>
<%@page import="com.needit.dao.PostDao"%>
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

<%
    int PostId = Integer.parseInt(request.getParameter("Post_Id"));
    
    PostDao d = new PostDao(ConnectionStarter.getConnection());
    
    Post p = d.getPostByPostId(PostId);


%>

<html>
    <head>
        <title>Post</title>
        <link rel="stylesheet" href="css/ProfilePage.css">
        <link rel="stylesheet" href="css/showpost.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/d2a666bcc8.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/fbe1220bf5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@200;300&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script>
            function openNav() {
              document.getElementById("mySidebar").style.width = "250px";
              document.getElementById("main").style.marginRight = "250px";
            }
            
            function closeNav() {
              document.getElementById("mySidebar").style.width = "0";
              document.getElementById("main").style.marginRight= "0";
            }
            
            function myFunction() {
                var x = document.getElementById("myDIVs");
                if (x.style.display === "block") {
                  x.style.display = "none";
                } 
                else {
                  x.style.display = "block";
                }
            }

            document.addEventListener('mouseup', function(e) {
               var myDIVs = document.getElementById('myDIVs');
               if (!myDIVs.contains(e.target)) {
                myDIVs.style.display = 'none';
                }
            });

            function sendMsg() {
                var x = document.getElementById("sendmsgto");
                if (x.style.display === "block") {
                  x.style.display = "none";
                } 
                else {
                  x.style.display = "block";
                }
            }

            document.addEventListener('mouseup', function(e) {
               var sendmsgto = document.getElementById('sendmsgto');
               if (!sendmsgto.contains(e.target)) {
                sendmsgto.style.display = 'none';
                }
            });

            $(document).ready(function(){
	            var maxLength = 100;
	            $(".show-read-more").each(function(){
		            var myStr = $(this).text();
		            if($.trim(myStr).length > maxLength){
			            var newStr = myStr.substring(0, maxLength);
			            var removedStr = myStr.substring(maxLength, $.trim(myStr).length);
			            $(this).empty().html(newStr);
			            $(this).append(' <a href="javascript:void(0);" class="read-more">read more...</a>');
			            $(this).append('<span class="more-text">' + removedStr + '</span>');
		            }
	            });
	            $(".read-more").click(function(){
		            $(this).siblings(".more-text").contents().unwrap();
		            $(this).remove();
	            });
            });
            
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
            <div id="head">
               <a href="DYOR.jsp" id="backnavi"><i class="fa fa-arrow-left" aria-hidden="true"></i> &nbsp; <b>Back</b></a>
            </div>
            
            <div class="myposts">
                <div id="myname">
                    
                    <% UserDao ud = new UserDao(ConnectionStarter.getConnection());%>
                    
                    <div id="mynameuserprofile"><img src="Pics/<%= ud.getUserByUserId(p.getUser_Id()).getPROFILE() %>" alt="not found"></div>
                    <a href="#" id="myname1"><%= ud.getUserByUserId(p.getUser_Id()).getNAME() %></a>
                </div>
                <div id="infoofmycontent">
                   <p id="mycontent" class="show-read-more">
                       <%= p.getPost_Content()%>
                   </p>
                </div>
                <div id="myphoto">
                    <img src="postimage/<%=p.getPost_Pic()%>" alt="Error">
                </div>
                <div id="reactionpost">
                    <div id="show-post-time">
                        <label id="label-name">Posted on</label>
                        <p><%=  DateFormat.getDateTimeInstance().format(p.getPost_Date())%></p>
                    </div>
                    <button onclick="likeOnPost(<%= p.getPost_Id()%>,<%= user.getID()%>)" class="like_btn">
                        <span id="icon"><i id="bolt" class="fas fa-bolt"></i></span>
                        
                        <%
                        UserLike ld = new UserLike(ConnectionStarter.getConnection());
                        %>
                        
                        <span id="count" class="like-counter"><%= ld.countLikesOnPost(p.getPost_Id()) %></span>
                    </button>
                    <script>
                      
                      function likeOnPost(Post_Id, User_Id)
                        {
                            console.log(Post_Id + "," + User_Id);
                            const d = {
                                Post_Id: Post_Id,
                                User_Id: User_Id,
                                operation: 'like'
                            }
                            
                            $.ajax({
                                url: "LikeServlet",
                                data: d,
                                success: function (data, textStatus, jqXHR) {
                                    console.log(data);
                                    if (data.trim() == 'true')
                                    {
                                        let c = $(".like-counter").html();
                                        c++;
                                        $('.like-counter').html(c);
                                    }
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    console.log(data)
                                }
                            });
                      
                        }
    
    
 
    /*  const likeBtn = document.querySelector(".like_btn");
                        let likeIcon = document.querySelector("#icon"),
                            count = document.querySelector("#count"); 

                        let clicked = false;


                        likeBtn.addEventListener("click", () => {
                            if (!clicked) {
                                clicked = true;
                                likeIcon.innerHTML = `<i style="color:yellow; font-size:33px; position:absolute; left: -28; bottom: -6;" class="fas fa-bolt"></i>`;
                                count.textContent++;
                            } else {
                                clicked = false;
                                likeIcon.innerHTML = `<i style="color:black; font-size:33px; position:absolute; left: -28; bottom: -6;" class="fas fa-bolt"></i>`;
                                count.textContent--;
                            }
                        });*/
                        
                    </script>
                    <i id="sendto" class="fas fa-paper-plane" onclick="sendMsg()"></i>
                    <div id="sendmsgto">
                        <div id="maindivofsend">
                            <div id="sendprfl">
                                <img src="Images/abcd.jpg" alt="error">
                            </div>
                            <label id="sendprflname">Abay Giri</label>
                            <button id="sendsmtbtn"><i class="far fa-paper-plane"></i></button>
                        </div>
                    </div>
                    <i id="menu" class="fas fa-ellipsis-v" onclick="myFunction()"></i>
                    <div id="myDIVs">
                        <label id="sharebtns"><i class="fas fa-link"></i> &nbsp; Copy Link</label>
                        <label id="sharebtns"><i class="fas fa-volume-mute"></i> &nbsp; Mute</label>
                        <label id="sharebtns"><i class="fas fa-share-alt"></i> &nbsp; Share</label>
                        <label id="sharebtns"><i class="fas fa-angry"></i> &nbsp; Report...</label>
                    </div> 
                </div>
            </div>
            
            
            
            
            
        </div>
    </body>
</html>