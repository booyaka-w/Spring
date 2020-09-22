package com.resource.server.service;

import com.resource.server.model.TestTable;

public interface TestTableService {

	int insert(TestTable table) throws Exception;

	int update(TestTable table) throws Exception;

	int updateWithVersion(TestTable table) throws Exception;

	TestTable query(int pk);

}
