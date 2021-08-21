package com.needit.dao;

import static com.sun.corba.se.impl.util.Utility.printStackTrace;
import java.sql.*;


public class UserLike {
            
    Connection con;

    public UserLike(Connection con) {
        this.con = con;
    }
    
    public boolean putLike (int Post_Id, int User_Id )
    {
        boolean f = false;
        
        try {
            
            String q = "insert into User_Like(Post_Id,User_Id) values(?,?)";
            PreparedStatement ps = this.con.prepareStatement(q);
            
            // set values
            
            ps.setInt(1, Post_Id);
            ps.setInt(2, User_Id);
            
            ps.executeUpdate();
            
            f=true;
            
   
        } catch (Exception e)
        {
            printStackTrace();
        }
         
        return f;
    }
    
    
    public int countLikesOnPost (int Post_Id)
    {
        int count = 0;
        
        String q = "select count(*) from User_Like where Post_Id = ?";
        
        try {
            
            PreparedStatement ps = this.con.prepareStatement(q);
            
            ps.setInt(1, Post_Id);
            
            ResultSet set = ps.executeQuery();
            
            if(set.next())
            {
                count = set.getInt(("count(*)"));
            }
         
            
        } catch (Exception e) 
        {
            printStackTrace();
        }

        return count;
    }
    
    
    public boolean isLikedByUser (int Post_Id, int User_Id)
    {
        boolean f = false;
        
        try {
            
            PreparedStatement ps = this.con.prepareStatement("select * from User_Like where Post_Id=? and User_Id=?");
            
            ps.setInt(1, Post_Id);
            ps.setInt(2, User_Id);
            
            ResultSet set = ps.executeQuery();
            
            if(set.next())
            {
                f=true;
            }
              
        } catch (Exception e) 
        {
            printStackTrace();
        }
   
        return f;
    }
    
    
    public boolean deleteLike (int Post_Id, int User_Id)
    {
        boolean f = false;
        
        try {
            
            PreparedStatement ps = this.con.prepareStatement("delete from User_Like where Post_Id = ? and User_Id=?");
            
            ps.setInt(1, Post_Id);
            ps.setInt(2, User_Id);
            
            ps.executeQuery();
            
            f = true;
            
            
        } catch (Exception e) 
        {
            printStackTrace();
        }
        
        return f;
    }
    
}
