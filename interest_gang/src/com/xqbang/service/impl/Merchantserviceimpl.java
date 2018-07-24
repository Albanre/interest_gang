package com.xqbang.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xqbang.dao.IMerchantDao;
import com.xqbang.domain.Merchant;
import com.xqbang.service.IMerchantservice;
@Service
@Transactional
public class Merchantserviceimpl implements IMerchantservice{
	@Resource
    private IMerchantDao merchantdao;
	@Override
	public void check(int state1, int merchantid) {
		merchantdao.executeUpdate("merchant.modifystate", state1,merchantid);
	}
	@Override
	public Merchant findmerchantbyuname(String username) {
		return merchantdao.findmerchantbyuname(username);
	}
	@Override
	public Merchant findmerchantbyid(int merchantid) {
		return merchantdao.findById(merchantid);
	}
	@Override
	public List<Merchant> findall() {
		return merchantdao.findAll();
	}
	@Override
	public void register(Merchant model) {
		merchantdao.save(model);
	}
	@Override
	public Merchant login(String username, String password) {
		return merchantdao.findmbynameandpwd(username,password);
		
	}
	@Override
	public Merchant updateshopinfo(Merchant t) {
		Merchant dbmerchant=merchantdao.findById(t.getMerchantid());
		dbmerchant.setCourses(dbmerchant.getCourses());
		dbmerchant.setO_name(t.getO_name());
		dbmerchant.setIntroduction(t.getIntroduction());
		dbmerchant.setCreatetime(t.getCreatetime());
		dbmerchant.setAddress(t.getAddress());
		dbmerchant.setCity(t.getCity());
		dbmerchant.setTelephone(t.getTelephone());
		dbmerchant.setEmail(t.getEmail());
		return dbmerchant;
	}

}
