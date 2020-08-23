package com.resource.server.controlller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ResourceController {
	
	@GetMapping("/res1")
	public String getResource() {
		return "res1";
	}

}
