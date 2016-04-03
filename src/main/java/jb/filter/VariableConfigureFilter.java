package jb.filter;

import jb.controller.ApiCommonController;
import jb.listener.Application;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 */
public class VariableConfigureFilter extends GenericFilterBean {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        request.setAttribute("GET","/api/apiCommon/get");
        request.setAttribute("staticVersion", Application.version);
        request.setAttribute(ApiCommonController.USER_TOKEN,request.getSession().getAttribute(ApiCommonController.USER_TOKEN));
        filterChain.doFilter(servletRequest,servletResponse);
    }
}
