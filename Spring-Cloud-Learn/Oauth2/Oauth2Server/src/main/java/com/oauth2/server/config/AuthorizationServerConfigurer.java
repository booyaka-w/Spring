package com.oauth2.server.config;

import java.util.Arrays;

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
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.code.AuthorizationCodeServices;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

@Configuration
public class AuthorizationServerConfigurer extends AuthorizationServerConfigurerAdapter {

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	AuthorizationCodeServices authorizationCodeServices;

	@Autowired
	ClientDetailsService clientDetailsService;

	@Autowired
	TokenStore tokenStore;

	@Autowired
	JwtAccessTokenConverter accessTokenConverter;

	/**
	 * 令牌访问端点与令牌服务：用来配置令牌（token）的访问端点和令牌服务(token services)。
	 */
	@Override
	public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
		/* 密码模式需要配置 */
		endpoints.authenticationManager(authenticationManager);
		/* 授权码模式需要配置 */
		endpoints.authorizationCodeServices(authorizationCodeServices);
		/* 令牌管理服务 */
		endpoints.tokenServices(tokenService());
		/* 端点允许POST方式提交 */
		endpoints.allowedTokenEndpointRequestMethods(HttpMethod.POST);
	}

	/**
	 * 安全约束：用来配置令牌端点的安全约束.
	 */
	@Override
	public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {
		security.tokenKeyAccess("permitAll()");
		security.checkTokenAccess("permitAll()");
		security.allowFormAuthenticationForClients();
	}

	/**
	 * 客户端详情： 用来配置客户端详情服务（ClientDetailsService），客户端详情信息在
	 * 这里进行初始化，你能够把客户端详情信息写死在这里或者是通过数据库来存储调取详情信息
	 */
	@Override
	public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
		/*
		 * ==================================基于内存======================================
		 */
		/* 使用in‐memory存储 */
		clients.inMemory().withClient("curl_client").secret(new BCryptPasswordEncoder().encode("secret"))
				.resourceIds("RESOURCE_A")
				/*
				 * 该client允许的授权类型
				 * authorization_code,password,refresh_token,implicit,client_credentials
				 */
				.authorizedGrantTypes("authorization_code", "password", "client_credentials", "implicit",
						"refresh_token")
				/* 允许的授权范围 */
				.scopes("all")
				/* 加上验证回调地址 */
				.autoApprove(false).redirectUris("https://www.baidu.com/");
		/*
		 * ==================================基于内存======================================
		 */
	}

	/**
	 * 令牌服务配置
	 */
	@Bean
	public AuthorizationServerTokenServices tokenService() {
		DefaultTokenServices defaultTokenServices = new DefaultTokenServices();
		/* 客户端信息服务 */
		defaultTokenServices.setClientDetailsService(clientDetailsService);
		/* 是否产生刷新令牌 */
		defaultTokenServices.setSupportRefreshToken(true);
		/* 令牌存储策略 */
		defaultTokenServices.setTokenStore(tokenStore);
		// 令牌增强
		TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
		tokenEnhancerChain.setTokenEnhancers(Arrays.asList(accessTokenConverter));
		defaultTokenServices.setTokenEnhancer(tokenEnhancerChain);
		/* 令牌默认有效期2小时 */
		defaultTokenServices.setAccessTokenValiditySeconds(7200);
		/* 刷新令牌默认有效期3天 */
		defaultTokenServices.setRefreshTokenValiditySeconds(259200);
		return defaultTokenServices;
	}
}
