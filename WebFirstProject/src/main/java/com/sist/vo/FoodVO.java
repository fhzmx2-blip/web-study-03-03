package com.sist.vo;
/*
 *  NO      NOT NULL NUMBER         
	NAME             VARCHAR2(100)  
	TYPE             VARCHAR2(100)  
	PHONE            VARCHAR2(30)   
	ADDRESS          VARCHAR2(260)  
	SCORE            NUMBER(2,1)    
	PARKING          VARCHAR2(200)  
	POSTER           VARCHAR2(260)  
	TIME             VARCHAR2(50)   
	CONTENT          CLOB           
	THEME            VARCHAR2(4000) 
	PRICE            VARCHAR2(100) 
 */
public class FoodVO {
   private int no;
   private String name,type,phone,address,parking,poster,time,
           content,theme,price;
   private double score;
   
   public int getNo() {
	return no;
   }
   public void setNo(int no) {
	this.no = no;
   }
   public String getName() {
	return name;
   }
   public void setName(String name) {
	this.name = name;
   }
   public String getType() {
	return type;
   }
   public void setType(String type) {
	this.type = type;
   }
   public String getPhone() {
	return phone;
   }
   public void setPhone(String phone) {
	this.phone = phone;
   }
   public String getAddress() {
	return address;
   }
   public void setAddress(String address) {
	this.address = address;
   }
   public String getParking() {
	return parking;
   }
   public void setParking(String parking) {
	this.parking = parking;
   }
   public String getPoster() {
	return poster;
   }
   public void setPoster(String poster) {
	this.poster = poster;
   }
   public String getTime() {
	return time;
   }
   public void setTime(String time) {
	this.time = time;
   }
   public String getContent() {
	return content;
   }
   public void setContent(String content) {
	this.content = content;
   }
   public String getTheme() {
	return theme;
   }
   public void setTheme(String theme) {
	this.theme = theme;
   }
   public String getPrice() {
	return price;
   }
   public void setPrice(String price) {
	this.price = price;
   }
   public double getScore() {
	return score;
   }
   public void setScore(double score) {
	this.score = score;
   }
   
   
}