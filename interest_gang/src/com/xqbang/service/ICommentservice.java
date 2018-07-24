package com.xqbang.service;

import java.util.List;

import com.xqbang.domain.Comment;

public interface ICommentservice {

	void addcomment(List<Comment> list, String orderid);
    String findavgscorebycid(String courseid);
}
