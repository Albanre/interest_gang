package com.xqbang.dao;

import com.xqbang.dao.base.IBaseDao;
import com.xqbang.domain.User;

public interface IUserDao extends IBaseDao<User>{

	User finduserbynameandpwd(String username, String password);

	Integer adduser(User u);

	User finduserbyuname(String username);

	User findbyactivecode(String activecode);

}
