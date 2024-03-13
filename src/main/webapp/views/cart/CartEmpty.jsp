<%@page import="com.fpt.prj301.service.ProductSizeService"%>
<%@page import="com.fpt.prj301.model.ProductSize"%>
<%@page import="com.fpt.prj301.service.CartService"%>
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

        <br><br>
        <div class="col-sm-12 empty-cart-cls text-center">
            <img src="<%=request.getContextPath()%>/assets/images/shopping_cart_1.png" 
                 width="250" height="250" class="img-fluid" style="margin-right: 50px">
            <h3><strong>Your Cart is Empty</strong></h3>
            <h4>Add something to make me happy
                <i class="material-icons">insert_emoticon</i>
            </h4>
            <a href="<%=request.getContextPath()%>/shop?page=1" class="btn btn-primary cart-btn-transform m-3" data-abc="true">CONTINUE SHOPPING</a>
        </div>
        <br><br><br><br><br>

        <%@include file="/common/Loader.jsp" %>
        <%@include file="/common/Footer.jsp" %>
        <%@include file="/common/Js.jsp" %>

    </body>
</html>
