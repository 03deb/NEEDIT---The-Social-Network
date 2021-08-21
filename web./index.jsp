<%-- 
    Document   : register
    Created on : 16 Mar, 2021, 12:54:59 PM
    Author     : deb
--%>

<%@page import="com.needit.helper.ConnectionStarter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        
        <title> Needit.com-Signup </title>
        <link rel="stylesheet" href="css/Homepage.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> 
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@700&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet"> 
        <script src="https://kit.fontawesome.com/d2a666bcc8.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/fbe1220bf5.js" crossorigin="anonymous"></script>
        
    <script> 
        function validate()
        {
            var x = document.forms["myform"]["uname"].value;
            if(x == "")
            {
                alert("Name Must Be Filled Out");
                return false;
            }
            
           /*str1 = document.forms["myform"]["email"].value;
            patt1 = /^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3})+$/i;
            a = patt1.test(str1);
            if(a == false)
            {
                alert("Please Input Valid Email Address");
                str1.focus();
                return false;
            }

            return true;*/
        }
        function Passwords()
        {
            var y = document.getElementById("getpass");
            if(y.type === "password")
            {
                y.type = "text";
            }
            else
            {
                y.type = "password";
            }
        }
        
        var check = function() {
            if (document.getElementById("getpass").value == document.getElementById("confirm_password").value) {
            document.getElementById("message").style.color = 'green';
            document.getElementById("message").innerHTML = 'matching';
            } else {
                document.getElementById("message").style.color = 'red';
                document.getElementById("message").innerHTML = 'not matching';
            }
        }
        
    </script>   
    </head>
    <body background="Images/bg.png"> 
        <div class="a4">
           <h1> Needit</h1>
           <p>Connect &nbsp; People &nbsp;  Easily<br>From &nbsp; Anywhere...</p>
        </div>
        
            <div class="a1">
                
                <h1 class="a3">The Social Engine</h1>
                
                <hr color="#02066F">
                
                <h2 class="signhead">signup</h2>
                
                <form action="RegisterServlet" id="reg-form" name="myform" method="post" onsubmit="return validate()">
                    
                    <div class="a2">
                        
                        Name:<br> <input type="text" name="uname" class="outline" required autofocus><br><br>
                        
                        Email:<br> <input type="email" name="email" id="mail" class="outline" required ><br><br>
                        
                        Password:<br> <input type="password" name="pass" id="getpass" onkeyup="check();" class="outline"minlength="12" maxlength="18" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 12 or more characters" required>
                        
                        <input type="checkbox" class="lock" onclick="Passwords()">
                        
                        <br><br>
                        
                        Confirm password:<br> <input type="password" id="confirm_password" name="cnfpass" class="outline" onkeyup="check();" required>
                        
                        <span id='message'></span>
                        
                        <br><br>
                    </div>
                    
                    <br>
                    
                    <button  id="smt-btn" class="nextbtn">Next</button> 
                    
                    <div class="container text-center" id="loader">
                        <span><b>Please wait...&nbsp;</b></span>   <i class="fas fa-sync-alt fa-spin"></i>
                    </div>
                    
                    <br>
                    
                    <a href="LoginPage.jsp" class="lgnbtn">Login</a>
                    
                </form>                 
            </div>  
        
     <!--<javascript-->
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            
            $(document).ready(function(){
                
                console.log("loaded.....");
                
                
                $('#reg-form').on('submit',function (event){
                   
                   event.preventDefault();
                   
                   let form = new FormData(this);
                   
                   $("#smt-btn").hide();
                   $("#loader").show();
                   
                   $.ajax({
                       
                       url: "RegisterServlet",
                       method: 'post',
                       data: form,
                       
                       success: function(data, textStatus, jqXHR)
                       {
                           console.log(data);
                           
                           $("#smt-btn").show();
                           $("#loader").hide();
                           
                           if(data.trim() === 'done')
                           {
                                swal("You are registered successfully.Redricting to login page")
                                 .then((value) => {
                                   window.location = "LoginPage.jsp";
                                 });
                            
                            }
                            else
                            {
                                swal(data);
                            }
                           
                       },
                       
                       error: function(jqHXR, textStatus, errorThrown){
                          
                           $("#smt-btn").show();
                           $("#loader").hide();
                           swal("Something went wrong ?");
                           
                       },
                       
                       processData: false,
                       contentType: false
                       
                       
                    });
        
                    
                });
                
                
            });
            
            
        </script>
        
    </body>
    
</html>