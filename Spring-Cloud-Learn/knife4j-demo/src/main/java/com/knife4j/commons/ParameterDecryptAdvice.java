package com.knife4j.commons;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.nio.charset.Charset;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.RequestBodyAdviceAdapter;

import io.swagger.annotations.ApiOperation;

@RestControllerAdvice(basePackages = "com.knife4j.controller")
public class ParameterDecryptAdvice extends RequestBodyAdviceAdapter {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public boolean supports(MethodParameter methodParameter, Type targetType,
			Class<? extends HttpMessageConverter<?>> converterType) {
		return targetType.equals(String.class);
	}

	@Override
	public HttpInputMessage beforeBodyRead(HttpInputMessage inputMessage, MethodParameter parameter, Type targetType,
			Class<? extends HttpMessageConverter<?>> converterType) throws IOException {
		logger.info("--->" + parameter.getMethod().getAnnotation(ApiOperation.class).value() + "执行...");
		String httpBody = decryptBody(inputMessage);
		logger.info("--->" + parameter.getMethod().getAnnotation(ApiOperation.class).value() + "参数解密：" + httpBody);
		return new HttpMessage(new ByteArrayInputStream(httpBody.getBytes()), inputMessage.getHeaders());
	}

	/**
	 * 解密消息体
	 * 
	 * @param inputMessage 消息体
	 * @return 明文
	 * @throws IOException
	 * @throws Exception
	 */
	private String decryptBody(HttpInputMessage inputMessage) throws IOException {
		InputStream encryptStream = inputMessage.getBody();
		String encryptBody = StreamUtils.copyToString(encryptStream, Charset.defaultCharset());
		return DESUtil.decode("sysongys", encryptBody.split("=")[1]);
	}
}
