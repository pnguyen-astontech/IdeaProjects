package com.astontech.fap.configuration;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by petenguy1 on 9/28/2016.
 */
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Value ("${spring.security.authentication.method}")
    private String authenticationMethod;

    @Autowired
    private DataSource dataSource;

    @Autowired
    public void configureGlobal (AuthenticationManagerBuilder auth) throws Exception {
        if (authenticationMethod.toLowerCase().equals("none")) {

        } else if (authenticationMethod.toLowerCase().equals("database")) {
            JdbcUserDetailsManager userDetailsService = new JdbcUserDetailsManager();
            userDetailsService.setDataSource(dataSource);
            PasswordEncoder encoder = new BCryptPasswordEncoder();

            auth.userDetailsService(userDetailsService).passwordEncoder(encoder);
            auth.jdbcAuthentication().dataSource(dataSource);

            if (!userDetailsService.userExists("admin")) {
                List<GrantedAuthority> authorities = new ArrayList<>();
                authorities.add(new SimpleGrantedAuthority("ADMIN"));
                User userDetails = new User("admin", encoder.encode("123"), authorities);

                JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

                userDetailsService.createUser(userDetails);
                jdbcTemplate.update("update users set person_id = ? where username = ?", 1, "admin");
            }
        }
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {

        if (authenticationMethod.toLowerCase().equals("none")) {
            httpSecurity
                    .authorizeRequests().antMatchers("/").permitAll()
                    .and()
                    .authorizeRequests().antMatchers("/console/**").permitAll();
        } else if (authenticationMethod.toLowerCase().equals("database")) {
            httpSecurity
                    .authorizeRequests().antMatchers("/static/**").permitAll()
                    .and()
                    .authorizeRequests().antMatchers("/login**").permitAll()
                    .and()
                    .authorizeRequests().antMatchers("/admin/**").hasAuthority("ADMIN")
                    .and()
                    .authorizeRequests().antMatchers("/profile/**").hasAnyAuthority("USER","ADMIN");

        }

        httpSecurity
                .formLogin().loginPage("/login").loginProcessingUrl("/login.do")
                .defaultSuccessUrl("/", true).failureUrl("/login?err=1")
                .usernameParameter("username").passwordParameter("password")
                .and()
                .exceptionHandling().accessDeniedPage("/error/403");

        httpSecurity.csrf().disable();
        httpSecurity.headers().frameOptions().disable();
    }
}
