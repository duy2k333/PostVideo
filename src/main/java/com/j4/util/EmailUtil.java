package com.j4.util;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailUtil {

    // Thông tin tài khoản gửi email
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String SENDER_EMAIL = "your-email@gmail.com";
    private static final String SENDER_PASSWORD = "your-email-password";

    // Gửi email thay đổi mật khẩu
    public static void sendResetPasswordEmail(String recipientEmail, String resetLink) {
        String subject = "Hướng dẫn thay đổi mật khẩu";
        String message = "Click vào liên kết sau để thay đổi mật khẩu: " + resetLink;

        // Cấu hình thông số gửi email
        Properties properties = new Properties();
        properties.put("mail.smtp.host", SMTP_HOST);
        properties.put("mail.smtp.port", SMTP_PORT);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2"); 
        // Tạo Session với thông tin tài khoản gửi
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            // Tạo đối tượng MimeMessage
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(SENDER_EMAIL));
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            mimeMessage.setSubject(subject);
            mimeMessage.setText(message);

            // Gửi email
            Transport.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
