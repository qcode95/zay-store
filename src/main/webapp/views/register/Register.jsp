<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <title>Register Page</title>
        <%@include file="/common/Header.jsp" %>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/custom-css/Form.css">
        <script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
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
        </style>
    </head>
    <body>
        <div class="main">            
            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <a href="<%=request.getContextPath()%>/home" style="text-decoration: none; color: #000">
                                <i class="fa fa-arrow-left" aria-hidden="true"></i>
                            </a>
                            <h2 class="form-title">Sign up</h2>
                            <%
                                String msg = (String) request.getAttribute("failedMsg");
                                if (msg != null) {
                            %>
                            <div class="alert alert-danger text-center text-danger" role="alert">
                                <%=msg%>
                            </div>
                            <% }%>

                            <%
                                String captchaMsg = (String) request.getAttribute("captchaMsg");
                                if (captchaMsg != null) {
                            %>
                            <div class="alert alert-danger text-center text-danger" role="alert">
                                <%=captchaMsg%>
                            </div>
                            <% }%>
                            <br>
                            <form action="./register" method="post" id="registerForm">
                                <div class="form-group">
                                    <label for="name"><i class="material-icons" style="font-size: 20px">person</i></label>
                                    <input type="text" name="name" id="name" placeholder="Your Name"/>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="material-icons" style="font-size: 20px">mail</i></label>
                                    <input type="text" name="email" id="email" placeholder="Your Email"/>
                                </div>
                                <div class="form-group">
                                    <label for="phone"><i class="material-icons" style="font-size: 20px">phone</i></label>
                                    <input type="text" name="mobile" id="phone" placeholder="Your Phone"/>
                                </div>
                                <div class="form-group">
                                    <label for="address"><i class="material-icons" style="font-size: 20px">location_on</i></label>
                                    <input type="text" name="address" id="address" placeholder="Your Address"/>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="material-icons" style="font-size: 20px">lock</i></label>
                                    <input type="password" name="password" id="pass" placeholder="Password"/>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="material-icons" style="font-size: 20px">lock_outline</i></label>
                                    <input type="password" name="re-pass" id="re-pass" placeholder="Repeat your password"/>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox-wrapper-1">
                                        <input id="term" class="substituted" type="checkbox" aria-hidden="true" />
                                        <label for="term">I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                                    </div>
                                </div>
                                <div class="g-recaptcha"
                                     data-sitekey="6Ldo9BwpAAAAAJUTRGZleZKbWtZk4p0u8JrbFEcl">
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Register" style="background: #dbcc8f;"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure>
                                <img src="<%=request.getContextPath()%>/assets/images/signup-image.jpg" style="width: 480px; height: 450px"
                                     alt="sing up image">
                            </figure>
                            <a href="<%=request.getContextPath()%>/login" class="signup-image-link">I am already member</a>
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
                var registerForm = document.getElementById("registerForm");

                registerForm.addEventListener("submit", function (event) {
                    // Hủy sự kiện mặc định để ngăn form submit
                    event.preventDefault();

                    // Gọi hàm kiểm tra validation
                    if (validateForm()) {
                        // Nếu hợp lệ, thực hiện submit form
                        registerForm.submit();
                    }
                });

                function validateForm() {
                    var name = document.getElementById("name").value;
                    var email = document.getElementById("email").value;
                    var phone = document.getElementById("phone").value;
                    var address = document.getElementById("address").value;
                    var pass = document.getElementById("pass").value;
                    var rePass = document.getElementById("re-pass").value;
                    var checkbox = document.getElementById("term").checked;

                    // Thực hiện các kiểm tra validation ở đây
                    // kiểm tra nếu một trường không được bỏ trống
                    if (name.trim() === "" || email.trim() === "" || phone.trim() === "" || address.trim() === "" || pass.trim() === "" || rePass.trim() === "") {
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

                    // Kiểm tra checkbox đã được chọn hay chưa
                    if (!checkbox) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "You have to agree with Term of Service!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Kiểm tra mật khẩu có khớp không
                    if (pass !== rePass) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Passwords do not match!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Kiểm tra độ dài mật khẩu
                    if (pass.length <= 8) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Passwords need at least 8 charactors !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (pass.length >= 24) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Passwords need at most 24 charactors !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Kiểm tra các trường hợp đặc biệt của mật khẩu
                    var upperRegex = /[A-Z]/;
                    var lowerRegex = /[a-z]/;
                    var numberRegex = /[0-9]/;
                    var specialRegex = /[^A-Za-z0-9]/;

                    if (!upperRegex.test(pass)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 uppercase character !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (!lowerRegex.test(pass)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 lower character !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (!numberRegex.test(pass)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 numberic character !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (!specialRegex.test(pass)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 special character !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    var phoneRegex = /^\d{10}$/;
                    if (!phoneRegex.test(phone)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Invalid phone number! Please enter a 10-digit phone number.",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Nếu tất cả kiểm tra đều hợp lệ, trả về true
                    return true;
                }
            });
        </script>

    </body>
</html>
