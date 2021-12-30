package com.example.projectwebshopping.service.client;

import com.example.projectwebshopping.dao.client.UserDAO;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class UserService implements IUserService {
    @Override
    public boolean isValidUser(String username, String password,String email) {
        return UserDAO.getInstance().isValidUser(username, password,email);
    }

    @Override
    public void sendMail(String email, String subject, String text) {
        final String username = "19130118@st.hcmuaf.edu.vn";
        final String password = "Hackco2909\"!\"";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setSubject(subject);
            message.setText(text);

            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
}
