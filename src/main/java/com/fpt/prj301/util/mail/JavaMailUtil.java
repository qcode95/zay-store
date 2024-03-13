package com.fpt.prj301.util.mail;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JavaMailUtil {

    private static final String mailId = "quynxqe170239@fpt.edu.vn";
    private static final String password = "pqgf qjfr ykfa qqcs";

    public String getRandom() {
        Random random = new Random();

        int number = random.nextInt(999999);

        return String.format("%6d", number);
    }
    
    public String randomAlphaNumeric(int numberOfCharactor) {
        String alpha = "abcdefghijklmnopqrstuvwxyz";
        String alphaUppercase = alpha.toUpperCase();
        String digits = "0123456789";
        
        String alphaNumeric = alpha + alphaUppercase + digits;
        
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < numberOfCharactor; i++) {
            int number = randomNumber(0, alphaNumeric.length() - 1);
            char ch = alphaNumeric.charAt(number);
            sb.append(ch);
        }
        return sb.toString();
    }
    
    public static int randomNumber(int min, int max) {
        Random random = new Random();
        return random.nextInt((max - min) + 1) + min;
    }

    public static void sendMail(String recipientMailId) throws MessagingException {

        System.out.println("Preparing to send Mail");
        Properties properties = new Properties();
        String host = "smtp.gmail.com";
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.transport.protocol", "smtp");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.port", "587");
        properties.put("mail.smtp.socketFactory.port", "587");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        properties.put("mail.user", mailId);
        properties.put("mail.password", password);

        Session session = Session.getInstance(properties, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailId, password);
            }

        });

        Message message = prepareMessage(session, mailId, recipientMailId);

        Transport.send(message);

        System.out.println("Message Sent Successfully!");

    }

    public static Message prepareMessage(Session session, String myAccountEmail, String recipientEmail) {

        try {

            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            message.setSubject("Welcome to Ellison Electronics");
            message.setText("Hey! " + recipientEmail + ", Thanks  for Signing Up with us!");
            return message;

        } catch (Exception exception) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, exception);
        }
        return null;

    }

    protected static void sendMail(String recipient, String subject, String htmlTextMessage) throws MessagingException {

        System.out.println("Preparing to send Mail");
        Properties properties = new Properties();
        String host = "smtp.gmail.com";
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.transport.protocol", "smtp");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.port", "587");
        properties.put("mail.smtp.socketFactory.port", "587");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        properties.put("mail.user", mailId);
        properties.put("mail.password", password);

        Session session = Session.getInstance(properties, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailId, password);
            }

        });

        Message message = prepareMessage(session, mailId, recipient, subject, htmlTextMessage);

        Transport.send(message);

        System.out.println("Message Sent Successfully!");

    }

    private static Message prepareMessage(Session session, String myAccountEmail, String recipientEmail, String subject, String htmlTextMessage) {
        try {

            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            message.setSubject(subject);
            message.setContent(htmlTextMessage, "text/html");
            return message;

        } catch (Exception exception) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, exception);
        }
        return null;

    }
}
