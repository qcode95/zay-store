<%@page import="com.fpt.prj301.service.impl.CartServiceImpl"%>
<%@page import="com.fpt.prj301.service.ProductSizeService"%>
<%@page import="com.fpt.prj301.model.ProductSize"%>
<%@page import="com.fpt.prj301.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cart Page</title>
        <%@include file="/common/Header.jsp" %>
    </head>

    <%
        User auth = (User) session.getAttribute("account");
        if (auth != null) {
            request.setAttribute("userAuth", auth);
        }
        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
        List<Cart> cartProducts = null;
        int total = 0;
        CartServiceImpl cartService = new CartServiceImpl();
        if (cartList != null) {
            cartProducts = cartService.GetCartProducts(cartList);
            total = cartService.GetTotalCartPrice(cartList);
            request.setAttribute("cartList", cartList);
        }
        request.setAttribute("total", total);
    %>

    <body>

        <%@include file="/common/Navbar.jsp" %>

        <div class="hero-wrap hero-bread" style="background-image: url('${pageContext.request.contextPath}/assets/images/bg_6.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-0">
                                <a href="<%=request.getContextPath()%>/home">Home > </a></span> 
                            <span>Cart</span></p>
                        <h1 class="mb-0 bread">My Cart</h1>
                    </div>
                </div>
            </div>
        </div>

        <%
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
        %>
        <div class="alert alert-danger text-center text-danger" role="alert">
            <%=msg%>
        </div>
        <% }%>
        <section class="ftco-section ftco-cart">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div class="cart-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th>Product</th>
                                        <th>Size</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Cart c : cartProducts) {
                                    %>
                                    <tr class="text-center">
                                        <td class="product-remove"><a href="<%=request.getContextPath()%>/remove-from-cart?id=<%=c.getId()%>"><span class="ion-ios-close"></span></a></td>

                                        <td class="image-prod"><div class="img" style="background-image:url(./<%=c.getImage()%>);"></div></td>

                                        <td class="product-name">
                                            <h3><%=c.getName()%></h3>
                                            <p><%=c.getDescription()%></p>
                                        </td>

                                        <td class="size">
                                            <select id="size_<%=c.getId()%>" name="size" class="form-control" style="margin-bottom: 15px">
                                                <option value="39" <%= c.getSize() == 39 ? "selected=\"true\"" : ""%>>Size 39</option>
                                                <option value="40" <%= c.getSize() == 40 ? "selected=\"true\"" : ""%>>Size 40</option>
                                                <option value="41" <%= c.getSize() == 41 ? "selected=\"true\"" : ""%>>Size 41</option>
                                                <option value="42" <%= c.getSize() == 42 ? "selected=\"true\"" : ""%>>Size 42</option>
                                                <option value="43" <%= c.getSize() == 43 ? "selected=\"true\"" : ""%>>Size 43</option>
                                            </select>
                                        </td>

                                        <td class="quantity">
                                            <div class="input-group mb-3">
                                                <span><a class="btn bnt-sm btn-incre" href="<%=request.getContextPath()%>/quan-inc-dec?action=dec&id=<%=c.getId()%>">
                                                        <i class="fa fa-minus-square" style="margin-top: 15px"></i>
                                                    </a>
                                                </span>
                                                <input type="text" name="quantity" value="<%=c.getQuantity()%>" class="quantity form-control input-number">
                                                <span><a class="btn bnt-sm btn-incre" href="<%=request.getContextPath()%>/quan-inc-dec?action=inc&id=<%=c.getId()%>">
                                                        <i class="fa fa-plus-square" style="margin-top: 15px"></i>
                                                    </a>
                                                </span>
                                            </div>
                                        </td>

                                        <td class="price">$<%=c.getPrice()%></td>
                                    </tr>
                                    <!-- END TR-->
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-start">
                    <div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
                        <div class="cart-total mb-3">
                            <h3>Cart Totals</h3>
                            <p class="d-flex">
                                <span>Subtotal</span>
                                <span>$<%=total%></span>
                            </p>
                            <p class="d-flex">
                                <span>VAT Tax</span>
                                <span>$5</span>
                            </p>
                            <hr>
                            <p class="d-flex total-price">
                                <span>Total</span>
                                <span>$<%=total + 5%></span>
                            </p>

                        </div>
                        <p class="text-center"><a href="javascript:void(0);" onclick="proceedToCheckout(<%=total + 5%>)" class="btn btn-primary py-3 px-4 text-bg-light">Proceed to Checkout</a></p>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="/common/Loader.jsp" %>
        <%@include file="/common/Footer.jsp" %>
        <%@include file="/common/Js.jsp" %>

        <script>
            function proceedToCheckout(total) {
                var sizes = [];
            <% for (Cart c : cartProducts) { %>
                var size = document.getElementById("size_<%=c.getId()%>").value;
                sizes.push(size);
            <%
                }
            %>
                var url = "<%=request.getContextPath()%>/check-out?total=" + total + "&sizes=" + sizes.join(',');
                window.location.href = url;
            }
        </script>

    </body>
</html>
