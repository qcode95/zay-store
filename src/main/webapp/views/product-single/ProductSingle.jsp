<%@page import="com.fpt.prj301.service.impl.UserServiceImpl"%>
<%@page import="com.fpt.prj301.model.Review"%>
<%@page import="com.fpt.prj301.model.ProductSize"%>
<%@page import="java.util.List"%>
<%@page import="com.fpt.prj301.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Product-Single Page</title>
        <%@include file="/common/Header.jsp" %>
        <style>
            button {
                border: 1px solid rgba(255, 255, 255, 0.4);
                -webkit-border-radius: 30px;
                -moz-border-radius: 30px;
                -ms-border-radius: 30px;
                border-radius: 30px;
            }
            button:hover, button:focus{
                background: #fff !important;
                color: #000000;
            }
            #commentForm {
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.5s ease-out;
            }
            #commentForm.show {
                max-height: 500px;
                transition: max-height 0.5s ease-in;
            }
        </style>
    </head>
    <%
        UserServiceImpl us = new UserServiceImpl();

        Product product = (Product) request.getAttribute("product");
        List<ProductSize> list = (List<ProductSize>) request.getAttribute("list");
        List<Review> listR = (List<Review>) request.getAttribute("listR");
        int count = (int) request.getAttribute("count");
        int count5 = (int) request.getAttribute("count5");
        int count4 = (int) request.getAttribute("count4");
        int count3 = (int) request.getAttribute("count3");
        int count2 = (int) request.getAttribute("count2");
        int count1 = (int) request.getAttribute("count1");
    %>
    <body>

        <%@include file="/common/Navbar.jsp" %>

        <div class="hero-wrap hero-bread" style="background-image: url('${pageContext.request.contextPath}/assets/images/bg_6.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-0">
                                <a href="<%=request.getContextPath()%>/home">Home > </a></span>
                            <span>Shop</span>
                        </p>
                        <h1 class="bread">Shop</h1>
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
        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mb-5 ftco-animate">
                        <a href=".<%=product.getImage()%>" class="image-popup prod-img-bg">
                            <img src=".<%=product.getImage()%>" 
                                 class="img-fluid" alt="Product's Image"></a>
                    </div>
                    <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                        <h3><%=product.getName()%></h3>
                        <div class="rating d-flex">
                            <p class="text-left mr-4">
                                <a href="#" class="mr-2"><%=product.getRating()%>.0</a>
                                <%
                                    for (int i = 1; i <= product.getRating(); i++) {
                                %>
                                <a href="#"><span class="ion-ios-star"></span></a>
                                    <% } %>
                                    <%
                                        for (int i = 1; i <= 5 - product.getRating(); i++) {
                                    %>
                                <a href="#"><span class="ion-ios-star-outline"></span></a>
                                    <% }%>
                            </p>
                            <p class="text-left mr-4">
                                <a href="#" class="mr-2" style="color: #bbb;"><%=count%> <span style="color: #bbb;">Reviews</span></a>
                            </p>
                        </div>
                        <p class="price"><span>$<%=product.getPrice()%></span></p>
                        <p><%=product.getDescription()%></p>

                        <form action="./buy-now?id=<%=product.getId()%>" method="post" id="buyForm">
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group d-flex">
                                        <div class="select-wrap">
                                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                            <select name="size" class="form-control">
                                                <%
                                                    for (ProductSize size : list) {
                                                %>
                                                <option value="<%=size.getSize()%>">Size <%=size.getSize()%></option>
                                                <% }%>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <input value="<%=product.getPrice()%>" name="price" hidden>

                                <div class="w-100"></div>
                                <div class="input-group col-md-6 d-flex mb-3">
                                    <span class="input-group-btn mr-2">
                                        <button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
                                            <i class="ion-ios-remove"></i>
                                        </button>
                                    </span>
                                    <input type="text" id="quantity" name="quantity" value="1"
                                           class="quantity form-control input-number" min="1" max="100" readonly/>
                                    <span class="input-group-btn ml-2">
                                        <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                            <i class="ion-ios-add"></i>
                                        </button>
                                    </span>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <p style="color: #000;"><%=product.getQuantity()%> piece available</p>
                                </div>
                            </div>
                            <p>
                                <a href="javascript:{}" class="btn btn-black py-3 px-5 mr-2" onclick="addToCartSingle()">Add to Cart</a>
                                <a href="javascript:{}" class="btn btn-primary py-3 px-5" 
                                   onclick="document.getElementById('buyForm').submit();">Buy now</a>
                            </p>
                        </form>
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col-md-12 nav-link-wrap">
                        <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Description</a>

                            <a class="nav-link ftco-animate mr-lg-1" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Features</a>

                            <a class="nav-link ftco-animate" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Reviews</a>

                        </div>
                    </div>

                    <div class="col-md-12 tab-wrap">

                        <div class="tab-content bg-light" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                                <div class="p-4">
                                    <h3 class="mb-4"><%=product.getName()%></h3>
                                    <p><%=product.getDescription()%></p>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
                                <div class="p-4">
                                    <h3 class="mb-4">Features</h3>
                                    <ul class="sherah-features-list" style="list-style: none">
                                        <li>
                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11">
                                            <g id="Group_1022" data-name="Group 1022" transform="translate(-165.75 -19.435)">
                                            <path id="Path_550" data-name="Path 550" d="M165.75,24.587c.03-.212.052-.424.091-.634a5.39,5.39,0,0,1,7.9-3.832c.034.018.067.039.112.065l-.594,1.028a4.214,4.214,0,0,0-4.085-.04,4.027,4.027,0,0,0-2.048,2.56,4.254,4.254,0,0,0,3.005,5.353,4.023,4.023,0,0,0,3.607-.767,4.223,4.223,0,0,0,1.622-3.369h1.212c-.03.3-.042.6-.09.892a5.39,5.39,0,0,1-1.64,3.124,5.363,5.363,0,0,1-7.062.271,5.344,5.344,0,0,1-1.932-3.29c-.039-.214-.062-.43-.092-.646Z"/>
                                            <path id="Path_551" data-name="Path 551" d="M271.957,39.458a1.187,1.187,0,0,0-.106.085l-5.782,5.782a1.168,1.168,0,0,0-.08.1L263,42.428l.807-.8,2.126,2.127,5.18-5.18.848.857Z" transform="translate(-94.207 -18.545)"/>
                                            </g>
                                            </svg>
                                            &nbsp;
                                            Fiber or filament: type, size, length
                                        </li>
                                        <li>
                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11">
                                            <g id="Group_1022" data-name="Group 1022" transform="translate(-165.75 -19.435)">
                                            <path id="Path_550" data-name="Path 550" d="M165.75,24.587c.03-.212.052-.424.091-.634a5.39,5.39,0,0,1,7.9-3.832c.034.018.067.039.112.065l-.594,1.028a4.214,4.214,0,0,0-4.085-.04,4.027,4.027,0,0,0-2.048,2.56,4.254,4.254,0,0,0,3.005,5.353,4.023,4.023,0,0,0,3.607-.767,4.223,4.223,0,0,0,1.622-3.369h1.212c-.03.3-.042.6-.09.892a5.39,5.39,0,0,1-1.64,3.124,5.363,5.363,0,0,1-7.062.271,5.344,5.344,0,0,1-1.932-3.29c-.039-.214-.062-.43-.092-.646Z"/>
                                            <path id="Path_551" data-name="Path 551" d="M271.957,39.458a1.187,1.187,0,0,0-.106.085l-5.782,5.782a1.168,1.168,0,0,0-.08.1L263,42.428l.807-.8,2.126,2.127,5.18-5.18.848.857Z" transform="translate(-94.207 -18.545)"/>
                                            </g>
                                            </svg>
                                            &nbsp;
                                            Yarn: diameter, twist, weight or size, count, fiber content for mixed yarns, ply.
                                        </li>
                                        <li>
                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11">
                                            <g id="Group_1022" data-name="Group 1022" transform="translate(-165.75 -19.435)">
                                            <path id="Path_550" data-name="Path 550" d="M165.75,24.587c.03-.212.052-.424.091-.634a5.39,5.39,0,0,1,7.9-3.832c.034.018.067.039.112.065l-.594,1.028a4.214,4.214,0,0,0-4.085-.04,4.027,4.027,0,0,0-2.048,2.56,4.254,4.254,0,0,0,3.005,5.353,4.023,4.023,0,0,0,3.607-.767,4.223,4.223,0,0,0,1.622-3.369h1.212c-.03.3-.042.6-.09.892a5.39,5.39,0,0,1-1.64,3.124,5.363,5.363,0,0,1-7.062.271,5.344,5.344,0,0,1-1.932-3.29c-.039-.214-.062-.43-.092-.646Z"/>
                                            <path id="Path_551" data-name="Path 551" d="M271.957,39.458a1.187,1.187,0,0,0-.106.085l-5.782,5.782a1.168,1.168,0,0,0-.08.1L263,42.428l.807-.8,2.126,2.127,5.18-5.18.848.857Z" transform="translate(-94.207 -18.545)"/>
                                            </g>
                                            </svg>
                                            &nbsp;
                                            Weight: ounces per squared or yards per pound.
                                        </li>
                                        <li>
                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11">
                                            <g id="Group_1022" data-name="Group 1022" transform="translate(-165.75 -19.435)">
                                            <path id="Path_550" data-name="Path 550" d="M165.75,24.587c.03-.212.052-.424.091-.634a5.39,5.39,0,0,1,7.9-3.832c.034.018.067.039.112.065l-.594,1.028a4.214,4.214,0,0,0-4.085-.04,4.027,4.027,0,0,0-2.048,2.56,4.254,4.254,0,0,0,3.005,5.353,4.023,4.023,0,0,0,3.607-.767,4.223,4.223,0,0,0,1.622-3.369h1.212c-.03.3-.042.6-.09.892a5.39,5.39,0,0,1-1.64,3.124,5.363,5.363,0,0,1-7.062.271,5.344,5.344,0,0,1-1.932-3.29c-.039-.214-.062-.43-.092-.646Z"/>
                                            <path id="Path_551" data-name="Path 551" d="M271.957,39.458a1.187,1.187,0,0,0-.106.085l-5.782,5.782a1.168,1.168,0,0,0-.08.1L263,42.428l.807-.8,2.126,2.127,5.18-5.18.848.857Z" transform="translate(-94.207 -18.545)"/>
                                            </g>
                                            </svg>
                                            &nbsp;
                                            Thickness: vertical depth.
                                        </li>
                                        <li>
                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11">
                                            <g id="Group_1022" data-name="Group 1022" transform="translate(-165.75 -19.435)">
                                            <path id="Path_550" data-name="Path 550" d="M165.75,24.587c.03-.212.052-.424.091-.634a5.39,5.39,0,0,1,7.9-3.832c.034.018.067.039.112.065l-.594,1.028a4.214,4.214,0,0,0-4.085-.04,4.027,4.027,0,0,0-2.048,2.56,4.254,4.254,0,0,0,3.005,5.353,4.023,4.023,0,0,0,3.607-.767,4.223,4.223,0,0,0,1.622-3.369h1.212c-.03.3-.042.6-.09.892a5.39,5.39,0,0,1-1.64,3.124,5.363,5.363,0,0,1-7.062.271,5.344,5.344,0,0,1-1.932-3.29c-.039-.214-.062-.43-.092-.646Z"/>
                                            <path id="Path_551" data-name="Path 551" d="M271.957,39.458a1.187,1.187,0,0,0-.106.085l-5.782,5.782a1.168,1.168,0,0,0-.08.1L263,42.428l.807-.8,2.126,2.127,5.18-5.18.848.857Z" transform="translate(-94.207 -18.545)"/>
                                            </g>
                                            </svg>
                                            &nbsp;
                                            Fabric structure
                                        </li>
                                        <li>
                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11">
                                            <g id="Group_1022" data-name="Group 1022" transform="translate(-165.75 -19.435)">
                                            <path id="Path_550" data-name="Path 550" d="M165.75,24.587c.03-.212.052-.424.091-.634a5.39,5.39,0,0,1,7.9-3.832c.034.018.067.039.112.065l-.594,1.028a4.214,4.214,0,0,0-4.085-.04,4.027,4.027,0,0,0-2.048,2.56,4.254,4.254,0,0,0,3.005,5.353,4.023,4.023,0,0,0,3.607-.767,4.223,4.223,0,0,0,1.622-3.369h1.212c-.03.3-.042.6-.09.892a5.39,5.39,0,0,1-1.64,3.124,5.363,5.363,0,0,1-7.062.271,5.344,5.344,0,0,1-1.932-3.29c-.039-.214-.062-.43-.092-.646Z"/>
                                            <path id="Path_551" data-name="Path 551" d="M271.957,39.458a1.187,1.187,0,0,0-.106.085l-5.782,5.782a1.168,1.168,0,0,0-.08.1L263,42.428l.807-.8,2.126,2.127,5.18-5.18.848.857Z" transform="translate(-94.207 -18.545)"/>
                                            </g>
                                            </svg>
                                            &nbsp;
                                            Woven fabrics: weave type, warp and filling yarn count per linear inch
                                        </li>
                                        <li>
                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11">
                                            <g id="Group_1022" data-name="Group 1022" transform="translate(-165.75 -19.435)">
                                            <path id="Path_550" data-name="Path 550" d="M165.75,24.587c.03-.212.052-.424.091-.634a5.39,5.39,0,0,1,7.9-3.832c.034.018.067.039.112.065l-.594,1.028a4.214,4.214,0,0,0-4.085-.04,4.027,4.027,0,0,0-2.048,2.56,4.254,4.254,0,0,0,3.005,5.353,4.023,4.023,0,0,0,3.607-.767,4.223,4.223,0,0,0,1.622-3.369h1.212c-.03.3-.042.6-.09.892a5.39,5.39,0,0,1-1.64,3.124,5.363,5.363,0,0,1-7.062.271,5.344,5.344,0,0,1-1.932-3.29c-.039-.214-.062-.43-.092-.646Z"/>
                                            <path id="Path_551" data-name="Path 551" d="M271.957,39.458a1.187,1.187,0,0,0-.106.085l-5.782,5.782a1.168,1.168,0,0,0-.08.1L263,42.428l.807-.8,2.126,2.127,5.18-5.18.848.857Z" transform="translate(-94.207 -18.545)"/>
                                            </g>
                                            </svg>
                                            &nbsp;
                                            Knitted fabric: knit type, wale and course count per inch
                                        </li>
                                        <li>
                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11">
                                            <g id="Group_1022" data-name="Group 1022" transform="translate(-165.75 -19.435)">
                                            <path id="Path_550" data-name="Path 550" d="M165.75,24.587c.03-.212.052-.424.091-.634a5.39,5.39,0,0,1,7.9-3.832c.034.018.067.039.112.065l-.594,1.028a4.214,4.214,0,0,0-4.085-.04,4.027,4.027,0,0,0-2.048,2.56,4.254,4.254,0,0,0,3.005,5.353,4.023,4.023,0,0,0,3.607-.767,4.223,4.223,0,0,0,1.622-3.369h1.212c-.03.3-.042.6-.09.892a5.39,5.39,0,0,1-1.64,3.124,5.363,5.363,0,0,1-7.062.271,5.344,5.344,0,0,1-1.932-3.29c-.039-.214-.062-.43-.092-.646Z"/>
                                            <path id="Path_551" data-name="Path 551" d="M271.957,39.458a1.187,1.187,0,0,0-.106.085l-5.782,5.782a1.168,1.168,0,0,0-.08.1L263,42.428l.807-.8,2.126,2.127,5.18-5.18.848.857Z" transform="translate(-94.207 -18.545)"/>
                                            </g>
                                            </svg>
                                            &nbsp;
                                            Finishes: chemicals such as resins, starches, waxes and mechanical effects such as
                                        </li>
                                        <li>
                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11">
                                            <g id="Group_1022" data-name="Group 1022" transform="translate(-165.75 -19.435)">
                                            <path id="Path_550" data-name="Path 550" d="M165.75,24.587c.03-.212.052-.424.091-.634a5.39,5.39,0,0,1,7.9-3.832c.034.018.067.039.112.065l-.594,1.028a4.214,4.214,0,0,0-4.085-.04,4.027,4.027,0,0,0-2.048,2.56,4.254,4.254,0,0,0,3.005,5.353,4.023,4.023,0,0,0,3.607-.767,4.223,4.223,0,0,0,1.622-3.369h1.212c-.03.3-.042.6-.09.892a5.39,5.39,0,0,1-1.64,3.124,5.363,5.363,0,0,1-7.062.271,5.344,5.344,0,0,1-1.932-3.29c-.039-.214-.062-.43-.092-.646Z"/>
                                            <path id="Path_551" data-name="Path 551" d="M271.957,39.458a1.187,1.187,0,0,0-.106.085l-5.782,5.782a1.168,1.168,0,0,0-.08.1L263,42.428l.807-.8,2.126,2.127,5.18-5.18.848.857Z" transform="translate(-94.207 -18.545)"/>
                                            </g>
                                            </svg>
                                            &nbsp;
                                            Calendaring and napping applied to the woven fabric to yield or enhance style, durability, and utility values.
                                        </li>
                                        <li>
                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11">
                                            <g id="Group_1022" data-name="Group 1022" transform="translate(-165.75 -19.435)">
                                            <path id="Path_550" data-name="Path 550" d="M165.75,24.587c.03-.212.052-.424.091-.634a5.39,5.39,0,0,1,7.9-3.832c.034.018.067.039.112.065l-.594,1.028a4.214,4.214,0,0,0-4.085-.04,4.027,4.027,0,0,0-2.048,2.56,4.254,4.254,0,0,0,3.005,5.353,4.023,4.023,0,0,0,3.607-.767,4.223,4.223,0,0,0,1.622-3.369h1.212c-.03.3-.042.6-.09.892a5.39,5.39,0,0,1-1.64,3.124,5.363,5.363,0,0,1-7.062.271,5.344,5.344,0,0,1-1.932-3.29c-.039-.214-.062-.43-.092-.646Z"/>
                                            <path id="Path_551" data-name="Path 551" d="M271.957,39.458a1.187,1.187,0,0,0-.106.085l-5.782,5.782a1.168,1.168,0,0,0-.08.1L263,42.428l.807-.8,2.126,2.127,5.18-5.18.848.857Z" transform="translate(-94.207 -18.545)"/>
                                            </g>
                                            </svg>
                                            &nbsp;
                                            Fabric width: The length of the filling or course
                                        </li>
                                    </ul>
                                </div>
                            </div>                            
                            <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-day-3-tab">
                                <div class="row p-4">
                                    <div class="col-md-7">
                                        <h3 class="mb-4"><%=count%> Reviews</h3>
                                        <%
                                            for (Review review : listR) {
                                        %>
                                        <div class="review">
                                            <div class="user-img" style="background-image: url(.<%=us.GetAvatarById(review.getUid())%>)"></div>
                                            <div class="desc">
                                                <h4>
                                                    <span class="text-left"><%=us.GetNameById(review.getUid())%></span>
                                                </h4>
                                                <p class="star">
                                                    <span>
                                                        <%
                                                            for (int i = 1; i <= review.getRating(); i++) {
                                                        %>
                                                        <i class="ion-ios-star"></i>
                                                        <% } %>
                                                        <%
                                                            for (int i = 1; i <= 5 - review.getRating(); i++) {
                                                        %>
                                                        <i class="ion-ios-star-outline"></i>
                                                        <% }%>
                                                    </span>
                                                    <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
                                                </p>
                                                <p><%=review.getComment()%></p>
                                            </div>
                                        </div>
                                        <% }%>    
                                        <div>
                                            <a href="#" class="btn btn-primary py-3 px-5" onclick="toggleCommentForm(event)">Comment</a>
                                        </div>
                                        <br>
                                        <!-- Form Comment -->
                                        <div id="commentForm">
                                            <form action="<%=request.getContextPath()%>/comment?id=<%=product.getId()%>" method="post">
                                                <input name="comment" class="tinymce">
                                                <br>
                                                <div style="font-size: 1.2rem">
                                                    <input type="hidden" id="updated_rating" name="rating">
                                                    <a href="#" class="starR" data-value="1"><span class="ion-ios-star-outline"></span></a>
                                                    <a href="#" class="starR" data-value="2"><span class="ion-ios-star-outline"></span></a>
                                                    <a href="#" class="starR" data-value="3"><span class="ion-ios-star-outline"></span></a>
                                                    <a href="#" class="starR" data-value="4"><span class="ion-ios-star-outline"></span></a>
                                                    <a href="#" class="starR" data-value="5"><span class="ion-ios-star-outline"></span></a>
                                                </div>
                                                <br>
                                                <input type="submit" class="btn btn-primary py-3 px-5" value="Save">
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="rating-wrap">
                                            <h3 class="mb-4">Give a Review</h3>
                                            <p class="star">
                                                <span>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star"></i>
                                                </span>
                                                <span><%=count5%> Reviews</span>
                                            </p>
                                            <p class="star">
                                                <span>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star-outline"></i>
                                                </span>
                                                <span><%=count4%> Reviews</span>
                                            </p>
                                            <p class="star">
                                                <span>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star-outline"></i>
                                                    <i class="ion-ios-star-outline"></i>
                                                </span>
                                                <span><%=count3%> Reviews</span>
                                            </p>
                                            <p class="star">
                                                <span>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star-outline"></i>
                                                    <i class="ion-ios-star-outline"></i>
                                                    <i class="ion-ios-star-outline"></i>
                                                </span>
                                                <span><%=count2%> Reviews</span>
                                            </p>
                                            <p class="star">
                                                <span>
                                                    <i class="ion-ios-star"></i>
                                                    <i class="ion-ios-star-outline"></i>
                                                    <i class="ion-ios-star-outline"></i>
                                                    <i class="ion-ios-star-outline"></i>
                                                    <i class="ion-ios-star-outline"></i>
                                                </span>
                                                <span><%=count1%> Reviews</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="/common/Loader.jsp" %>
        <%@include file="/common/Footer.jsp" %>
        <%@include file="/common/Js.jsp" %>
        <script>
            $(document).ready(function () {
                var quantitiyValue = document.getElementById('quantity').value;
                var pQuantity = <%=product.getQuantity()%>
                $(".quantity-right-plus").click(function (e) {
                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($("#quantity").val());

                    // If is not undefined
                    if (quantity < pQuantity) {
                        $("#quantity").val(quantity + 1);
                        quantitiyValue + 1;
                    }
                    // Increment
                });

                $(".quantity-left-minus").click(function (e) {
                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($("#quantity").val());

                    // If is not undefined

                    // Decrement
                    if (quantity > 1) {
                        $("#quantity").val(quantity - 1);
                        quantitiyValue - 1;
                    }
                });
            });
        </script>
        <script>
            function addToCartSingle() {
                var size = document.getElementById('buyForm').elements['size'].value;
                var quantity = document.getElementById('quantity').value;
                window.location.href = "<%=request.getContextPath()%>/add-to-cart-single?id=<%=product.getId()%>&size=" + size + "&quantity=" + quantity;
            }
        </script>
        <script>
            function toggleCommentForm(event) {
                var commentForm = document.getElementById('commentForm');

                event.preventDefault();

                if (commentForm.classList.contains('show')) {
                    commentForm.style.maxHeight = commentForm.scrollHeight + "px";
                    setTimeout(function () {
                        commentForm.classList.remove('show');
                        commentForm.style.maxHeight = null;
                    }, 1);
                } else {
                    commentForm.classList.add('show');
                }
            }
        </script>
        <script>
            tinymce.init({
                selector: '.tinymce',
                width: 600,
                height: 300,
                plugins: [
                    'advlist', 'autolink', 'link', 'image', 'lists', 'charmap', 'prewiew', 'anchor', 'pagebreak',
                    'searchreplace', 'wordcount', 'visualblocks', 'code', 'fullscreen', 'insertdatetime', 'media',
                    'table', 'emoticons', 'template', 'codesample'
                ],
                toolbar: 'undo redo | styles | bold italic underline | alignleft aligncenter alignright alignjustify |' +
                        'bullist numlist outdent indent | link image | print preview media fullscreen | ' +
                        'forecolor backcolor emoticons',
                menu: {
                    favs: {title: 'menu', items: 'code visualaid | searchreplace | emoticons'}
                },
                menubar: false,
                content_style: 'body{font-family:Helvetica,Arial,sans-serif; font-size:16px}'
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var stars = document.querySelectorAll('.starR');
                var selectedRating = 0;

                stars.forEach(function (star, index) {
                    star.addEventListener('click', function (event) {
                        event.preventDefault();

                        // Nếu đã chọn sao này thì bỏ chọn
                        if (index + 1 === selectedRating) {
                            selectedRating = 0;
                        } else {
                            selectedRating = index + 1;
                        }

                        // Cập nhật class của tất cả các sao thành ion-ios-star-outline
                        stars.forEach(function (s) {
                            s.querySelector('span').classList.remove('ion-ios-star');
                            s.querySelector('span').classList.add('ion-ios-star-outline');
                        });

                        // Cập nhật class của sao được bấm và các sao trước nó
                        for (var i = 0; i < selectedRating; i++) {
                            stars[i].querySelector('span').classList.remove('ion-ios-star-outline');
                            stars[i].querySelector('span').classList.add('ion-ios-star');
                        }

                        // Cập nhật giá trị của updated_rating
                        document.getElementById('updated_rating').value = selectedRating;
                    });
                });
            });
        </script>
    </body>
</html>
