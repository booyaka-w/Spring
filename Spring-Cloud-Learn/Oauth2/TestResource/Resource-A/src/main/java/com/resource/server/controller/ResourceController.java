package com.resource.server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ResourceController {

	@RequestMapping("/resa")
	public String getResource() {
		return "resource-a-res:9001";
	}
}
