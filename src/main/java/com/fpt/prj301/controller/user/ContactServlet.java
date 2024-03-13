package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Contact;
import com.fpt.prj301.util.mail.MailMessage;

public class ContactServlet extends HttpServlet {

    private static final long serialVersionUID = 2479001982743159758L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        Contact contact = new Contact();
        contact.setName(name);
        contact.setEmail(email);
        contact.setSubject(subject);
        contact.setMessage(message);

        MailMessage.contactSuccess(contact);

        request.setAttribute("msg", "Your message has been successfully submitted.");
        request.getRequestDispatcher("./views/contact/Contact.jsp").forward(request, response);
    }
}
