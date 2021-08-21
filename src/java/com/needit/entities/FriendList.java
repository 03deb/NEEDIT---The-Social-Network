package com.needit.entities;

public class FriendList {
    
    private int F_Id;
    private int User_Id;
    private int CU_Id;
    

    
    public FriendList(int F_Id, int User_Id, int CU_Id) {
        this.F_Id = F_Id;
        this.User_Id = User_Id;
        this.CU_Id = CU_Id;
    }
    
    public FriendList(int F_Id, int User_Id){
        this.F_Id = F_Id;
        this.User_Id = User_Id;
    }
    

    public int getF_Id() {
        return F_Id;
    }

    public void setF_Id(int F_Id) {
        this.F_Id = F_Id;
    }

    public int getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(int User_Id) {
        this.User_Id = User_Id;
    }

    public int getCU_Id() {
        return CU_Id;
    }

    public void setCU_Id(int CU_Id) {
        this.CU_Id = CU_Id;
    }
    
    
    
    
}
