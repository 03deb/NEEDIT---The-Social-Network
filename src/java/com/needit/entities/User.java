package com.needit.entities;

import java.sql.*;

public class User {

    private int ID;
    private String NAME;
    private String EMAIL;
    private String PASSWORD;
    private String CONFIRMPASSWORD;
    private Timestamp datetime;
    private String PROFILE;
    private String ABOUT;
    private String LOCATION;
    private String DOB;

    public User(int ID, String NAME, String EMAIL, String PASSWORD, String CONFIRMPASSWORD, Timestamp datetime) {
        this.ID = ID;
        this.NAME = NAME;
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
        this.CONFIRMPASSWORD = CONFIRMPASSWORD;
        this.datetime = datetime;
    }

    public User() {
    }

    public User(String NAME, String EMAIL, String PASSWORD, String CONFIRMPASSWORD) {
        this.NAME = NAME;
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
        this.CONFIRMPASSWORD = CONFIRMPASSWORD;
    }
    
    public User(int ID, String NAME, String EMAIL, String PROFILE, String LOCATION){
        this.ID = ID;
        this.NAME = NAME;
        this.EMAIL = EMAIL;
        this.PROFILE = PROFILE;
        this.LOCATION = LOCATION;
    }

    public User(String EMAIL, String PASSWORD) {
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
    }
    
    
    
  //  getters and setters
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String PASSWORD) {
        this.PASSWORD = PASSWORD;
    }

    public String getCONFIRMPASSWORD() {
        return CONFIRMPASSWORD;
    }

    public void setCONFIRMPASSWORD(String CONFIRMPASSWORD) {
        this.CONFIRMPASSWORD = CONFIRMPASSWORD;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public void setEmail(String string) {
        this.EMAIL=EMAIL;
    }

    public void setPassword(String string) {
        this.CONFIRMPASSWORD = CONFIRMPASSWORD;
    }

    public void setName(String NAME) {
         this.NAME = NAME;
    }

    public void setDate(String string) {
        this.datetime = datetime;
    }

    public String getPROFILE() {
        return PROFILE;
    }

    public void setPROFILE(String PROFILE) {
        this.PROFILE = PROFILE;
    }

    public String getABOUT() {
        return ABOUT;
    }

    public void setABOUT(String ABOUT) {
        this.ABOUT = ABOUT;
    }

    public String getLOCATION() {
        return LOCATION;
    }

    public void setLOCATION(String LOCATION) {
        this.LOCATION = LOCATION;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    

    public void getDatetime(Timestamp timestamp) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
