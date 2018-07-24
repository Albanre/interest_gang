package com.xqbang.utils;

import java.util.List;

public class PageBean<T> {
	private int pagesize;
	private int currentpage;
	private int totalrecord;
	//¼ÆËãÏî
	private int startindex;
	private int totalpage;
	private List<T> coursedata;
	public PageBean(int pagesize, int currentpage, int totalrecord) {
		super();
		this.pagesize = pagesize;
		this.currentpage = currentpage;
		this.totalrecord = totalrecord;
		this.startindex=(this.currentpage-1)*pagesize;
		this.totalpage=(int) Math.ceil(totalrecord*1.0/pagesize);
	}
	public int getPagesize() {
		return pagesize;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public int getTotalrecord() {
		return totalrecord;
	}
	public int getStartindex() {
		return startindex;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public List<T> getCoursedata() {
		return coursedata;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public void setTotalrecord(int totalrecord) {
		this.totalrecord = totalrecord;
	}
	public void setStartindex(int startindex) {
		this.startindex = startindex;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public void setCoursedata(List<T> coursedata) {
		this.coursedata = coursedata;
	}
}
