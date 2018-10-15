package com.gjsyoung.iteach.utils;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * create by cairuojin on 2018/09/10
 * 邮箱工具
 */
@Component
public class EmailUtil {

    private static final Logger logger = LoggerFactory.getLogger(EmailUtil.class);

    @Async //异步执行
    public void sendMail(String email, String emailMsg)
            throws javax.mail.MessagingException, MessagingException {
        // 1.创建一个程序与邮件服务器会话对象 Session
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "SMTP");	//发送邮箱的协议
        props.setProperty("mail.host", "smtp.163.com");			//发送邮箱的服务器
        props.setProperty("mail.smtp.auth", "true");		// 指定验证为true

        // 创建验证器
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("13415089054", "hao123");	//发送邮箱的账号和密码
            }
        };
        Session session = Session.getInstance(props, auth);
        // 2.创建一个Message，它相当于是邮件内容
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("13415089054@163.com")); // 设置发件人
        message.setRecipient(RecipientType.TO, new InternetAddress(email)); // 设置发送方式与接收者
        message.setSubject("尧舜禹--用户激活");
        message.setContent(emailMsg, "text/html;charset=utf-8");
        Transport.send(message);	//发送
        logger.debug("发送邮件完毕：" + email);
    }


}
