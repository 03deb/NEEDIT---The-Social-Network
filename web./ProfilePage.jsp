<%-- 
    Document   : profile
    Created on : 28 Mar, 2021, 1:21:02 PM
    Author     : deb
--%>

<%@page import="com.needit.entities.AcceptFriendList"%>
<%@page import="com.needit.dao.FriendDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.needit.dao.UserLike"%>
<%@page import="java.util.List"%>
<%@page import="com.needit.entities.Post"%>
<%@page import="com.needit.dao.PostDao"%>
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
        <title>profile</title>
        <link rel="stylesheet" href="css/ProfilePage.css">
        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/d2a666bcc8.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/fbe1220bf5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@200;300&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
       <!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       --> 
       <script>
           var _0x4781=['block','.more-text','html','<span\x20class=\x22more-text\x22>','text','3AYIUkS','250px','length','unwrap','each','width','rsidenav','2cpWIRT','remove','getElementById','addEventListener','none','307379MXjhkq','mySidebar','contains','1pOaisz','substring','sendmsgto','644565rEPyJR','.read-more','myDIV','display','5197jMsngx','18491hmnKEt','append','contents','439683IYMWcz','mouseup','click','ready','target','53CHvAsJ','35314VHOFZw','913889DRLCWd','marginRight','trim','</span>','style'];var _0x484a55=_0x30f3;(function(_0x4d18f3,_0x382849){var _0x3e71e6=_0x30f3;while(!![]){try{var _0xf116ea=parseInt(_0x3e71e6(0x18f))+-parseInt(_0x3e71e6(0x195))*parseInt(_0x3e71e6(0x17c))+parseInt(_0x3e71e6(0x18b))*-parseInt(_0x3e71e6(0x194))+parseInt(_0x3e71e6(0x196))+parseInt(_0x3e71e6(0x181))+parseInt(_0x3e71e6(0x187))*-parseInt(_0x3e71e6(0x184))+-parseInt(_0x3e71e6(0x175))*-parseInt(_0x3e71e6(0x18c));if(_0xf116ea===_0x382849)break;else _0x4d18f3['push'](_0x4d18f3['shift']());}catch(_0x4f442e){_0x4d18f3['push'](_0x4d18f3['shift']());}}}(_0x4781,0xb131e));function _0x30f3(_0x2f735d,_0x4f01a7){return _0x30f3=function(_0x478108,_0x30f34b){_0x478108=_0x478108-0x171;var _0x4cc2a4=_0x4781[_0x478108];return _0x4cc2a4;},_0x30f3(_0x2f735d,_0x4f01a7);}function openNav(){var _0x5ad6fd=_0x30f3;document[_0x5ad6fd(0x17e)](_0x5ad6fd(0x182))[_0x5ad6fd(0x19a)][_0x5ad6fd(0x17a)]=_0x5ad6fd(0x176),document['getElementById']('main')['style']['marginRight']=_0x5ad6fd(0x176);}function closeNav(){var _0x3221db=_0x30f3;document[_0x3221db(0x17e)]('mySidebar')['style'][_0x3221db(0x17a)]='0',document[_0x3221db(0x17e)]('main')[_0x3221db(0x19a)][_0x3221db(0x197)]='0';}function myFunction(){var _0x2bec29=_0x30f3,_0x3aa158=document['getElementById'](_0x2bec29(0x189));_0x3aa158[_0x2bec29(0x19a)][_0x2bec29(0x18a)]===_0x2bec29(0x19b)?_0x3aa158[_0x2bec29(0x19a)]['display']=_0x2bec29(0x180):_0x3aa158[_0x2bec29(0x19a)][_0x2bec29(0x18a)]=_0x2bec29(0x19b);}document['addEventListener'](_0x484a55(0x190),function(_0x4fa2cb){var _0x3b69bb=_0x484a55,_0x231361=document['getElementById']('myDIV');!_0x231361[_0x3b69bb(0x183)](_0x4fa2cb[_0x3b69bb(0x193)])&&(_0x231361['style'][_0x3b69bb(0x18a)]='none');});function sendMsg(){var _0x56436d=_0x484a55,_0x3c732d=document[_0x56436d(0x17e)](_0x56436d(0x186));_0x3c732d[_0x56436d(0x19a)]['display']===_0x56436d(0x19b)?_0x3c732d[_0x56436d(0x19a)][_0x56436d(0x18a)]=_0x56436d(0x180):_0x3c732d['style'][_0x56436d(0x18a)]=_0x56436d(0x19b);}document[_0x484a55(0x17f)](_0x484a55(0x190),function(_0x2646f5){var _0xb7a722=_0x484a55,_0x54e0b3=document[_0xb7a722(0x17e)](_0xb7a722(0x186));!_0x54e0b3['contains'](_0x2646f5['target'])&&(_0x54e0b3[_0xb7a722(0x19a)][_0xb7a722(0x18a)]=_0xb7a722(0x180));}),$(document)[_0x484a55(0x192)](function(){var _0x46aa18=_0x484a55,_0xf06f36=0x64;$('.show-read-more')[_0x46aa18(0x179)](function(){var _0x215f6a=_0x46aa18,_0x128794=$(this)[_0x215f6a(0x174)]();if($[_0x215f6a(0x198)](_0x128794)[_0x215f6a(0x177)]>_0xf06f36){var _0x23f786=_0x128794[_0x215f6a(0x185)](0x0,_0xf06f36),_0x3839bd=_0x128794[_0x215f6a(0x185)](_0xf06f36,$['trim'](_0x128794)[_0x215f6a(0x177)]);$(this)['empty']()[_0x215f6a(0x172)](_0x23f786),$(this)[_0x215f6a(0x18d)]('\x20<a\x20href=\x22javascript:void(0);\x22\x20class=\x22read-more\x22>read\x20more...</a>'),$(this)[_0x215f6a(0x18d)](_0x215f6a(0x173)+_0x3839bd+_0x215f6a(0x199));}}),$(_0x46aa18(0x188))[_0x46aa18(0x191)](function(){var _0x1d20d9=_0x46aa18;$(this)['siblings'](_0x1d20d9(0x171))[_0x1d20d9(0x18e)]()[_0x1d20d9(0x178)](),$(this)[_0x1d20d9(0x17d)]();});});function openNavforrqst(){var _0x139588=_0x484a55;document[_0x139588(0x17e)](_0x139588(0x17b))[_0x139588(0x19a)][_0x139588(0x17a)]=_0x139588(0x176);}function closeNavforrqst(){var _0x132021=_0x484a55;document[_0x132021(0x17e)](_0x132021(0x17b))[_0x132021(0x19a)]['width']='0';}
             
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
        <div id="rsidenav" class="rsidenavb">
            <a href="javascript:void(0)" class="closebtnsn" onclick="closeNavforrqst()">×</a>
            
            <%
                UserDao ud = new UserDao(ConnectionStarter.getConnection());
                                
                FriendDao fd = new FriendDao(ConnectionStarter.getConnection());
                
                int AU_Id = user.getID();
                
               // out.println(AU_Id);
                
                List<AcceptFriendList> list5 = fd.getAcceptFriendList(AU_Id);
                           
                for (AcceptFriendList afl: list5)
                {
            
            %>
            
            
            <div id="rqstlst">
                <div id="rqstusrprfl"><img src="Pics/<%= ud.getUserByUserId(afl.getUser_Id()).getPROFILE()%>"></div>
                <a href="#" id="rqstusrname"><%= ud.getUserByUserId(afl.getUser_Id()).getNAME()%></a> 
                <label id="flul"><i class="fas fa-map-marker-alt"></i>&nbsp; <%=ud.getUserByUserId(afl.getUser_Id()).getLOCATION()%></label>
                <label id="fluls"><i class="fas fa-hands-helping"></i></label>
            </div>
            
            <%
                }
            %>
            
            
        </div>
        <div id="maindiv">
            <div class="glassmorphism">
                <div id="userinfo" >
                    <label id="username"><b><%= user.getNAME()%></b></label><br><br>
                    <label id="location"><i class="fas fa-map-marker-alt"></i>&nbsp; <%= user.getLOCATION() %></label>
                    <label id="birthday"><i class="fas fa-birthday-cake"></i> &nbsp; <%= user.getDOB() %> </label>
                    <label id="userbio"><i class="fas fa-user-edit"></i> &nbsp; <%= user.getABOUT() %> </label>
                    <a href="EditInfoPage.jsp" id="editbtn"><b>Edit Info</b></a>
                </div> 
                <div id="userprofile"><img src="Pics/<%= user.getPROFILE() %>" alt="not found"></div>
                
                
                <a href="#" id="ofrl" onclick="openNavforrqst()"><i class="fas fa-user-friends"></i> &nbsp; Mate-</a>
                
            </div>
            <div id="middlediv">
                <div class="a1"><a href="javascript:void(0)">Photos &nbsp; <i class="fas fa-image"></i></a></div>
                <div class="a1"><a href="javascript:void(0)">Likes &nbsp; <i class="fas fa-bolt"></i></a></div>
                <div class="a1"><a href="javascript:void(0)">Tags &nbsp; <i class="fas fa-paperclip"></i></a></div>
            </div>
     
            <%

               // Thread.sleep(500);
               //         UserDao ud = new UserDao(ConnectionStarter.getConnection());

                        UserLike ld = new UserLike(ConnectionStarter.getConnection());

                        PostDao pd = new PostDao(ConnectionStarter.getConnection());

                        int User_Id = user.getID();

                        List<Post> list3 = pd.getPostByUser_Id(User_Id);
                      //  out.println(User_Id);              
                        for (Post pp: list3)
                            {         
            %>
      
                <div class="mypost">
                     <div id="myname">

                         <div id="mynameuserprofile"><img src="Pics/<%= ud.getUserByUserId(pp.getUser_Id()).getPROFILE()%>" alt="not found"></div>
                         <a href="javascript:void(0)" id="myname1"><%= ud.getUserByUserId(pp.getUser_Id()).getNAME()%></a>
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
                                 <button id="sendsmtbtn"><i class="far fa-paper-plane"></i></button>
                             </div>
                            
                            <%
                                }
                            %>
                         </div>
                         <i id="menu" class="fas fa-ellipsis-v" onclick="myFunction()"></i>
                         <div id="myDIV">
                             <label id="sharebtn"><i class="fas fa-trash"></i> &nbsp; Delete</label><br>
                             <label id="sharebtn"><i class="far fa-eye-slash"></i> &nbsp; Hide</label>
                             <label id="sharebtn"><i class="fas fa-share-alt"></i> &nbsp; Share</label>
                         </div>
                     </div>
                </div>
            <%
                }
            %>           
        </div>             
    </body>
</html>
