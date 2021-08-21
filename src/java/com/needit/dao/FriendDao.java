package com.needit.dao;

import com.needit.entities.AcceptFriendList;
import com.needit.entities.FriendList;
import static com.sun.corba.se.impl.util.Utility.printStackTrace;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class FriendDao {
 
    Connection con;
    
    public FriendDao(Connection con){
        this.con = con;
    }
    
    public boolean sendRequest (int User_Id, int CU_Id )
    {
        boolean f = false;
        
        try {
            
            String q = "insert into Friend_List (User_Id,CU_Id) values(?,?)";
            PreparedStatement ps = this.con.prepareStatement(q);
            
            // set values
            
            ps.setInt(1, User_Id);
            ps.setInt(2, CU_Id);
            
            ps.executeUpdate();
            
            f=true;
            
        } 
        catch (Exception e) 
        {
            printStackTrace();
        }
        
        return f;
    }
    
    
    public List<FriendList> getFriendList(int User_Id)
    {
        List<FriendList> list = new ArrayList<>();
        
        try{
            PreparedStatement p = con.prepareStatement("select * from Friend_List where User_Id=?");
            
            p.setInt(1, User_Id);
            
            ResultSet set = p.executeQuery();
            
            while(set.next())
            {
                int F_Id = set.getInt("F_Id");
                int CU_Id = set.getInt("CU_Id");
                
               FriendList friend = new FriendList(F_Id, CU_Id);
               
               list.add(friend);
            }
            
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
        
    }
    
    
  /*  public FriendList getFriendList(int CU_Id) {
            
        FriendList friend = null;
        String q = "select * from Friend_List where CU_Id=?";
       
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, CU_Id);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int F_Id = set.getInt("F_Id");
                int User_Id = set.getInt("User_Id");
                
                friend = new FriendList(F_Id, User_Id);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return friend;
    }*/
    
    
    public boolean acceptRequest (int User_Id, int ACU_Id )
    {
        boolean f = false;
        
        try {
            
            String q = "insert into AcceptFriend (User_Id,ACU_Id) values(?,?)";
            PreparedStatement ps = this.con.prepareStatement(q);
            
            // set values
            
            ps.setInt(1, User_Id);
            ps.setInt(2, ACU_Id);
            
            ps.executeUpdate();
            
            f=true;
            
        } 
        catch (Exception e) 
        {
            printStackTrace();
        }
        
        return f;
    }
    
    public boolean deleteRequest (int F_Id)
    {
        boolean S = false;
        
        try {
            
            PreparedStatement ps = this.con.prepareStatement("delete from Friend_List where F_Id = ?");
            
            ps.setInt(1, F_Id);
            
            ps.executeQuery();
            
            S = true;
            
            
        } catch (Exception e) 
        {
           printStackTrace();
        }
        
        return S;
    }
    
    
    
    public List<AcceptFriendList> getAcceptFriendList(int User_Id)
    {
        List<AcceptFriendList> list = new ArrayList<>();
        
        try{
            PreparedStatement p = con.prepareStatement(" select * from AcceptFriend where User_Id = ? ");
            
            p.setInt(1, User_Id);
            
            ResultSet set = p.executeQuery();
            
            while(set.next())
            {
                int AF_Id = set.getInt("AF_Id");
                int ACU_Id = set.getInt("ACU_Id");
                
               AcceptFriendList acceptfriend = new AcceptFriendList(AF_Id, ACU_Id);
               
               list.add(acceptfriend);
            }
            
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
        
    }
    
       
  
}
