package com.needit.dao;

import com.needit.entities.Category;
import com.needit.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
public class PostDao {
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "select * from Category";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int Cat_Id = set.getInt("Cat_Id");
                String Cat_Name = set.getString("Cat_Name");
                Category c = new Category(Cat_Id, Cat_Name);
                list.add(c);
            }

        } 
        catch (Exception e){
            
            e.printStackTrace();
            
        }

        return list;
    }
    
    
    public boolean savePost(Post p)
    {
        boolean f = false;
        try{
            
            String q = "insert into Post(Post_Content, Post_Pic, Cust_Id, User_Id) values(?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            
            pstmt.setString(1,p.getPost_Content());
            pstmt.setString(2,p.getPost_Pic());
            pstmt.setInt(3,p.getCust_Id());
            pstmt.setInt(4,p.getUser_Id());
            
            pstmt.executeUpdate();
            
            f = true;
                
        }
        catch (Exception e){
            
            e.printStackTrace();
            
        }
        
        return f;
    }
    
    
    public List<Post> getAllPost()
    {
        
        List<Post> list = new ArrayList<>();
        
        try{
            
            PreparedStatement p = con.prepareStatement("Select * from Post order by Post_Id desc");
            
            ResultSet set = p.executeQuery();
            
            while(set.next())
            {
                int Post_Id = set.getInt("Post_Id");
                String Post_Content = set.getString("Post_Content");
                String Post_Pic = set.getString("Post_Pic");
                Timestamp Date = set.getTimestamp("Post_Date");
                int Cust_Id = set.getInt("Cust_Id");
                int User_Id = set.getInt("User_Id");
                
                Post post = new Post (Post_Id, Post_Content, Post_Pic, Date, Cust_Id, User_Id );
                
                list.add(post);
            }
            
            
            
        }
        catch (Exception e){
            
            e.printStackTrace();
            
        }
        
        
        return list;
    }
    
    
    public List<Post>getPostByCustId(int Cust_Id)
    {
        List<Post> list = new ArrayList<>();
        
        try{
             
            PreparedStatement p = con.prepareStatement("select * from Post where Cust_Id = ?");
            p.setInt(1, Cust_Id);
            ResultSet  set = p.executeQuery();
            
            while(set.next())
            {
                int Post_Id = set.getInt("Post_Id");
                String Post_Content = set.getString("Post_Content");
                String Post_Pic = set.getString("Post_Pic");
                Timestamp Date = set.getTimestamp("Post_Date");
                int User_Id = set.getInt("User_Id");
                
                Post post = new Post (Post_Id, Post_Content, Post_Pic, Date, Cust_Id, User_Id );
                
                list.add(post);
            }
            
        }
        catch (Exception e){
            
            e.printStackTrace();
            
        }
        
        return list;
    }
    
    public Post getPostByPostId(int Post_Id) {
        Post post = null;
        String q = "select * from Post where Post_Id=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, Post_Id);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("Post_Id");
                String pContent = set.getString("Post_Content");
                String pPic = set.getString("Post_Pic");
                Timestamp date = set.getTimestamp("Post_Date");
                int cid=set.getInt("Cust_Id");
                int userId = set.getInt("User_Id");
                post = new Post(pid, pContent, pPic, date, cid, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    
    public List<Post> getPostByUser_Id(int User_Id)
    {
        List<Post> list = new ArrayList<>();
        
        try{
            PreparedStatement p = con.prepareStatement("select * from Post where User_Id=?");
            
            p.setInt(1, User_Id);
            
            ResultSet set = p.executeQuery();
            
            while(set.next())
            {
                int Post_Id = set.getInt("Post_Id");
                String Post_Content = set.getString("Post_Content");
                String Post_Pic = set.getString("Post_Pic");
                Timestamp Date = set.getTimestamp("Post_Date");
                int cid=set.getInt("Cust_Id");
                
                Post post = new Post (Post_Id, Post_Content, Post_Pic, Date, cid, User_Id );
                
                list.add(post);
            }
            
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
        
    }
    
    
    
    
    
    
}
