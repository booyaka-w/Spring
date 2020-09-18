package com.resource.server.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.resource.server.model.TestTable;
import com.resource.server.service.TestTableService;

@RestController
public class ResourceController {

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
		synchronized (this) {
			TestTable table = testTableService.query(1);
			if (table.getNumber() > 0) {
				table.setNumber(table.getNumber() - 1);
				table.setPort(port + "");
				int res = testTableService.update(table);
				if (res == 1) {
					testTableService.insert(table);
				}
			}
		}
		return "port = " + port;
	}
}
