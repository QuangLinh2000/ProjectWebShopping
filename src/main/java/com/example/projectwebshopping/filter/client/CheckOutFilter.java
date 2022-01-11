package com.example.projectwebshopping.filter.client;

import com.example.projectwebshopping.model.client.LogninManager;
import com.example.projectwebshopping.model.client.ProductManager;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "CheckOutFilter",urlPatterns = "/check-outs")
public class CheckOutFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        //get session
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        User user = (User) httpRequest.getSession().getAttribute("userLognin");
        if(user != null){
            chain.doFilter(request, response);
        }else {
            LogninManager.getInstance().setURLCookies(httpRequest,httpResponse);
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/signin");
        }
    }
}
