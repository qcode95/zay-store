<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>New Password Page</title>
        <%@include file="/common/Header.jsp" %>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fonts/iconic/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/vendor/animsition/css/animsition.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/vendor/select2/select2.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/vendor/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/custom-css/util.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/custom-css/main.css">
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                    <form class="login100-form validate-form" action="<%=request.getContextPath()%>/new-password" method="post" id="newPForm">
                        <a href="<%=request.getContextPath()%>/home" style="text-decoration: none; color: #000">
                            <i class="fa fa-arrow-left" aria-hidden="true"></i>
                        </a>
                        <span class="login100-form-title p-b-49">
                            New Password
                        </span>
                        <%
                            String successMsg = (String) request.getAttribute("successMsg");
                            if (successMsg != null) {
                        %>
                        <div class="alert alert-success text-center text-success" role="alert">
                            <%=successMsg%>
                        </div>
                        <% }%>                        

                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <span class="label-input100">Password</span>
                            <input class="input100" id="password" type="password" name="password" placeholder="Password">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>
                        <br>
                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <span class="label-input100">Confirm Password</span>
                            <input class="input100" id="confirm" type="password" name="confirm-password" placeholder="Repeat Password">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>

                        <div class="p-t-8 p-b-31">
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn" style="background: #dbcc8f;">
                                    Change Password
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="/common/Loader.jsp" %>
        <%@include file="/common/Js.jsp" %>
        <script src="<%=request.getContextPath()%>/assets/vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/vendor/animsition/js/animsition.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/vendor/bootstrap/js/popper.js"></script>
        <script src="<%=request.getContextPath()%>/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/vendor/select2/select2.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/vendor/daterangepicker/moment.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/vendor/daterangepicker/daterangepicker.js"></script>
        <script src="<%=request.getContextPath()%>/assets/vendor/countdowntime/countdowntime.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Chờ cho DOM được tải hoàn toàn trước khi thêm các sự kiện nghe
                var newPForm = document.getElementById("newPForm");

                newPForm.addEventListener("submit", function (event) {
                    // Hủy sự kiện mặc định để ngăn form submit
                    event.preventDefault();

                    // Gọi hàm kiểm tra validation
                    if (validateForm()) {
                        // Nếu hợp lệ, thực hiện submit form
                        newPForm.submit();
                    }
                });

                function validateForm() {
                    var password = document.getElementById("password").value;
                    var confPassword = document.getElementById("confirm").value;


                    // Thực hiện các kiểm tra validation ở đây
                    // Ví dụ: kiểm tra nếu một trường không được bỏ trống
                    if (password.trim() === "" || confPassword.trim() === "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "All fields have to be filled!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Kiểm tra mật khẩu có khớp không
                    if (password !== confPassword) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Passwords do not match!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }
                    
                    // Kiểm tra độ dài mật khẩu
                    if (password.length <= 8) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Passwords need at least 8 charactors !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (password.length >= 24) {
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

                    if (!upperRegex.test(password)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 uppercase character !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (!lowerRegex.test(password)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 lower character !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (!numberRegex.test(password)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 numberic character !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (!specialRegex.test(password)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 special character !",
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
