package com.needit.helper;

import java.sql.*;

public class ConnectionStarter {
    
    private static Connection con;
    
    public static Connection getConnection()
            
    {
        try{
            
            if(con==null)
                
            {
                Class.forName("com.mysql.jdbc.Driver");
                
                con = DriverManager.getConnection("jdbc:mysql://localhost/NEEDIT","root","");
                
                
            }
            
        }catch (Exception e){
            
            e.printStackTrace();
            
        } 
        
        return con;
    }
    
}
