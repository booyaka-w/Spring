package com.resource.server.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenStore;

@Configuration
public class ResourceServerConﬁgurer extends ResourceServerConfigurerAdapter {

	public static final String RESOURCE_ID = "RESOURCE_A";

	@Autowired
	TokenStore tokenStore;

	/* 资源服务配置信息 */
	@Override
	public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
		/* 资源ID */
		resources.resourceId(RESOURCE_ID);
		/* 验证令牌的服务 */
		resources.tokenStore(tokenStore);
		resources.stateless(true);
	}

	/* 安全能访问策略 */
	@Override
	public void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/**").access("#oauth2.hasScope('all')").and().csrf().disable()
				.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
	}

}
