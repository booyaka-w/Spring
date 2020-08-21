package com.oauth2.server.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.code.AuthorizationCodeServices;
import org.springframework.security.oauth2.provider.code.InMemoryAuthorizationCodeServices;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.InMemoryTokenStore;

@Configuration
public class BeanConfig {

	@Autowired
	ClientDetailsService clientDetailsService;
	
	/*==================================基于内存======================================*/
	
	/**
	 * 
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return passwordEncoder;
	}
	
	/**
	 * token令牌存储策略
	 */
	@Bean
	public TokenStore tokenStore() {
		TokenStore tokenStore = new InMemoryTokenStore();
		return tokenStore;
	}
	
	/**
	 *设置授权码模式 授权码存储方式 
	 */
	@Bean
	public AuthorizationCodeServices authorizationCodeServices() {
		AuthorizationCodeServices authorizationCodeServices = new InMemoryAuthorizationCodeServices();
		return authorizationCodeServices;
	}
	
	/**
	 * 令牌服务配置
	 */
	public AuthorizationServerTokenServices tokenService(){
		DefaultTokenServices defaultTokenServices=new DefaultTokenServices();
		/*客户端信息服务*/
		defaultTokenServices.setClientDetailsService(clientDetailsService);
		/*是否产生刷新令牌*/
		defaultTokenServices.setSupportRefreshToken(true);
		/*令牌存储策略*/
		defaultTokenServices.setTokenStore(tokenStore());
		/*令牌默认有效期2小时*/
		defaultTokenServices.setAccessTokenValiditySeconds(7200);
		/*刷新令牌默认有效期3天*/
		defaultTokenServices.setRefreshTokenValiditySeconds(259200);
		return defaultTokenServices;
	}
	
	/*==================================基于内存======================================*/
	
}
