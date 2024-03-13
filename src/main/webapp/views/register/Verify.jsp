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

            .inputs input {
                width: 40px;
                height: 40px
            }

            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                margin: 0
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
                color: #6dabe4;
            }

            .form-control:focus {
                box-shadow: none;
                border: 2px solid #000
            }

            .validate {
                border-radius: 20px;
                height: 40px;
                background-color: red;
                border: 1px solid red;
                width: 140px
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

    <body>
        <div class="container height-100 d-flex justify-content-center align-items-center">
            <div class="position-relative">
                <div class="card p-2 text-center">

                    <br>
                    <a href="<%=request.getContextPath()%>/home" class="justify-content-start" style="text-decoration: none; color: #000">
                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                    </a>
                    <h6>Please enter the OTP 
                        <br> 
                        to verify your account
                    </h6>
                    <div> 
                        <span>An OTP has been sent to your mail</span>
                        <%
                            String OTPWrong = (String) request.getAttribute("OTPWrong");
                            if (OTPWrong != null) {
                        %>
                        <div class="alert alert-danger text-center text-danger" role="alert">
                            <%=OTPWrong%>
                        </div>
                        <% }%>
                    </div>
                    <form action="./verify" method="post">
                        <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> 
                            <input class="m-2 text-center form-control rounded" type="text" id="first" name="first" minlength="1"/>
                            <input class="m-2 text-center form-control rounded" type="text" id="second" name="second" minlength="1"/>
                            <input class="m-2 text-center form-control rounded" type="text" id="third" name="third" minlength="1"/>
                            <input class="m-2 text-center form-control rounded" type="text" id="fourth" name="fourth" minlength="1"/>
                            <input class="m-2 text-center form-control rounded" type="text" id="fifth" name="fifth" minlength="1"/>
                            <input class="m-2 text-center form-control rounded" type="text" id="sixth" name="sixth" minlength="1"/>
                        </div>
                        <div class="button">
                            <input type="submit" value="Verify">
                        </div>
                    </form>
                </div>
                <div class="card-2">
                    <div class="content d-flex justify-content-center align-items-center"> 
                        <span>Didn't get the code?</span>
                        &nbsp;
                        <a href="#" class="text-decoration-none ms-3" style="color: #dbcc8f;">Resend(1/3)</a> 
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/common/Loader.jsp" %>            
        <%@include file="/common/Js.jsp" %>
    </body>
</html>
