package tw.com.iwow.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import tw.com.iwow.service.MemberDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private MemberDetailsService memberDetailsService;
//	@Autowired
//	private PersistentTokenRepository tokenRepository;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
			.antMatchers("/iwow/admin")
				.hasRole("ADMIN")
			.antMatchers("/login*", "/signup")
				.permitAll()
			.anyRequest()
				.hasRole("USER")
		.and()
			.formLogin()
				.loginPage("/login")
				.failureUrl("/login?error")
				.loginProcessingUrl("/login_check")
				.usernameParameter("email")
				.passwordParameter("password")
		.and()
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/login?logout")
			.deleteCookies("JSESSIONID")
//		.and()
//			.rememberMe()
//			.rememberMeParameter("rememberMe")
//			.tokenRepository(tokenRepository)
//			.tokenValiditySeconds(86400)
		.and()
			.csrf()
		.and()
			.exceptionHandling()
			.accessDeniedPage("/403");
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.userDetailsService(memberDetailsService);
		
	}

}