package com.example.projectwebshopping.model.client;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogninManager {
    //pattern singleton

    private static LogninManager instance;
    //constructor
    private LogninManager(){
    }
    //getInstance
    public static LogninManager getInstance(){
        if(instance == null){
            instance = new LogninManager();
        }
        return instance;
    }
    //set session url
    public void setURLCookies(HttpServletRequest request, HttpServletResponse response){
        String url = request.getRequestURL().toString();
        String param=request.getQueryString();

        //get cookie
        Cookie[] cookies = request.getCookies();
        //set url to cookie
        for (Cookie c : cookies) {
            if (c.getName().equals("url")) {
                c.setMaxAge(0);
                c.setValue(null);
            }
        }
           if(param!=null){
               url=url+"?"+param;
           }
            Cookie cookie = new Cookie("url", url);
            response.addCookie(cookie);

    }
    //get session url
    public String getURLCookies(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        //get url from cookie
        String url = "";
        boolean isExist = false;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("url")) {
                    url = cookie.getValue();
                    isExist = true;
                    break;
                }
            }
        }
        if (!isExist) {
            url = request.getContextPath()+"/home";
        }
        return url;
    }
}
