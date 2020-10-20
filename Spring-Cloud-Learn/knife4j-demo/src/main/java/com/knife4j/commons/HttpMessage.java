package com.knife4j.commons;

import java.io.InputStream;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpInputMessage;

public class HttpMessage implements HttpInputMessage {

	private InputStream body;

	private HttpHeaders httpHeaders;

	public HttpMessage(InputStream body, HttpHeaders httpHeaders) {
		this.body = body;
		this.httpHeaders = httpHeaders;
	}

	@Override
	public InputStream getBody() {
		return this.body;
	}

	@Override
	public HttpHeaders getHeaders() {
		return this.httpHeaders;
	}
}
