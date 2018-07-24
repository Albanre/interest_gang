package com.xqbang.dao;

import com.xqbang.dao.base.IBaseDao;
import com.xqbang.domain.Comment;

public interface ICommentDao extends IBaseDao<Comment>{

	double findavgscorebycid(String courseid);

}
