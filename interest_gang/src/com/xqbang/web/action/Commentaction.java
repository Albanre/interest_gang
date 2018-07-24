package com.xqbang.web.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.xqbang.domain.Comment;
import com.xqbang.domain.Course;
import com.xqbang.domain.Order;
import com.xqbang.domain.User;
@Controller
@Scope("prototype")
public class Commentaction extends Baseaction<Comment>{
	/*----------------保存评价------------------*/
	private String cm_orderid;
	private String[] cm_courseid;
	//private String[] cm_content; struts2无法获取文本域值
	private int[] cm_score;
public String savecomment(){
	List<Comment> list=new ArrayList<Comment>();
	String[] cm_content=getRequest().getParameterValues("cm_content");//获取文本域的评价内容数组
	for(int i=0;i<cm_score.length;i++){//将评价内容和分数，兴趣班对象，用户对象装入评价对象，再将评价对象装入集合
		Comment cm=new Comment();
		cm.setUser((User)getRequest().getSession().getAttribute("loginuser"));
		Course course=new Course();
		course.setCourseid(cm_courseid[i]);
		cm.setCourse(course);
		cm.setCm_content(cm_content[i]);
		cm.setScore(cm_score[i]);
		list.add(cm);
		System.out.println(cm_content[i]);
	}
	
	//调用业务逻辑
	commentservice.addcomment(list,cm_orderid);
	return "commentsuccess";
}
public String getCm_orderid() {
	return cm_orderid;
}
public String[] getCm_courseid() {
	return cm_courseid;
}
public int[] getCm_score() {
	return cm_score;
}
public void setCm_orderid(String cm_orderid) {
	this.cm_orderid = cm_orderid;
}
public void setCm_courseid(String[] cm_courseid) {
	this.cm_courseid = cm_courseid;
}
public void setCm_score(int[] cm_score) {
	this.cm_score = cm_score;
}


}

