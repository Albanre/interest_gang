package com.xqbang.service;

import java.util.List;

import com.xqbang.domain.Merchant;

public interface IMerchantservice {

	
	void check(int state1, int merchantid);

	Merchant findmerchantbyuname(String username);

	Merchant findmerchantbyid(int merchantid);

	List<Merchant> findall();

	void register(Merchant model);

	Merchant login(String username, String password);

	Merchant updateshopinfo(Merchant t);

}
