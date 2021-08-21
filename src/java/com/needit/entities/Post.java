package com.needit.entities;

import java.sql.*;

public class Post {
    
    
    private int Post_Id;
    private String Post_Content;
    private String Post_Pic;
    private Timestamp Post_Date;
    private int Cust_Id;
    private int User_Id;

    public Post(int Post_Id, String Post_Content,  String Post_Pic, Timestamp Post_Date, int Cust_Id, int User_Id) {
        this.Post_Id = Post_Id;
        this.Post_Content = Post_Content;
        this.Post_Pic = Post_Pic;
        this.Post_Date = Post_Date;
        this.Cust_Id = Cust_Id;
        this.User_Id = User_Id;
    }

    public Post(String Post_Content,  String Post_Pic, int Cust_Id, int User_Id) {
        this.Post_Content = Post_Content;
        this.Post_Pic = Post_Pic;
        this.Cust_Id = Cust_Id;
        this.User_Id = User_Id;
    }

     

    public int getPost_Id() {
        return Post_Id;
    }

    public void setPost_Id(int Post_Id) {
        this.Post_Id = Post_Id;
    }


    public String getPost_Content() {
        return Post_Content;
    }

    public void setPost_Content(String Post_Content) {
        this.Post_Content = Post_Content;
    }


    public String getPost_Pic() {
        return Post_Pic;
    }

    public void setPost_Pic(String Post_Pic) {
        this.Post_Pic = Post_Pic;
    }

    public Timestamp getPost_Date() {
        return Post_Date;
    }

    public void setPost_Date(Timestamp Post_Date) {
        this.Post_Date = Post_Date;
    }

    public int getCust_Id() {
        return Cust_Id;
    }

    public void setCust_Id(int Cust_Id) {
        this.Cust_Id = Cust_Id;
    }

    public int getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(int User_Id) {
        this.User_Id = User_Id;
    }
    
    
    
}
