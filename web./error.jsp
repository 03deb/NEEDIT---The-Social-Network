<%-- 
    Document   : error
    Created on : 20 Apr, 2021, 2:48:35 PM
    Author     : deb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! Something went wrong ...</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <style>
            
            
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            
        </style>
        
        
    </head>
    
    <body>
        
        <div class="container text-center">
            
            <img src="Images/blue-screen.png" class="img-fluid" height="400px" width="400px">
            <h3>Sorry ! Something went wrong ...</h3>
            
            <a href="LoginPage.jsp" class="btn btn-info btn-lg  text-black mt-3">Back</a> 
            
        </div>
        
    </body>
    
</html>
