<%@page import="com.fpt.prj301.util.facebook.FacebookUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login Page</title>
        <%@include file="/common/Header.jsp" %>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/custom-css/Form.css">
        <style>
            .checkbox-wrapper-1 *,
            .checkbox-wrapper-1 ::after,
            .checkbox-wrapper-1 ::before {
                box-sizing: border-box;
            }
            .checkbox-wrapper-1 [type=checkbox].substituted {
                margin: 0;
                width: 0;
                height: 0;
                display: inline;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
            }
            .checkbox-wrapper-1 [type=checkbox].substituted + label:before {
                content: "";
                display: inline-block;
                vertical-align: top;
                height: 1.15em;
                width: 1.15em;
                margin-right: 0.6em;
                color: rgba(0, 0, 0, 0.275);
                border: solid 0.06em;
                box-shadow: 0 0 0.04em, 0 0.06em 0.16em -0.03em inset, 0 0 0 0.07em transparent inset;
                border-radius: 0.2em;
                background: url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" version="1.1" xml:space="preserve" fill="white" viewBox="0 0 9 9"><rect x="0" y="4.3" transform="matrix(-0.707 -0.7072 0.7072 -0.707 0.5891 10.4702)" width="4.3" height="1.6" /><rect x="2.2" y="2.9" transform="matrix(-0.7071 0.7071 -0.7071 -0.7071 12.1877 2.9833)" width="6.1" height="1.7" /></svg>') no-repeat center, white;
                background-size: 0;
                will-change: color, border, background, background-size, box-shadow;
                transform: translate3d(0, 0, 0);
                transition: color 0.1s, border 0.1s, background 0.15s, box-shadow 0.1s;
            }
            .checkbox-wrapper-1 [type=checkbox].substituted:enabled:active + label:before,
            .checkbox-wrapper-1 [type=checkbox].substituted:enabled + label:active:before {
                box-shadow: 0 0 0.04em, 0 0.06em 0.16em -0.03em transparent inset, 0 0 0 0.07em rgba(0, 0, 0, 0.1) inset;
                background-color: #f0f0f0;
            }
            .checkbox-wrapper-1 [type=checkbox].substituted:checked + label:before {
                background-color: #3B99FC;
                background-size: 0.75em;
                color: rgba(0, 0, 0, 0.075);
            }
            .checkbox-wrapper-1 [type=checkbox].substituted:checked:enabled:active + label:before,
            .checkbox-wrapper-1 [type=checkbox].substituted:checked:enabled + label:active:before {
                background-color: #0a7ffb;
                color: rgba(0, 0, 0, 0.275);
            }
            .checkbox-wrapper-1 [type=checkbox].substituted:disabled + label:before {
                opacity: 0.5;
            }

            .checkbox-wrapper-1 [type=checkbox].substituted.dark + label:before {
                color: rgba(255, 255, 255, 0.275);
                background-color: #222;
                background-image: url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" version="1.1" xml:space="preserve" fill="rgba(34, 34, 34, 0.999)" viewBox="0 0 9 9"><rect x="0" y="4.3" transform="matrix(-0.707 -0.7072 0.7072 -0.707 0.5891 10.4702)" width="4.3" height="1.6" /><rect x="2.2" y="2.9" transform="matrix(-0.7071 0.7071 -0.7071 -0.7071 12.1877 2.9833)" width="6.1" height="1.7" /></svg>');
            }
            .checkbox-wrapper-1 [type=checkbox].substituted.dark:enabled:active + label:before,
            .checkbox-wrapper-1 [type=checkbox].substituted.dark:enabled + label:active:before {
                background-color: #444;
                box-shadow: 0 0 0.04em, 0 0.06em 0.16em -0.03em transparent inset, 0 0 0 0.07em rgba(255, 255, 255, 0.1) inset;
            }
            .checkbox-wrapper-1 [type=checkbox].substituted.dark:checked + label:before {
                background-color: #a97035;
                color: rgba(255, 255, 255, 0.075);
            }
            .checkbox-wrapper-1 [type=checkbox].substituted.dark:checked:enabled:active + label:before,
            .checkbox-wrapper-1 [type=checkbox].substituted.dark:checked:enabled + label:active:before {
                background-color: #c68035;
                color: rgba(0, 0, 0, 0.275);
            }
            .zmdi {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .fa-linkedin-square{
                background: #0077B5;
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>

    <%
        FacebookUtil fbConnection = new FacebookUtil();
    %>

    <body>
        <br>    
        <div class="main">
            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="<%=request.getContextPath()%>/assets/images/signin-image.jpg" style="width: 320px; height: 350px"
                                         alt="sing up image"></figure>
                            <a href="<%=request.getContextPath()%>/register" class="signup-image-link">Create an account</a>
                        </div>

                        <div class="signin-form">
                            <a href="<%=request.getContextPath()%>/home" style="text-decoration: none; color: #000">
                                <i class="fa fa-arrow-left" aria-hidden="true"></i>
                            </a>
                            <h2 class="form-title">Sign in</h2>
                            <%
                                String msg = (String) request.getAttribute("msg");
                                if (msg != null) {
                            %>
                            <div class="alert alert-danger text-center text-danger" role="alert">
                                <%=msg%>
                            </div>
                            <% } %>

                            <%
                                String successMsg = (String) request.getAttribute("successMsg");
                                if (successMsg != null) {
                            %>
                            <div class="alert alert-success text-center text-success" role="alert">
                                <%=successMsg%>
                            </div>
                            <% }%>

                            <%
                                String failMsg = (String) request.getAttribute("failMsg");
                                if (failMsg != null) {
                            %>
                            <div class="alert alert-danger text-center text-danger" role="alert">
                                <%=failMsg%>
                            </div>
                            <% }%>
                            <br>
                            <c:set var="cookie" value="${pageContext.request.cookies}"/>
                            <form action="./login" method="post" class="register-form" id="loginForm">
                                <div class="form-group">
                                    <label for="email"><i class="material-icons" style="font-size: 20px">mail</i></label>
                                    <input type="text" name="email" id="email" placeholder="Your Email" value="${cookie.email.value}"/>
                                </div>
                                <div class="form-group">
                                    <label for="password"><i class="material-icons" style="font-size: 20px">lock</i></label>
                                    <input type="password" name="password" id="password" placeholder="Password" value="${cookie.password.value}"/>
                                </div>
                                <div class="form-group" style="padding-bottom: 10px">
                                    <div class="checkbox-wrapper-1">
                                        <input id="term" class="substituted" name="remember" type="checkbox" aria-hidden="true" />
                                        <label for="term">Remember me  <a href="<%=request.getContextPath()%>/forgot-password" class="term-service">Forgot Password?</a></label>
                                    </div>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin" class="form-submit" value="Log in" style="background: #dbcc8f;"/>
                                </div>
                            </form>
                            <div class="social-login">
                                <span class="social-label">Or login with</span>
                                <ul class="socials">
                                    <li><a href="<%=fbConnection.getFBAuthUrl()%>"><i class="zmdi zmdi-facebook"></i></a></li>
                                    <li><a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/zaystore/login-google&response_type=code&client_id=677531895603-bm3l892pu6nl9lgoup30u547625oag4q.apps.googleusercontent.com&approval_prompt=force">
                                            <i class="zmdi zmdi-google"></i></a></li>
                                    <li><a href="https://www.linkedin.com/oauth/v2/authorization?response_type=code&client_id=86mmx4v08rl8r7&redirect_uri=https://localhost:8080/zaystore/login-linkedin&state=fdfdfdfd&scope=r_fullprofile%20r_emailaddress">
                                            <i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <%@include file="/common/Loader.jsp" %>
        <%@include file="/common/Js.jsp" %>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Chờ cho DOM được tải hoàn toàn trước khi thêm các sự kiện nghe
                var loginForm = document.getElementById("loginForm");

                loginForm.addEventListener("submit", function (event) {
                    // Hủy sự kiện mặc định để ngăn form submit
                    event.preventDefault();

                    // Gọi hàm kiểm tra validation
                    if (validateForm()) {
                        // Nếu hợp lệ, thực hiện submit form
                        loginForm.submit();
                    }
                });

                function validateForm() {
                    var email = document.getElementById("email").value;
                    var password = document.getElementById("password").value;


                    // Thực hiện các kiểm tra validation ở đây
                    // kiểm tra nếu một trường không được bỏ trống
                    if (email.trim() === "" || password.trim() === "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "All fields have to be filled!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Kiểm tra định dạng email
                    var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                    if (!emailRegex.test(email)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Invalid Email address!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    return true;
                }
            });
        </script>
    </body>
</html>
