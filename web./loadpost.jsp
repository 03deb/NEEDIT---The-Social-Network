<%@page import="com.needit.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.needit.entities.Post"%>
<%@page import="com.needit.helper.ConnectionStarter"%>
<%@page import="com.needit.dao.PostDao"%>
<%@page errorPage="error.jsp" %>

<div class="row">

<%
   // Thread.sleep(500);
    PostDao pd = new PostDao(ConnectionStarter.getConnection());
    int Cust_Id =  Integer.parseInt(request.getParameter("Cust_Id"));
   // out.println(Cust_Id);
    List<Post> post = null;
    if(Cust_Id == 0)
    {
        post = pd.getAllPost();
    }
    else
    {
        post = pd.getPostByCustId(Cust_Id);
    }
    for(Post p:post){
        
%>
        
        <div class="col-md-6 mt-2" id="small-pst-div">
            <div id="post-img-size" class="text-center"><img id="small-pst-img" src="postimage/<%= p.getPost_Pic()%>" alt="not found"></div>
                <div id="user-content">
                    <p><%= p.getPost_Content()%></p>
                </div>
            <footer id="footer-btn"><a href="show Post.jsp?Post_Id=<%= p.getPost_Id() %>">OPEN</a></footer> 
        </div>


        
<%
        
    }

%>
  
</div>