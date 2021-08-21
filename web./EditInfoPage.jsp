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
        <title></title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/EditInformation.css">
        <script src="https://kit.fontawesome.com/d2a666bcc8.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div id="maindivs">
            <div id="head">
               <a href="ProfilePage.jsp" id="backnavi"><i class="fa fa-arrow-left" aria-hidden="true"></i> &nbsp; <b>Back</b></a>
            </div>
            <h3 style="text-align: center; font-family: 'Rubik',sans-serif; font-weight: normal;
    cursor: no-drop;">If You Save Without Editing Anything Your Data Will Lost.</h3>
            <div id="userinfo">
                <form action="EditServlet"  method="POST" enctype="multipart/form-data">
                    <table id="usercontent">
                        <tr>
                            <td>ID </td>
                            <td><%= user.getID()%></td>
                        </tr>
                        <tr>
                            <td>Profile</td>
                            <td><input accept="image/png, image/jpeg" type="file" id="usrprofile" name="userphoto" <%= user.getPROFILE()%> ></td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" id="fname" name="fname" value="<%= user.getNAME() %>" ></td>
                        </tr>
                        <tr>
                            <td>DOB</td>
                            <td><input type="date" id="usrdob" name="dob" value="<%= user.getDOB() %>" ></td>
                        </tr>
                        <tr>
                            <td>Location</td>
                            <td><input type="text" id="usrloct" name="location" value="<%= user.getLOCATION() %>" ></td>
                        </tr>
                        <tr>
                            <td>Gmail</td>
                            <td><input type="email"  id="usrmail" name="umail" value="<%= user.getEMAIL() %>"></td>
                        </tr>
                        <tr>
                            <td>Bio</td>
                            <td><textarea rows="3" name="userMessage" id="prtmsg" value="<%= user.getABOUT() %>"></textarea></td>
                        </tr>   
                    </table><br><br><br>
                    
                    <button id="smtbtn" type="submit">Save</button>
                </form>
            </div>
        </div>
    </body>
</html>