package com.needit.dao;

import com.needit.entities.User;
import static java.lang.System.out;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import static javax.script.ScriptEngine.NAME;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to insert data 
    
    public boolean saveUser(User user)
    {
        boolean f =false;
        
        try{
            
            String query = "insert into Registeration(NAME,EMAIL,PASSWORD,CONFIRMPASSWORD) values(?,?,?,?)";
            
            PreparedStatement pstmt =this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getNAME());
            pstmt.setString(2, user.getEMAIL());
            pstmt.setString(3, user.getPASSWORD());
            pstmt.setString(4, user.getCONFIRMPASSWORD());
            
            pstmt.executeUpdate();
            
            f = true;
            
            
        }
        catch (Exception e){
            
            e.printStackTrace();
            
        }
        
        return f;
        
    }
    
    //login system coding start from here .....
    
    public User getUserByEmailAndPassword(String email, String password){
        
      User user=null;  
      
      try{
           
          String query = "select * from Registeration where EMAIL=? and PASSWORD=?";
          PreparedStatement pstmt = con.prepareStatement(query);
          
          pstmt.setString(1, email);
          pstmt.setString(2, password);
          
          
          ResultSet set = pstmt.executeQuery();
         
          if(set.next())
              
          {
              user = new User();
              
              String NAME = set.getString("NAME");
              
              user.setName(NAME);
              
              user.setID(set.getInt("ID"));
              
              user.setEMAIL(set.getString("EMAIL"));
              
              user.setPassword(set.getString("PASSWORD"));
              
              user.setPROFILE(set.getString("PROFILE"));
              
              user.setABOUT(set.getString("ABOUT"));
              
              user.setDOB(set.getString("DOB"));
              
              user.setLOCATION(set.getString("LOCATION"));
              
              user.setDatetime(set.getTimestamp("REGDATE"));
              
          }
  
      }
      catch (Exception e){
            
            e.printStackTrace();
            
        }
      
        return user;
    }
    
    
    // to update the details of user 
    
    public boolean updateUser(User user)
    {
        boolean f=false;
        
        try{
            
            String query ="update Registeration set NAME=? ,PROFILE=? , ABOUT=? , DOB=? , LOCATION=? where ID=? ";
            
            PreparedStatement p = con.prepareStatement(query);
            
            p.setString(1, user.getNAME());
            p.setString(2, user.getPROFILE());
            p.setString(3, user.getABOUT());
            p.setString(4, user.getDOB());
            p.setString(5, user.getLOCATION());
            p.setInt(6, user.getID());
            
            p.executeUpdate();
            
            f = true;
            
            
        }
        catch (Exception e){
            
            e.printStackTrace();
            
        }
        
        return f;
    }
    
    public User getUserByUserId(int User_Id) {
        
        User user = null;
        
        try {
            
            String q = "select * from Registeration where ID=?";
            
            PreparedStatement ps = this.con.prepareStatement(q);
            
            ps.setInt(1, User_Id);
            
            ResultSet set = ps.executeQuery();
            
            if (set.next()) {
                
                user = new User();

//              data from db
                String NAME = set.getString("NAME");
//              set to user object
                user.setName(NAME);
                
                user.setID(set.getInt("ID"));
              
                user.setEMAIL(set.getString("EMAIL"));

                user.setPassword(set.getString("PASSWORD"));

                user.setPROFILE(set.getString("PROFILE"));

                user.setABOUT(set.getString("ABOUT"));

                user.setDOB(set.getString("DOB"));

                user.setLOCATION(set.getString("LOCATION"));

                user.setDatetime(set.getTimestamp("REGDATE"));
                
                
            }
        } catch (Exception e) 
        
        {
            e.printStackTrace();
        }

        return user;
    }
    
    
    public ArrayList<User> getAllUser()
    {
        ArrayList<User> list = new ArrayList<>();
        
        try {
            
            String q = "select * from Registeration";
            
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int ID = set.getInt("ID");
                String NAME = set.getString("NAME");
                String EMAIL = set.getString("EMAIL");
                String PROFILE = set.getString("PROFILE");
                String LOCATION = set.getString("LOCATION");
         
                User u = new User(ID, NAME, EMAIL, PROFILE, LOCATION);
                list.add(u);
            }
             
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }

        return list;
    }
    
    
   /*  public List<User> getAllUser(int ID)
    
     {
        List<User> list = new ArrayList<>();
        
        try{
            
            PreparedStatement p = con.prepareStatement("select * from Registeration where ID != ?");
            
            p.setInt(1, ID);
            
            ResultSet set = p.executeQuery();
            
            while(set.next())
                
            {
                String NAME = set.getString("NAME");
                String EMAIL = set.getString("EMAIL");
                String PROFILE = set.getString("PROFILE");
                String LOCATION = set.getString("LOCATION");
         
                User u = new User(ID,NAME, EMAIL, PROFILE, LOCATION);
                list.add(u);
            }
            
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
        
    }*/
    
    
    public User getUserByEmail(String Email){
        
      User user=null;  
      
      try{
           
          String query = "select * from Registeration where EMAIL=?";
          PreparedStatement pstmt = con.prepareStatement(query);
          
          pstmt.setString(1, Email);
          
          
          ResultSet set = pstmt.executeQuery();
         
          if(set.next())
              
          {
              
            user = new User();
              
            String NAME = set.getString("NAME");
              
            user.setName(NAME);  
              
            user.setEMAIL(set.getString("EMAIL"));
              
            user.setPassword(set.getString("PASSWORD"));
                                         
          }
  
      }
      catch (Exception e){
            
            e.printStackTrace();
            
        }
      
        return user;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
}