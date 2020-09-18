package com.resource.server.dao;

import org.apache.ibatis.annotations.Mapper;

import com.resource.server.model.TestTable;

@Mapper
public interface TestTableDao {

	int insert(TestTable table) throws Exception;

	int update(TestTable table) throws Exception;

	TestTable query(int pk);

}
