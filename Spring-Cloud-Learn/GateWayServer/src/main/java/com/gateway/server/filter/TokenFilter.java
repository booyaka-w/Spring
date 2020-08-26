package com.gateway.server.filter;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.util.MultiValueMap;
import org.springframework.web.server.ServerWebExchange;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public class TokenFilter implements GlobalFilter,Ordered{

	Logger logger= LoggerFactory.getLogger(TokenFilter.class);
	
	
	@Override
	public int getOrder() {
		return 0;
	}
	
	@Override
	public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
		logger.info("TokenFilter开始............");
		
		getRequestParamters(exchange.getRequest());
		getRequestHeaders(exchange.getRequest());
		
		//拦截的逻辑。根据具体业务逻辑做拦截。
		String token = exchange.getRequest().getQueryParams().getFirst("token");
		if (token == null || token.isEmpty()) {
			logger.info("token is empty...");
//			exchange.getResponse().setStatusCode(HttpStatus.UNAUTHORIZED);
//			return exchange.getResponse().setComplete();
			
			//设置status和body
	        return Mono.defer(() -> {
	            exchange.getResponse().setStatusCode(HttpStatus.UNAUTHORIZED);//设置status
	            final ServerHttpResponse response = exchange.getResponse();
	            byte[] bytes = "{\"code\":\"99999\",\"message\":\"非法访问,没有检测到token~~~~~~\"}".getBytes(StandardCharsets.UTF_8);
	            DataBuffer buffer = exchange.getResponse().bufferFactory().wrap(bytes);
	            response.getHeaders().set("aaa", "bbb");//设置header
	            logger.info("TokenFilter拦截非法请求，没有检测到token............");
	            return response.writeWith(Flux.just(buffer));//设置body
	        });
		}
		
		//没有被if条件拦截，就放行
		return chain.filter(exchange);
	}
	
	
	private Map<String,Object> getRequestParamters(ServerHttpRequest request) {
		logger.info("getRequestParamters开始............");
		Map<String,Object> map = new HashMap<>();
		MultiValueMap<String, String> paramNames = request.getQueryParams();
		Iterator<String> it= paramNames.keySet().iterator();
		while (it.hasNext()) {
			String paramName = (String) it.next();
			List<String> paramValues = paramNames.get(paramName);
			if (paramValues.size() >= 1) {
				String paramValue = paramValues.get(0);
				logger.info("request参数："+paramName+",值："+paramValue);
				map.put(paramName, paramValue);
			}
		}
		return map;
	}
	
	private Map<String,Object> getRequestHeaders(ServerHttpRequest request) {
		logger.info("getRequestHeaders开始............");
		Map<String,Object> map = new HashMap<>();
		HttpHeaders hearders = request.getHeaders();
		Iterator<String> it= hearders.keySet().iterator();
		while (it.hasNext()) {
			String keyName = (String) it.next();
			List<String> headValues = hearders.get(keyName);
			if (headValues.size() >= 1) {
				String kvalue = headValues.get(0);
				logger.info("request header的key："+keyName+",值："+kvalue);
				map.put(keyName, kvalue);
			}
		}
		return map;
	}


}
