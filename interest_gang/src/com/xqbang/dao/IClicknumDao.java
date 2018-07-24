package com.xqbang.dao;

import com.xqbang.dao.base.IBaseDao;
import com.xqbang.domain.Clicknum;

public interface IClicknumDao extends IBaseDao<Clicknum>{

	Clicknum findbyuidandcid(String courseid, int userid);

}
