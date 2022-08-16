package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.accessgoogle.GooglePojo;
import com.example.projectwebshopping.accessgoogle.GoogleUtils;
import com.example.projectwebshopping.dao.client.CartDao;
import com.example.projectwebshopping.model.client.Cart;
import com.example.projectwebshopping.model.client.LogninManager;
import com.example.projectwebshopping.model.client.User;
import com.example.projectwebshopping.service.client.IUserService;
import com.example.projectwebshopping.service.client.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "LoginGoogleController", value = "/login-google")
public class LoginGoogleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            request.setAttribute("login_err","login fall");
            request.setAttribute("container_view","/views/signinvssignup.jsp");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            HttpSession session = request.getSession();
            IUserService userService = new UserService();
            User user = userService.getUserById(googlePojo.getId());
            if (user==null){
                userService.insertUserGoogle(googlePojo.getEmail(),googlePojo.getEmail(),googlePojo.getId());
            }
            user = userService.getUserById(googlePojo.getId());
            session.setAttribute("userLognin", user);
            Map<String, Cart> cartMap = (Map<String, Cart>) session.getAttribute("cartMap");
            if(cartMap != null){
                for (Map.Entry<String, Cart> entry : cartMap.entrySet()) {
                    CartDao.getInstance().addGioHang(user.getId(),entry.getValue().getIdProduct(), entry.getValue().getQuantity(), entry.getValue().getSize());
                }
                request.removeAttribute("cartMap");
            }

            response.sendRedirect(LogninManager.getInstance().getURLCookies(request));
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }
}
