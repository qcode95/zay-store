<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <title>Login Page</title>
        <%@include file="/common-admin/Header.jsp" %>
    </head>
    <body id="sherah-dark-light">

        <section class="sherah-wc sherah-wc__full sherah-bg-cover" style="background-image: url('img/credential-bg.svg');">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-6 col-md-6 col-12 sherah-wc-col-one">
                        <div class="sherah-wc__inner" style="background-image: url('<%=request.getContextPath()%>/assets-admin/img/welcome-bg.png');">
                            <!-- Logo -->
                            <div class="sherah-wc__logo">
                                <h1 style="color: #0044cc">Admin Sign In</h1>
                            </div>
                            <!-- Middle Image -->
                            <div class="sherah-wc__middle">
                                <a href="index.html"><img src="<%=request.getContextPath()%>/assets-admin/img/welcome-vector.png" alt="#"></a>
                            </div>
                            <!-- Welcome Heading -->
                            <h2 class="sherah-wc__title">Welcome to Zay Store</h2>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12 sherah-wc-col-two">
                        <div class="sherah-wc__form">
                            <div class="sherah-wc__form-inner">
                                <a href="<%=request.getContextPath()%>/home" style="text-decoration: none; color: #000">
                                    <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                </a>
                                <h3 class="sherah-wc__form-title sherah-wc__form-title__one">Login Your Account 
                                    <span>Please enter your email and password to continue</span></h3>

                                <%
                                    String msg = (String) request.getAttribute("msg");
                                    if (msg != null) {
                                %>
                                <div class="alert alert-danger text-center text-danger" role="alert">
                                    <%=msg%>
                                </div>
                                <% }%>

                                <!-- Sign in Form -->
                                <form class="sherah-wc__form-main p-0" action="./login-admin" method="post">
                                    <div class="form-group">
                                        <label class="sherah-wc__form-label">Email Address</label>
                                        <div class="form-group__input">
                                            <input class="sherah-wc__form-input" type="email" name="email" placeholder="demo3243@gmail.com" required="required">
                                        </div>
                                    </div>
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label class="sherah-wc__form-label">Password</label>
                                        <div class="form-group__input">
                                            <input class="sherah-wc__form-input" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;" id="password-field" type="password" name="password" placeholder="" maxlength="8" required="required">
                                        </div>
                                    </div>
                                    <!-- Form Group -->
                                    <div class="form-group form-mg-top25">
                                        <div class="sherah-wc__button sherah-wc__button--bottom">
                                            <button class="ntfmax-wc__btn" type="submit">Login</button>
                                        </div>
                                    </div>
                                </form>	
                                <!-- End Sign in Form -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="/common-admin/Js.jsp" %>
        <script src="https://cdn.jsdelivr.net/gh/AmagiTech/JSLoader/amagiloader.js"></script>
        <script>
            AmagiLoader.show();
            setTimeout(() => {
                AmagiLoader.hide();
            }, 600);
        </script>
    </body>
</html>
