package com.xqbang.dao;

import com.xqbang.dao.base.IBaseDao;
import com.xqbang.domain.Merchant;

public interface IMerchantDao extends IBaseDao<Merchant>{

	Merchant findmerchantbyuname(String username);

	Merchant findmbynameandpwd(String username, String password);

}
