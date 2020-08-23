package com.resource.server.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.RemoteTokenServices;
import org.springframework.security.oauth2.provider.token.ResourceServerTokenServices;

@Configuration
public class ResourceServerConﬁgurer extends ResourceServerConfigurerAdapter{
	
	public static final String RESOURCE_ID="";
	
	/*资源服务配置信息*/
	@Override
	public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
		/*资源ID*/
		resources.resourceId(RESOURCE_ID);
		/*验证令牌的服务*/
		resources.tokenServices(tokenService());
		resources.stateless(true); 
	}

	/*安全能访问策略*/
	@Override
	public void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/**").access("#oauth2.hasScope('all')")
		.and().csrf().disable()
		.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
	}
	
	@Bean
	public ResourceServerTokenServices tokenService() {
		RemoteTokenServices remoteTokenServices = new RemoteTokenServices();
		remoteTokenServices.setCheckTokenEndpointUrl("http://localhost:8081/oauth2/oauth/check_token");
		remoteTokenServices.setClientId("c1");
		remoteTokenServices.setClientSecret("secret");
		return remoteTokenServices;
	}
}
