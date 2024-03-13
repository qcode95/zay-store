<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
        <%@include file="/common/Header.jsp" %>
        <style>
            body {
                background-color: #fff
            }

            .height-100 {
                height: 100vh
            }

            .card {
                width: 400px;
                border: none;
                height: 400px;
                box-shadow: 0px 5px 20px 0px #d2dae3;
                z-index: 1;
                display: flex;
                justify-content: center;
                align-items: center
            }

            .card h6 {
                color: #000;
                font-size: 20px
            }

            .card-2 {
                background-color: #fff;
                padding: 10px;
                width: 350px;
                height: 100px;
                bottom: -50px;
                left: 20px;
                position: absolute;
                box-shadow: 0px 5px 20px 0px #d2dae3;
                border-radius: 5px
            }

            .card-2 .content {
                margin-top: 50px
            }

            .card-2 .content a {
                color: #4292dc
            }

            .form-control:focus {
                box-shadow: none;
                border: 2px solid #000
            }

            form .button{
                height: 45px;
                margin: 35px 0
            }
            form .button input{
                height: 100%;
                width: 100%;
                border-radius: 5px;
                border: none;
                color: #fff;
                font-size: 18px;
                font-weight: 500;
                letter-spacing: 1px;
                cursor: pointer;
                transition: all 0.3s ease;
                background: #dbcc8f;
            }
            form .button input:hover{
                background: #dbcc8f;
            }
        </style>
    </head>

    <%
        String email = (String) request.getAttribute("maskedEmail");
    %>

    <body>
        <div class="container height-100 d-flex justify-content-center align-items-center">
            <div class="position-relative">
                <div class="card p-2 text-center">

                    <br>
                    <a href="<%=request.getContextPath()%>/home" style="text-decoration: none; color: #000">
                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                    </a>
                    <h6>Please enter the temporary Password 
                        <br> 
                        to verify your account
                    </h6>
                    <div> 
                        <span>A temporary Password has been sent to 
                            <%=email%>
                        </span>
                        <%
                            String passWrong = (String) request.getAttribute("passWrong");
                            if (passWrong != null) {
                        %>
                        <div class="alert alert-danger text-center text-danger" role="alert">
                            <%=passWrong%>
                        </div>
                        <% }%>
                    </div>
                    <form action="./verify-temp-pass" method="post" id="verifyForm">
                        <div class="inputs d-flex flex-row justify-content-center mt-2"> 
                            <input class="m-2 text-center form-control rounded" id="password" type="password" name="temp-pass"/>
                        </div>
                        <div class="button">
                            <input type="submit" value="Verify">
                        </div>
                    </form>
                </div>
                <div class="card-2">
                    <div class="content d-flex justify-content-center align-items-center"> 
                        <span>Didn't get the Password?</span>
                        &nbsp;
                        <a href="#" class="text-decoration-none ms-3" style="color: #dbcc8f;">Resend(1/3)</a> 
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/common/Loader.jsp" %>            
        <%@include file="/common/Js.jsp" %>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Chờ cho DOM được tải hoàn toàn trước khi thêm các sự kiện nghe
                var verifyForm = document.getElementById("verifyForm");

                verifyForm.addEventListener("submit", function (event) {
                    // Hủy sự kiện mặc định để ngăn form submit
                    event.preventDefault();

                    // Gọi hàm kiểm tra validation
                    if (validateForm()) {
                        // Nếu hợp lệ, thực hiện submit form
                        verifyForm.submit();
                    }
                });

                function validateForm() {
                    var password = document.getElementById("password").value;

                    // Thực hiện các kiểm tra validation ở đây
                    // Ví dụ: kiểm tra nếu một trường không được bỏ trống
                    if (password.trim() === "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "All fields have to be filled!",
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
