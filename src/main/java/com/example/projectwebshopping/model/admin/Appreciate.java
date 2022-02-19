package com.example.projectwebshopping.model.admin;


import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Appreciate {
    private String id;
    private String userImg;
    private String userName;
    private String comment;
    private Date commentDate;
    private int status;
    private String job;
public Appreciate(){

}
    public Appreciate(String id, String userImg, String userName, String comment, Date commentDate,int status,String job) {
        this.id = id;
        this.userImg = userImg;
        this.userName = userName;
        this.comment = comment;
        this.commentDate = commentDate;
        this.status=status;
        this.job=job;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void addAttibute(ResultSet resultSet) throws SQLException {
    this.id=resultSet.getString("IDNhanXet");
    this.userImg=resultSet.getString("IMGUSER");
    this.userName=resultSet.getString("HoTen");
    this.comment=resultSet.getString("NHANXET");
    this.commentDate=resultSet.getDate("NGAY");
    this.status=resultSet.getInt("STATUS");
    this.job=resultSet.getString("JOB");

    }
}
