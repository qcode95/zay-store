<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contact Page</title>
        <%@include file="/common/Header.jsp" %>
    </head>
    <body>

        <%@include file="/common/Navbar.jsp" %>

        <div class="hero-wrap hero-bread" style="background-image: url('${pageContext.request.contextPath}/assets/images/bg_6.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-0">
                                <a href="<%=request.getContextPath()%>/home">Home > </a></span>
                            <span>Contact</span>
                        </p>
                        <h1 class="mb-0 bread">Contact Us</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section contact-section bg-light">
            <div class="container">
                <div class="row d-flex mb-5 contact-info">
                    <div class="w-100"></div>
                    <div class="col-md-3 d-flex">
                        <div class="info bg-white p-4">
                            <p><span>Address:</span> FPT University</p>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="info bg-white p-4">
                            <p><span>Phone:</span> <a href="tel://0398973408">(+84) 398973408</a></p>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="info bg-white p-4">
                            <p><span>Email:</span> <a href="mailto:zaystore123@gmail.com">zaystore123@gmail.com</a></p>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="info bg-white p-4">
                            <p><span>Website:</span> <a href="#">zaystore.com</a></p>
                        </div>
                    </div>
                </div>
                <%
                    String msg = (String) request.getAttribute("msg");
                    if (msg != null) {
                %>
                <div class="alert alert-success text-center text-success" role="alert">
                    <%=msg%>
                </div>
                <% }%>
                <div class="row block-9">
                    <div class="col-md-6 order-md-last d-flex">
                        <form action="<%=request.getContextPath()%>/contact" method="post" class="bg-white p-5 contact-form">
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" placeholder="Your Name">
                            </div>
                            <div class="form-group">
                                <input type="text" name="email" class="form-control" placeholder="Your Email">
                            </div>
                            <div class="form-group">
                                <input type="text" name="subject" class="form-control" placeholder="Subject">
                            </div>
                            <div class="form-group">
                                <textarea name="message" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
                            </div>
                        </form>

                    </div>

                    <div class="col-md-6 d-flex">
                        <div class="bg-white">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3874.5839458661!2d109.21796522369557!3d13.803936481422468!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316f6bf778c80973%3A0x8a7d0b5aa0af29c7!2zxJDhuqFpIGjhu41jIEZQVCBRdXkgTmjGoW4!5e0!3m2!1svi!2s!4v1700842745431!5m2!1svi!2s" 
                                    width="600" height="450" 
                                    style="margin-left: 50px; margin-top: 50px; border: 0" 
                                    allowfullscreen="" 
                                    loading="lazy" 
                                    referrerpolicy="no-referrer-when-downgrade">
                            </iframe>
                        </div>
                    </div>
                </div>
            </div>
        </section> 

        <%@include file="/common/Loader.jsp" %>
        <%@include file="/common/Instagram.jsp" %>
        <%@include file="/common/Footer.jsp" %>
        <%@include file="/common/Js.jsp" %>
    </body>
</html>
