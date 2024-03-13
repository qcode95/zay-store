package com.fpt.prj301.util.mail;

import com.fpt.prj301.model.Contact;
import com.fpt.prj301.model.Order;
import com.fpt.prj301.model.Product;
import com.fpt.prj301.model.User;
import jakarta.mail.MessagingException;

public class MailMessage {

    public static void registrationSuccess(User user) {
        String recipient = user.getEmail();
        String subject = "Registration Successfull";
        String htmlTextMessage = "" + "<html>" + "<body>"
                + "<h2 style='color:green;'>Welcome to Zay Store</h2>" + "" + "Hi " + user.getName() + ","
                + "<br><br>Thanks for singing up with Zay Store.<br>"
                + "We are glad that you choose us. We invite you to check out our latest collection of new products."
                + "<br>We are providing upto 60% OFF on most of the products. So please visit our website and explore the collections."
                + "<br><br>Our shoes is growing in a larger amount these days and we are in high demand so we thanks all of you for "
                + "making us up to that level. We Deliver Product to your house with no extra delivery charges and we also have collection of most of the"
                + "branded items.<br><br>As a Welcome gift for our New Customers we are providing additional SALE OFF 10$ for the first order purchase. "
                + "<br>To avail this offer you only have "
                + "to enter the gift code given below.<br><br><br> GIFT CODE: " + "ZayStore10<br>"
                + "<h4 style='color:green;'>And this is your OTP: " + user.getCode() + "</h4>"
                + "<br><br><br>"
                + "<h4 style='color:green;'>Have a good day!</h4><br>" + "" + "</body>" + "</html>";
        try {
            JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void forgetVerifySuccess(String email, String tempPass) {
        String recipient = email;
        String subject = "Reset Password Request Successfull";
        String htmlTextMessage = "" + "<html>" + "<body>"
                + "<h2>Hi there,</h2>"
                + "<br><h4>Forgot your Password ?</h4>"
                + "<br>Zay Store received a request to reset the Password for your account."
                + "<br>Now we will help you to secure your Password one more time."
                + "<br><br><b>To reset your Password, use this Temporary Password: </b>"
                + "<h4 style='color:green;'>" + tempPass + "</h4>"
                + "<br><br><br>"
                + "<h4 style='color:green;'>Have a good day!</h4><br>" + "" + "</body>" + "</html>";
        try {
            JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void shippingSuccess(User user) {
        String recipient = user.getEmail();
        String subject = "Your Order is being shipped";
        String htmlTextMessage = "" + "<html>" + "<body>"
                + "<h2 style='color:green;'>Welcome to Zay Store</h2>" + "" + "Hi " + user.getName() + ","
                + "<br><br>Thanks for shopping with Zay Store.<br>"
                + "We are glad that you choose us."
                + "<br>We Deliver Product to your house with just tiny delivery charges and we also have collection of most of the branded items."
                + "<br>Now Your order is being shipped to your address."
                + "<br><br><br>"
                + "<h4 style='color:green;'>Have a good day!</h4><br>" + "" + "</body>" + "</html>";
        try {
            JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void deliveredSuccess(User user) {
        String recipient = user.getEmail();
        String subject = "Your Order is being shipped";
        String htmlTextMessage = "" + "<html>" + "<body>"
                + "<h2 style='color:green;'>Zay Store is very grateful to you for your order.</h2>" + "" + "Hi " + user.getName() + ","
                + "<br><br>Thanks for shopping with Zay Store.<br>"
                + "We are glad that you choose us."
                + "<br>We Deliver Product to your house with just tiny delivery charges and we also have collection of most of the branded items."
                + "<br>Now Your order is shipped to your address. Again, thank you very much."
                + "<br><br><br>"
                + "<h4 style='color:green;'>Have a good day!</h4><br>" + "" + "</body>" + "</html>";
        try {
            JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void refundSuccess(User user, Order order) {
        String recipient = user.getEmail();
        String subject = "Refund Confirmation";
        String htmlTextMessage = "" + "<html>" + "<body>"
                + "<h2 style='color:green;'>Zay Store very sorry about this confuse.</h2>" + "" + "Hi " + user.getName() + ","
                + "<br><br>We have received your request for a refund for the following product:<br>"
                + "<p><strong>Order Number:</strong> #"+ order.getOrderId() +"</p><br>"
                + "<p><strong>Refund Amount:</strong> "+ order.getAmount() +"</p>"
                + "<br><p>Your refund request is being processed, and you will be notified once the refund is completed.</p>"
                + "<br><br><p>Thank you for shopping with us.</p>"
                + "<br><br><br>"
                + "<h4 style='color:green;'>Have a good day!</h4><br>" + "" + "</body>" + "</html>";
        try {
            JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public static void contactSuccess(Contact contact) {
        String recipient = "quynxqe170239@fpt.edu.vn";
        String subject = contact.getSubject();
        String htmlTextMessage = "" + "<html>" + "<body>"
                + "<h2 style='color:green;'>Hello Zay Store.</h2>" + "" + "I'm " + contact.getName() + ","
                + "<br><br>I have some problem about "+ contact.getSubject() +":<br>"
                + "<p>"+ contact.getMessage() +"</p><br>"
                + "<br><p>Thank you for your contribution. Zay Store sincerely thanks you.</p>"
                + "<br>"
                + "<h4 style='color:green;'>Have a good day!</h4><br>" + "" + "</body>" + "</html>";
        try {
            JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public static void notifySuccess(User user, Product product) {
        String recipient = user.getEmail();
        String subject = "Product Out Of Stock";
        String htmlTextMessage = "" + "<html>" + "<body>"
                + "<h2 style='color:green;'>Welcome to Zay Store.</h2>" + "" + "Hi " + user.getName() + ","
                + "<br><br>Thank you for your interest in Zay Store products.<br>"
                + "But Zay Store is also very sorry because product "+ product.getName() +" is out of stock.<br>"
                + "<br>If you are interested, we will notify you when the product comes back.<br>"
                + "Once again, Zay Store is sincere because you are interested in Zay Store products."
                + "<br><br>"
                + "<h4 style='color:green;'>Have a good day!</h4><br>" + "" + "</body>" + "</html>";
        try {
            JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public String sendMessage(String toEmailId, String subject, String htmlTextMessage) {
        try {
            JavaMailUtil.sendMail(toEmailId, subject, htmlTextMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
            return "FAILURE";
        }
        return "SUCCESS";
    }
}
