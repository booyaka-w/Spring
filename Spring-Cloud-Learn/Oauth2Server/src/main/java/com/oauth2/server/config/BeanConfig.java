package com.oauth2.server.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationManager;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;
import org.springframework.security.oauth2.provider.code.AuthorizationCodeServices;
import org.springframework.security.oauth2.provider.code.JdbcAuthorizationCodeServices;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.store.JdbcTokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

@Configuration
public class BeanConfig {

	@Autowired
	DataSource dataSource;

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
		defaultTokenServices.setSupportRefreshToken(false);
		defaultTokenServices.setClientDetailsService(getJdbcClientDetailsService());
		defaultTokenServices.setTokenEnhancer(new JwtAccessTokenConverter());
		defaultTokenServices.setAccessTokenValiditySeconds(3600);
		return defaultTokenServices;
	}

	@Bean
	public JdbcClientDetailsService getJdbcClientDetailsService() {
		JdbcClientDetailsService jdbcClientDetailsService = new JdbcClientDetailsService(dataSource);
		return jdbcClientDetailsService;
	}

}
