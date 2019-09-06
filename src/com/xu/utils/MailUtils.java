package com.xu.utils;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;


public class MailUtils implements Runnable{
    //发送人邮箱
    public static String myEmailAccount = "admin@blog.com";
    //发送人密码或授权码
    public static String myEmailPassword = "admin";
    //接收人邮箱
    public String email;
    //邮件激活码
    public String emailMsg;

    public MailUtils(String email, String emailMsg) {
        this.email = email;
        this.emailMsg = emailMsg;
    }

    private  void sendMail() throws MessagingException, UnsupportedEncodingException {
        //1.创建一个程序与邮件服务器会话对象Session
        Properties properties = new Properties();
        //设置发送的协议
        //properties.setProperty("mail.transport.protocol","SMTP");
        //设置发送邮件的服务器
        //properties.setProperty("mail.smtp.host","smtp.163.com");
        //设置验证为true
       // properties.setProperty("mail.smtp.auth","true");

        //创建验证器
        Authenticator authenticator = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(myEmailAccount,myEmailPassword);
            }
        };
        //1.
        Session session = Session.getInstance(properties,authenticator);
        session.setDebug(true);
        //2.创建一个Message，相当于邮件内容
        Message message = new MimeMessage(session);
        //设置发送者
        message.setFrom(new InternetAddress(myEmailAccount, "彼人博客网", "UTF-8"));
        //设置发送方式与接收者
        message.setRecipient(Message.RecipientType.TO,new InternetAddress(email));
        //设置邮件主题
        message.setSubject("Blog-用户激活");
        String url="http://localhost:8080/active/"+emailMsg;
        String content ="<div style='width: 650px; height: 350px;padding: 10px; border: 1px solid white; box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);'>"
                        +"<h2>彼人博客网</h2>"
                        +"<p>尊敬的用户</p>"
                        +"<p>您好！</p>"
                        +"<p> 感谢您注册，请点击以下链接完成激活： </p>"
                        +"<p><a href='"+url+"'>"+url+"</a></p>"
                        +"<p>此验证码15分钟内有效，请立即进行下一步操作。 如非你本人操作，请忽略此邮件。</p>"
                        +"<p>感谢您的使用！</p>"
                        +"<hr style='border: 1px dashed gainsboro; '/>"
                        +" <p style='color: gainsboro; font-size: 14px;'>此为系统邮件请勿回复</p>"
                        +"</div>";
        //设置邮件内容
        message.setContent(content,"text/html;charset=utf-8");
        Transport.send(message);
    }
    @Override
    public void run() {
        try {
            sendMail();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
