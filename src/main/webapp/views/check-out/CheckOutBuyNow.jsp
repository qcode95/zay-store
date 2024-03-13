<%@page import="java.util.ArrayList"%>
<%@page import="com.fpt.prj301.service.CartService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Check Out Page</title>
        <%@include file="/common/Header.jsp" %>
    </head>

    <%
        User user = (User) session.getAttribute("account");
        if(user == null){
            response.sendRedirect("./login");
        }
        
        int productId = (int) request.getAttribute("productId");
        int total = (int) request.getAttribute("total");
        int size = (int) request.getAttribute("size");
        int quantity = (int) request.getAttribute("quantity");
    %>

    <body>

        <%@include file="/common/Navbar.jsp" %>
        
        <div class="hero-wrap hero-bread" style="background-image: url('${pageContext.request.contextPath}/assets/images/bg_6.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-0">
                                <a href="<%=request.getContextPath()%>/home">Home > </a></span> 
                            <span>Checkout</span></p>
                        <h1 class="mb-0 bread">Checkout</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10 ftco-animate">
                        <form action="./check-out-now?id=<%=productId%>" method="post" class="billing-form" id="billingForm">

                            <h3 class="mb-4 billing-heading">Billing Details</h3>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="first-name">First Name *</label>
                                        <input type="text" class="form-control" id="first-name" name="first-name" placeholder="First Name">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lastname">Last Name *</label>
                                        <input type="text" class="form-control" id="last-name" name="last-name" placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="country">Address *</label>
                                        <div style="display: flex; justify-content: space-between;">
                                            <select name="province" id="province" class="form-control col-xs-4" selected>
                                                <option value="">Choose Province</option>
                                            </select>
                                            &nbsp;
                                            <select name="district" id="district" class="form-control col-xs-4" selected>
                                                <option value="">Choose District</option>
                                            </select>
                                            &nbsp;
                                            <select name="ward" id="ward" class="form-control col-xs-4" selected>
                                                <option value="">Choose Ward/Commune</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="streetaddress">Street Address *</label>
                                        <input type="text" name="street" id="street" class="form-control" placeholder="House number and street name">
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="apartment">Apartment / Suite</label>
                                        <input type="text" name="apartment" id="apartment" class="form-control" placeholder="Appartment, suite, unit etc: (optional)">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="post-code">Postcode / ZIP *</label>
                                        <input type="text" name="post-code" id="post-code" class="form-control" placeholder="Postcode / ZIP">
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="phone">Phone *</label>
                                        <input type="text" name="phone" id="phone" class="form-control" placeholder="Phone">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="emailaddress">Email Address *</label>
                                        <input type="text" name="email" id="email" class="form-control" placeholder="Email Address">
                                    </div>
                                </div>

                                <input type="hidden" id="updated-total" name="total">

                            </div>
                            <!-- END -->

                            <div class="row mt-5 pt-3 d-flex">
                                <div class="col-md-6 d-flex">
                                    <div class="cart-detail cart-total bg-light p-3 p-md-4">
                                        <h3 class="billing-heading mb-4">Cart Total</h3>
                                        <p class="d-flex">
                                            <span>Subtotal</span>
                                            <span>$<%=total%> (Included VAT Tax)</span>
                                        </p>
                                        <p class="d-flex">
                                            <span>Delivery</span>
                                            <span>
                                                <select name="delivery" id="delivery" class="form-control" onchange="ChangeTotalDelivery()">
                                                    <option value="0">Delivery</option>
                                                    <option value="1">Standard Delivery - $5</option>
                                                    <option value="2">Fast Delivery - $10</option>
                                                </select>
                                            </span>
                                        </p>
                                        <p class="d-flex">
                                            <span>Discount</span>
                                            <span>
                                                <select name="code" id="gift-code" class="form-control" onchange="ChangeTotalDiscount()">
                                                    <option value="0">Discount</option>
                                                    <%
                                                        if(user.getDiscountId() == 2){
                                                    %>
                                                    <option value="1">ZayStore10</option>
                                                    <% } else { %>
                                                    <option value="0">No Discount</option>
                                                    <% } %>
                                                </select>
                                            </span>
                                        </p>

                                        <hr>
                                        <p class="d-flex total-price">
                                            <span>Total</span>
                                            <span id="total-display">$<%=total%></span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="cart-detail bg-light p-3 p-md-4">
                                        <h3 class="billing-heading mb-4">Payment Method</h3>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="optradio" class="mr-2"> Direct Bank Tranfer</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="optradio" class="mr-2"> Check Payment</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="optradio" class="mr-2"> Paypal</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="checkbox">
                                                    <label><input type="checkbox" id="term" value="" class="mr-2"> I have read and accept the terms and conditions</label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <input type="hidden" name="size" value="<%=size%>">
                                        <input type="hidden" name="quantity" value="<%=quantity%>">
                                        
                                        <p><button type="submit" class="btn btn-primary py-3 px-4">Place an order</button></p>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div> <!-- .col-md-8 -->
                </div>
            </div>
        </section> <!-- .section -->

        <%@include file="/common/Loader.jsp" %>
        <%@include file="/common/Footer.jsp" %>
        <%@include file="/common/Js.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js">
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Chờ cho DOM được tải hoàn toàn trước khi thêm các sự kiện nghe
                var billingForm = document.getElementById("billingForm");

                billingForm.addEventListener("submit", function (event) {
                    // Hủy sự kiện mặc định để ngăn form submit
                    event.preventDefault();

                    // Gọi hàm kiểm tra validation
                    if (validateForm()) {
                        // Nếu hợp lệ, thực hiện submit form
                        billingForm.submit();
                    }
                });

                function validateForm() {
                    var fName = document.getElementById("first-name").value;
                    var lName = document.getElementById("last-name").value;
                    var province = document.getElementById("province").value;
                    var street = document.getElementById("street").value;
                    var code = document.getElementById("post-code").value;
                    var phone = document.getElementById("phone").value;
                    var email = document.getElementById("email").value;
                    var checkbox = document.getElementById("term").checked;

                    // Thực hiện các kiểm tra validation ở đây
                    // kiểm tra nếu một trường không được bỏ trống
                    if (fName.trim() === "" || lName.trim() === "" ||
                            province.trim() === "" || street.trim() === "" ||
                            code.trim() === "" || phone.trim() === "" || email.trim() === "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "All fields have to be filled!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Kiểm tra định dạng email
                    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
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

                    // Nếu tất cả kiểm tra đều hợp lệ, trả về true
                    return true;
                }
            });
        </script>
        <script>
            function ChangeTotalDelivery() {
                var delivery = document.getElementById('delivery').value;
                var total = <%=total%>;
                switch (parseInt(delivery)) {
                    case 1:
                        total += 5;
                        break;
                    case 2:
                        total += 10;
                        break;
                    default:
                        total += 0;
                        break;
                }
                document.getElementById('updated-total').value = total;
                document.getElementById('total-display').innerText = '$' + total;
            }
            function ChangeTotalDiscount(){
                var code = document.getElementById('gift-code').value;
                var totalUpdated = document.getElementById('updated-total').value;
                var total = totalUpdated;
                switch (parseInt(code)) {
                    case 1:
                        total -= 10;
                        break;
                    default:
                        total -= 0;
                        break;
                }
                document.getElementById('updated-total').value = total;
                document.getElementById('total-display').innerText = '$' + total;
            }
        </script>        
        <script>
            const host = "https://provinces.open-api.vn/api/";
            var callAPI = (api) => {
                return axios.get(api)
                        .then((response) => {
                            renderData(response.data, "province");
                        });
            };
            callAPI('https://provinces.open-api.vn/api/?depth=1');
            var callApiDistrict = (api) => {
                return axios.get(api)
                        .then((response) => {
                            renderData(response.data.districts, "district");
                        });
            };
            var callApiWard = (api) => {
                return axios.get(api)
                        .then((response) => {
                            renderData(response.data.wards, "ward");
                        });
            };

            var renderData = (array, selectTag) => {
                let row = '<option disable value="">Choose...</option>';
                if (array) {
                    array.forEach((element) => {
                        row += '<option data-id="' + element.code + '" value="' + element.name + '">' + element.name + '</option>';
                    });
                }
                document.querySelector('#' + selectTag).innerHTML = row;
            };

            $("#province").change(() => {
                callApiDistrict(host + "p/" + $("#province").find(':selected').data('id') + "?depth=2");
            });
            $("#district").change(() => {
                callApiWard(host + "d/" + $("#district").find(':selected').data('id') + "?depth=2");
            });
            $("#ward").change(() => {

            });
        </script>
    </body>
</html>
