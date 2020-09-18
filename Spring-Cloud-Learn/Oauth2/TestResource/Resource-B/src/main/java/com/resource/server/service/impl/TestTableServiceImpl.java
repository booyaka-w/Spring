package com.resource.server.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.resource.server.dao.TestTableDao;
import com.resource.server.model.TestTable;
import com.resource.server.service.TestTableService;

@Service
public class TestTableServiceImpl implements TestTableService {

	@Autowired
	TestTableDao testTableDao;

	@Override
	public int insert(TestTable table) throws Exception {
		return testTableDao.insert(table);
	}

	@Override
	public int update(TestTable table) throws Exception {
		return testTableDao.update(table);
	}

	@Override
	public TestTable query(int pk) {
		return testTableDao.query(pk);
	}

}
