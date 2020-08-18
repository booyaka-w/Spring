package com.oauth2.server.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationManager;
import org.springframework.security.oauth2.provider.code.AuthorizationCodeServices;
import org.springframework.security.oauth2.provider.code.JdbcAuthorizationCodeServices;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.store.JdbcTokenStore;

@Configuration
public class AuthorizationServerConfigurer extends AuthorizationServerConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;

	/**
	 * 令牌端点与令牌服务
	 */
	@Override
	public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
		endpoints.tokenStore(getJdbcTokenStore());
		endpoints.authorizationCodeServices(getAuthorizationCodeServices());
		endpoints.authenticationManager(getAuthenticationManager());
		endpoints.allowedTokenEndpointRequestMethods(HttpMethod.POST);
	}

	/**
	 * 安全约束
	 */
	@Override
	public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {
		security.tokenKeyAccess("permitAll()").checkTokenAccess("permitAll()").allowFormAuthenticationForClients();
	}

	/**
	 * 客户端详情
	 */
	@Override
	public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
		clients.jdbc(dataSource).passwordEncoder(new BCryptPasswordEncoder());
	}

	@Bean
	public JdbcTokenStore getJdbcTokenStore() {
		JdbcTokenStore tokenStore = new JdbcTokenStore(dataSource);
		return tokenStore;
	}
	
	@Bean
	public AuthorizationCodeServices getAuthorizationCodeServices() {
		AuthorizationCodeServices authorizationCodeServices = new JdbcAuthorizationCodeServices(dataSource);
		return authorizationCodeServices;
	}
	
	@Bean
	public AuthenticationManager getAuthenticationManager() {
		OAuth2AuthenticationManager authenticationManager = new OAuth2AuthenticationManager();
		authenticationManager.setTokenServices(getDefaultTokenServices());
		return authenticationManager;
	}
	
	@Bean
	public DefaultTokenServices getDefaultTokenServices() {
		DefaultTokenServices defaultTokenServices = new DefaultTokenServices();
		defaultTokenServices.setTokenStore(getJdbcTokenStore());
		return defaultTokenServices;
	}
}
