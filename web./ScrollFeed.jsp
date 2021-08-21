<%@page import="com.needit.dao.FriendDao"%>
<%@page import="com.needit.entities.AcceptFriendList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.needit.entities.Post"%>
<%@page import="com.needit.dao.UserLike"%>
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
        <title>Homepage.com</title>
        <link rel="stylesheet" href="css/ScrollFeed.css">
        <link rel="stylesheet" href="css/ProfilePage.css">
        <script src="https://kit.fontawesome.com/d2a666bcc8.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/fbe1220bf5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
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


            function myPOST() {
                var x = document.getElementById("myPOST");
                if (x.style.display === "block") {
                  x.style.display = "none";
                } 
                else {
                  x.style.display = "block";
                }
            }

            document.addEventListener('mouseup', function(e) {
               var myPOST = document.getElementById('myPOST');
               if (!myPOST.contains(e.target)) {
                myPOST.style.display = 'none';
                }
            });


            var loadImage = function(event) {
	                var image = document.getElementById('output');
	                image.src = URL.createObjectURL(event.target.files[0]);
            };
            
            var loadVideo = function(event) {
	                var video = document.getElementById('vidoutput');
	                video.src = URL.createObjectURL(event.target.files[0]);
            };
            
            
            
            /* var Notify = document.getElementById("Notify");

                Notify.addEventListener("click",function(){
                    Notify.style.color = "#00ADB5";
            }); */
            
        </script>
    </head>
    <body>
        <nav id="navbar"> 
            <div class="navmaindiv"><a href="javascript:void(0)" id="notification"><i class="fab fa-gripfire"></i></a></div>
            <div class="navmaindiv"><a href="FriendList.jsp"><img style=" width: 9%; height: 103%; left: 148px; top: 1px; position: absolute;" src="Images/preview.png"></a></div>
            <div class="navmaindiv"><a href="DYOR.jsp" id="notification"><i class="far fa-compass"></i></a></div>
            <div class="navmaindiv"><a href="Notification.jsp" id="notification"><i class="fa fa-bell-o" aria-hidden="true"></i></a></div>
            <div id="mySidebar" class="sidebar">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                <a href="ProfilePage.jsp"><i class="fas fa-user-circle"></i> &nbsp;Profile</a>
                <a href="#"><i class="fas fa-user-shield"></i> Privacy</a>
                <a href="#"><i class="fas fa-history"></i> &nbsp;Activity</a>
                <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> &nbsp;Logout</a>
            </div>
            <div class="navmaindiv"><a href="javascript:void(0)" id="notification" class="openbtn" onclick="openNav()"><i class="fas fa-bars"></i></a></div>
        </nav> 
        <div id="maindiv">
           <!--- <div id="addpostdiv">
                <input id="addmycontent" type="text" name="mycontent">
                <input type="file" id="upload" hidden/>
                <label class="uploadphoto" for="upload"><i class="far fa-image"></i></label>

            </div>-->
           
           <%
                UserDao ud = new UserDao(ConnectionStarter.getConnection());
               
                UserLike ld = new UserLike(ConnectionStarter.getConnection());

                PostDao pd = new PostDao(ConnectionStarter.getConnection());
                
                FriendDao fd = new FriendDao(ConnectionStarter.getConnection());
                
                int User_Id = user.getID();
                
                
              //  out.println(User_Id);   
                
                List<AcceptFriendList> list5 = fd.getAcceptFriendList(User_Id);
                
                for (AcceptFriendList afl: list5)
                {
                
                    List<Post> list3 = pd.getPostByUser_Id(afl.getUser_Id());      
                        for (Post pp: list3)
                        { 
           
           
           %>
           
           

            <div class="myposts">
                <div id="myname">
                    <div id="mynameuserprofile"><img src="Pics/<%= ud.getUserByUserId(afl.getUser_Id()).getPROFILE() %>" alt="not found"></div>
                    <a href="LockedPage.jsp?ID=<%=ud.getUserByUserId(afl.getUser_Id()).getID()%>" id="myname1"><%= ud.getUserByUserId(afl.getUser_Id()).getNAME()%></a>
                </div>
                <div id="infoofmycontent">
                   <p id="mycontent" class="show-read-more">
                       <%= pp.getPost_Content()%> 
                   </p>
                </div>
                <div id="myphoto">
                    <img src="postimage/<%= pp.getPost_Pic()%>" alt="Error">
                </div>
                <div id="reactionpost">
                    <div id="show-post-time">
                            <label id="label-name">Posted on</label>
                            <p><%=  DateFormat.getDateTimeInstance().format(pp.getPost_Date())%></p>
                        </div>
                    <button onclick="likeOnPost(<%= pp.getPost_Id()%>,<%= user.getID()%>)" class="like_btn">
                            <span id="icon"><i id="bolt" class="fas fa-bolt"></i></span>
                            <span id="count" class="like-counter"><%= ld.countLikesOnPost(pp.getPost_Id()) %></span>
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
                            </script>
                 <!--   <script>
                        const likeBtn = document.querySelector(".like_btn");
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
                        });

                    </script> -->

                    <i id="sendto" class="fas fa-paper-plane" onclick="sendMsg()"></i>
                    <div id="sendmsgto">
                        
                        <%
                            for (AcceptFriendList afls: list5)
                            {
                        
                        %>
                        
                        
                        <div id="maindivofsend">
                            <div id="sendprfl">
                                <img src="Pics/<%= ud.getUserByUserId(afls.getUser_Id()).getPROFILE()%>" alt="error">
                            </div>
                            <label id="sendprflname"><%= ud.getUserByUserId(afls.getUser_Id()).getNAME()%></label>
                            <button id="sendsmtbtn"><i class="fas fa-location-arrow"></i></button>
                        </div>
                        
                        <%
                            }
                        %>
                        
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
               
            <%
                    }


                }
            %>
                
                
                
            <div id="uploadposts">
                <i class="fas fa-pen" onclick="myPOST()"></i>
                <div id="myPOST">
                    <form id="mypostform" action="AddPostServlet" method="post">
                        <div id="myPROFILEphoto"><img src="Pics/<%= user.getPROFILE() %>"></div>
                        <textarea class="pstdscptn" type="text" id="postdiscreption" name="pstdscptn" required></textarea>

                        <input type="file"  accept="image/*" name="image" id="file"  onchange="loadImage(event)" style="display: none;">
                        <label id="uploadpostBTN" for="file" style="cursor: pointer;"><i class="fas fa-image"></i></label>
                        <img id="output" width="200" height="200" />

                       <!-- <input type="file" accept="video/mp4,video/x-m4v,video/*" name="video" id="vid"  onchange="loadVideo(event)" style="display:none;">
                        <label id="vidupldbtn" for="vid" style="cursor: pointer;"><i class="fas fa-video"></i></label>
                        <video id="vidoutput" width="200"></video>-->

                     <!--   <label hidden id="pollbtn" style="cursor: pointer;"><i class="fas fa-poll"></i></label> -->
                        
                        
                        <div id="slctCatgry">
                            <select name="cid">
                                <option selected disabled>--</option>
                                
                                <%
                                        PostDao postd = new PostDao(ConnectionStarter.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                %>
                                
                                <option value="<%= c.getCat_id() %>"><%= c.getCat_Name() %></option>
                               <%
                                        }
                                %>
                            </select>
                        </div>
                        <label hidden id="catgorybtn" style="cursor: pointer;"><i class="fas fa-clipboard-list"></i></label>

                      <!-- <input type="reset" value="reset" id="rst" style="display: none;">
                        <label id="rstbtn" for="rst" style="cursor: pointer;"><i class="fas fa-times"></i></label>
                       -->
                       
                       <button id="postbtn" type="submit">Post</button>
                    </form>
                </div>
            </div>
        </div>
        
                            
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
            <script>
            $(document).ready(function (e) {
                //
                $("#mypostform").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..");
                    
                    let form = new FormData(this);
                    
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'post',
                        data: form,
                        
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            
                            if (data.trim() == 'done')
                            
                            {
                                swal("Thank You", "Posted successfully", "success");
                            } 
                            
                            else
                            {
                                swal("Error!!", "Something went wrong try again...1", "error");
                            }
                            
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...2", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
          
                            
    </body>
</html>