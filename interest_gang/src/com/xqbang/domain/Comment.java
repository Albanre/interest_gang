package com.xqbang.domain;

import java.util.Date;

//ÆÀ¼Û
public class Comment {
	private int commentid;
	private User user;
	private Course course;
	private String cm_content;
	private int score;
	private Date cm_time;
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Date getCm_time() {
		return cm_time;
	}
	public void setCm_time(Date cm_time) {
		this.cm_time = cm_time;
	}
	
}
