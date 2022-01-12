//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.model.client.User;
import com.example.projectwebshopping.service.client.IUserService;
import com.example.projectwebshopping.service.client.UserService;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
        name = "ResetPassController",
        value = {"/reset"}
)
public class ResetPassController extends HttpServlet {
    public ResetPassController() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/reset.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        if (userName != null) {
            String vetificationCode = UUID.randomUUID().toString();
            this.log("vetificationCode: " + vetificationCode);
            IUserService userService = new UserService();
            User user = userService.getUserByUsername(userName, vetificationCode);
            if (user != null) {
                String param = "?code=" + vetificationCode + "&username=" + user.getUsername() + "&email=" + user.getEmail();
                String var10000 = request.getRequestURL().toString().replace("reset", "change-pass");
                String url = var10000 + param;
                String mainText = "<p>Xin chào " + userName + ",<br>Chúng tôi nhận được yêu cầu thiết lập lại mật \n        khẩu cho tài khoản shop ITYSUKI của bạn.<br>Nhấn <a href=\"" + url + "\">tại đây</a> để thiết lập mật khẩu mới cho tài khoản Shopee của bạn.\n        <br><br>Hoặc vui lòng copy và dán đường dẫn bên dưới lên trình duyệt:<br>\n" + url + "    </p>";
                String data = "{\"status\":\"success\",\"email\":\"" + user.getEmail() + "\"}";
                response.getWriter().write(data);
                userService.sendMailHtml(user.getEmail(), "Thiet lap lai mat khau dang nhap shop ITYSUKI", mainText);
            } else {
                // status fail
                response.getWriter().write("{\"status\":\"fail\"}");
            }
        }

    }
}
