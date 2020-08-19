package com.oauth2.server.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
public class UserDetailsServiceImpl implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        String[] permissionArray = new String[1];
        permissionArray[0] = "ROLE_PRODUCT_ADMIN";
        UserDetails userDetails = User.withUsername(username).password(new BCryptPasswordEncoder().encode(username)).authorities(permissionArray).build();
        return userDetails;
	}

}
