package com.xqbang.service.impl;

import java.text.DecimalFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xqbang.dao.ICommentDao;
import com.xqbang.dao.IOrderDao;
import com.xqbang.domain.Comment;
import com.xqbang.service.ICommentservice;
@Service
@Transactional
public class Commentserviceimpl implements ICommentservice{
	@Resource
    private ICommentDao commentdao;
	@Resource
    private IOrderDao orderdao;
	@Override
	public void addcomment(List<Comment> list, String orderid) {
		for(Comment comment:list){
		commentdao.save(comment);
		}
		orderdao.executeUpdate("order.modifycmstate", orderid);
	}
	@Override
	public String findavgscorebycid(String courseid) {
		DecimalFormat df = new DecimalFormat("0.00");//保留两位小数点
		double avgscore=commentdao.findavgscorebycid(courseid);
		return df.format(avgscore);
	}

}
