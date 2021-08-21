package com.needit.entities;

public class Category {
    
    private int Cat_id;
    private String Cat_Name;

    public Category(int Cat_id, String Cat_Name) {
        this.Cat_id = Cat_id;
        this.Cat_Name = Cat_Name;
    }

    public Category() {
    }

    public Category(String Cat_Name) {
        this.Cat_Name = Cat_Name;
    }


    public int getCat_id() {
        return Cat_id;
    }

    public void setCat_id(int Cat_id) {
        this.Cat_id = Cat_id;
    }

    public String getCat_Name() {
        return Cat_Name;
    }

    public void setCat_Name(String Cat_Name) {
        this.Cat_Name = Cat_Name;
    }
    
}
