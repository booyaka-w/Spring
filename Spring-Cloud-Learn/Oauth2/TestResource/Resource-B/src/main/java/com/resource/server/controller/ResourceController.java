package com.resource.server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ResourceController {

	@RequestMapping("/resb")
	public String getResource() {
		return "resource-b-res:9002";
	}
}
