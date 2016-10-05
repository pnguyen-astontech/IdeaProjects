package com.astontech.fap.handlers;

import com.sun.org.apache.xerces.internal.xs.XSImplementation;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by petenguy1 on 10/4/2016.
 */
@Component
public class LogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {

    @Override
    public void onLogoutSuccess (HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException{
        if (authentication != null) {

        }

        setDefaultTargetUrl("/");
        super.onLogoutSuccess(request, response, authentication);
    }
}
