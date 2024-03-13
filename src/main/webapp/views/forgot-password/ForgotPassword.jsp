<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <title>Forget Password Page</title>
        <%@include file="/common/Header.jsp" %>
        <style>
            body {
                background-position: center;
                background-color: #fff;
                background-repeat: no-repeat;
                background-size: cover;
                color: #505050;
                font-family: "Rubik", Helvetica, Arial, sans-serif;
                font-size: 14px;
                font-weight: normal;
                line-height: 1.5;
                text-transform: none
            }

            .forgot {
                background-color: #fff;
                padding: 12px;
                border: 1px solid #dfdfdf
            }

            .padding-bottom-3x {
                padding-bottom: 72px !important
            }

            .card-footer {
                background-color: #fff
            }

            .btn {
                font-size: 13px
            }

            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #76b7e9;
                outline: 0;
                box-shadow: 0 0 0 0px #28a745
            }
        </style>
    </head>
    <body oncontextmenu='return false' class='snippet-body'>
        <div class="container padding-bottom-3x mb-2 mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="forgot">
                        <a href="<%=request.getContextPath()%>/login" style="text-decoration: none; color: #333">
                            <i class="d-flex fa fa-arrow-left" aria-hidden="true"></i>
                        </a>
                        <br>
                        <h2>Forgot your password?</h2>
                        <p>Change your password in three easy steps. This will help you to secure your password!</p>
                        <ol class="list-unstyled">
                            <li><span class="text-dark text-medium">1. </span>Enter your email address below.</li>
                            <li><span class="text-dark text-medium">2. </span>Our system will send you a Temporary Password to your email.</li>
                            <li><span class="text-dark text-medium">3. </span>Enter the Password on the next page.</li>
                        </ol>
                    </div>
                    <br>
                    <%
                        String msg = (String) request.getAttribute("msg");
                        if (msg != null) {
                    %>
                    <div class="alert alert-danger text-center text-danger" role="alert">
                        <%=msg%>
                    </div>
                    <% }%>
                    <form class="card mt-4" action="./forgot-password" method="post" id="forgetForm">
                        <div class="card-body">
                            <div class="input-box">
                                <label for="email-for-pass">Enter your email address</label> 
                                <input class="form-control" type="text" name="email" id="email-for-pass" rules="required|email">
                                <span class="form-message text-danger" style="font-size: 0.9rem"></span>
                                <small class="form-text text-muted">Enter the registered email address. 
                                    Then we'll email a temporary Password to this address.</small>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-success" type="submit">Get New Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="/common/Loader.jsp" %>
        <%@include file="/common/Js.jsp" %>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Chờ cho DOM được tải hoàn toàn trước khi thêm các sự kiện nghe
                var forgetForm = document.getElementById("forgetForm");

                forgetForm.addEventListener("submit", function (event) {
                    // Hủy sự kiện mặc định để ngăn form submit
                    event.preventDefault();

                    // Gọi hàm kiểm tra validation
                    if (validateForm()) {
                        // Nếu hợp lệ, thực hiện submit form
                        forgetForm.submit();
                    }
                });

                function validateForm() {
                    var email = document.getElementById("email-for-pass").value;

                    // Thực hiện các kiểm tra validation ở đây
                    // Ví dụ: kiểm tra nếu một trường không được bỏ trống
                    if (email.trim() === "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Email cannot be blank !",
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
