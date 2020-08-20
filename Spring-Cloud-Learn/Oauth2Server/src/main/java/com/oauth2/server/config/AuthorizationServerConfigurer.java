package com.oauth2.server.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.store.JdbcTokenStore;

@Configuration
public class AuthorizationServerConfigurer extends AuthorizationServerConfigurerAdapter {

	@Autowired
	DataSource dataSource;

	@Autowired
	JdbcTokenStore jdbcTokenStore;

	@Autowired
	DefaultTokenServices defaultTokenServices;

	@Autowired
	UserDetailsServiceImpl userDetailsServiceImpl;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	/**
	 * 令牌端点与令牌服务
	 */
	@Override
	public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
		endpoints.tokenStore(jdbcTokenStore);
		endpoints.tokenServices(defaultTokenServices);
		endpoints.userDetailsService(userDetailsServiceImpl);
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
		//clients.jdbc(dataSource).passwordEncoder(passwordEncoder);
		/*使用in‐memory存储*/
		clients.inMemory()
		.withClient("c1")
		.secret(new BCryptPasswordEncoder().encode("secret"))
		.resourceIds("res1")
		/*该client允许的授权类型 authorization_code,password,refresh_token,implicit,client_credentials*/
		.authorizedGrantTypes("authorization_code","password","client_credentials","implicit","refresh_token")
		/*允许的授权范围*/
		.scopes("all")
		/*加上验证回调地址*/
		.autoApprove(false)
		.redirectUris("http://www.baidu.com");
	}

}
