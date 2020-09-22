package com.resource.server.controller;

import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.resource.server.model.TestTable;
import com.resource.server.service.TestTableService;

@RestController
public class ResourceController {

	@Autowired
	RedissonClient redisson;

	@Autowired
	TestTableService testTableService;

	@RequestMapping("/resb")
	public String getResource() {
		return "resource-b-res:9002";
	}

	@RequestMapping("/query/{pk}")
	public String queryTable(HttpServletRequest request, @PathVariable int pk) {
		int port = request.getServerPort();
		TestTable table = testTableService.query(pk);
		return table.toString() + "		port = " + port;
	}

	@RequestMapping("/update")
	public String updateTable(HttpServletRequest request) throws Exception {
		int port = request.getServerPort();
		int pk = 1;
		System.err.println(redisson);
		RLock rlock = redisson.getLock("lock" + pk);
		boolean state = rlock.tryLock(300, 300, TimeUnit.SECONDS);
		TestTable table = testTableService.query(pk);
		try {
			if (state) {
				if (table.getNumber() > 0) {
					table.setNumber(table.getNumber() - 1);
					table.setPort(port + "");
					int res = testTableService.update(table);
					if (res == 1) {
						testTableService.insert(table);
					}
				}
			}
		} catch (Exception e) {
		} finally {
			rlock.unlock();
		}
		return "port = " + port;
	}

	@RequestMapping("/update1")
	public String updateTable1(HttpServletRequest request) throws Exception {
		int port = request.getServerPort();
		TestTable table = testTableService.query(1);
		try {
			if (table.getNumber() > 0) {
				table.setNumber(table.getNumber() - 1);
				table.setPort(port + "");
				int res = testTableService.updateWithVersion(table);
				if (res == 1) {
					testTableService.insert(table);
				}
			}
		} catch (Exception e) {
		} finally {
		}
		return "port = " + port;
	}
}
