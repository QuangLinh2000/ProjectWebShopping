package com.example.projectwebshopping.filter.client;

import com.example.projectwebshopping.model.client.LogninManager;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AccountFilter", urlPatterns = {"/account","/order"})
public class AccountFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        User user = (User) req.getSession().getAttribute("userLognin");
        LogninManager.getInstance().setURLCookies(req,resp);
        if (user != null) {
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect(req.getContextPath() +"/signin");
        }
    }
}
