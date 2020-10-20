package com.knife4j.commons;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@RestControllerAdvice(basePackages = "com.sysongy.cloud.station.api.controller")
public class ParameterEncryptionAdvice<T> implements ResponseBodyAdvice<T> {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
		return (returnType.hasMethodAnnotation(ApiImplicitParam.class)
				|| returnType.hasMethodAnnotation(ApiImplicitParams.class));
	}

	@SuppressWarnings("unchecked")
	@Override
	public T beforeBodyWrite(T body, MethodParameter returnType, MediaType selectedContentType,
			Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request,
			ServerHttpResponse response) {

		logger.info("--->" + returnType.getExecutable().getAnnotation(ApiOperation.class).value() + "返回结果："
				+ body.toString());
		body = (T) DESUtil.encode("sysongys", body.toString());
		logger.info("--->结果加密：" + body.toString());
		return body;
	}
}
