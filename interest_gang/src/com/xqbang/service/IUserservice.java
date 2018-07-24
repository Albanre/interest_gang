package com.xqbang.service;

import java.util.List;
import java.util.Set;

import com.xqbang.domain.Order;
import com.xqbang.domain.User;

public interface IUserservice {

	User login(String username,String password);

	Integer register(User u);

	User checkuname(String username);

	void activeuser(String activecode);

	void resetpwd(User model);

	User findubyid(int userid);

	List<User> findall();

	void modifyinfo(int userid, User model);

	void updatepwd(int userid, String newpassword);

	User reqfindpwd(String username);

}
