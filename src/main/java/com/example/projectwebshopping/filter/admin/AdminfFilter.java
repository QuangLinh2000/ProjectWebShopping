package com.example.projectwebshopping.filter.admin;

import com.example.projectwebshopping.model.client.LogninManager;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AdminfFilter", urlPatterns = {"/views/admin/*"})
public class AdminfFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        User user = (User) req.getSession().getAttribute("userLognin");
        String url = req.getRequestURL().toString();
        if(url.contains("/admin")){
            if (user != null && user.getRole() ==0 ) {
                chain.doFilter(request, response);
            } else {
                resp.sendRedirect(req.getContextPath() +"/signin");
            }
        }else{
            chain.doFilter(request, response);

        }

    }
}
