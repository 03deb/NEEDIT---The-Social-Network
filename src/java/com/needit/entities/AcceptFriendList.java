package com.needit.entities;

public class AcceptFriendList {
    
    private int AF_Id;
    private int User_Id;
    private int ACU_Id;

    public AcceptFriendList(int AF_Id, int User_Id, int ACU_Id) {
        this.AF_Id = AF_Id;
        this.User_Id = User_Id;
        this.ACU_Id = ACU_Id;
    }

    public AcceptFriendList(int AF_Id, int User_Id) {
        this.AF_Id = AF_Id;
        this.User_Id = User_Id;
    }

    public int getAF_Id() {
        return AF_Id;
    }

    public void setAF_Id(int AF_Id) {
        this.AF_Id = AF_Id;
    }

    public int getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(int User_Id) {
        this.User_Id = User_Id;
    }

    public int getACU_Id() {
        return ACU_Id;
    }

    public void setACU_Id(int ACU_Id) {
        this.ACU_Id = ACU_Id;
    }
    
    
    
    
    
}
