<%@page import="com.fpt.prj301.model.Order"%>
<%@page import="com.fpt.prj301.service.impl.OrderServiceImpl"%>
<%@page import="com.fpt.prj301.model.Bill"%>
<%@page import="com.fpt.prj301.service.impl.OrderDetailServiceImpl"%>
<%@page import="com.fpt.prj301.service.impl.ProductServiceImpl"%>
<%@page import="com.fpt.prj301.model.Transaction"%>
<%@page import="com.fpt.prj301.model.OrderDetail"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <title>Order Detail Page</title>
        <%@include file="/common-admin/Header.jsp" %>
        <style>
            .card {
                z-index: 0;
                background-color: #F6F7F9;
                padding-bottom: 20px;
                border-radius: 10px;
            }

            .top {
                padding-top: 40px;
                padding-left: 11% !important;
            }

            /*Icon progressbar*/
            #progressbar {
                margin-bottom: 30px;
                overflow: hidden;
                color: #455A64;
                padding-left: 0px;
                margin-top: 30px;
            }

            #progressbar li {
                list-style-type: none;
                font-size: 13px;
                width: 25%;
                float: left;
                position: relative;
                font-weight: 400;
            }

            #progressbar .step0:before {
                font-family: FontAwesome;
                content: "\f10c";
                color: #fff;
            }

            #progressbar li:before {
                width: 40px;
                height: 40px;
                line-height: 45px;
                display: block;
                font-size: 20px;
                background: #C5CAE9;
                border-radius: 50%;
                margin: auto;
                padding: 0px;
            }

            /*ProgressBar connectors*/
            #progressbar li:after {
                content: '';
                width: 100%;
                height: 12px;
                background: #C5CAE9;
                position: absolute;
                left: 0;
                top: 16px;
                z-index: -1;
            }

            #progressbar li:last-child:after {
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
                position: absolute;
                left: -50%;
            }

            #progressbar li:nth-child(2):after, #progressbar li:nth-child(3):after {
                left: -50%;
            }

            #progressbar li:first-child:after {
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
                position: absolute;
                left: 50%;
            }

            #progressbar li:last-child:after {
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
            }

            #progressbar li:first-child:after {
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
            }

            /*Color number of the step and the connector before it*/
            #progressbar li.active:before, #progressbar li.active:after {
                background: #651FFF;
            }

            #progressbar li.active:before {
                font-family: FontAwesome;
                content: "\f00c";
            }

            .icon {
                width: 60px;
                height: 60px;
                margin-right: 15px;
            }

            .icon-content {
                padding-bottom: 20px;
            }

            @media screen and (max-width: 992px) {
                .icon-content {
                    width: 50%;
                }
            }
        </style>
    </head>

    <%
        ProductServiceImpl ps = new ProductServiceImpl();
        OrderDetailServiceImpl ods = new OrderDetailServiceImpl();
        OrderServiceImpl os = new OrderServiceImpl();

        User user = (User) session.getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        }

        List<OrderDetail> list = (List<OrderDetail>) request.getAttribute("list");
        Transaction transaction = (Transaction) request.getAttribute("transaction");
        Bill bill = (Bill) request.getAttribute("bill");

        int orderId = (int) request.getAttribute("id");
        String date = (String) request.getAttribute("date");
        int amount = (int) request.getAttribute("amount");
        int count = (int) request.getAttribute("count");
        int delivery = (int) request.getAttribute("delivery");
        int discount = (int) request.getAttribute("discount");

        String orderStatus = os.GetStatusById(orderId);
    %>
    <body id="sherah-dark-light">

        <%@include file="/common/Sidebar.jsp" %>

        <%@include file="/common/NavbarInformation.jsp" %>

        <!-- sherah Dashboard -->
        <section class="sherah-adashboard sherah-show">
            <div class="container">
                <div class="row">	
                    <div class="col-12">
                        <div class="sherah-body">
                            <!-- Dashboard Inner -->
                            <div class="sherah-dsinner">
                                <div class="row mg-top-30">
                                    <div class="col-12 sherah-flex-between">
                                        <!-- Sherah Breadcrumb -->
                                        <div class="sherah-breadcrumb">
                                            <h2 class="sherah-breadcrumb__title">Order Detail</h2>
                                            <ul class="sherah-breadcrumb__list"> 
                                                <li><a href="<%=request.getContextPath()%>/profile">Home</a></li>
                                                <li class="active"><a href="<%=request.getContextPath()%>/order-detail?id=<%=orderId%>">Order Detail</a></li>
                                            </ul>
                                        </div>
                                        <!-- End Sherah Breadcrumb -->
                                    </div>
                                </div>
                                <div class="container px-1 px-md-4 py-5 mx-auto">
                                    <div class="card">
                                        <!-- Add class 'active' to progress -->
                                        <div class="row d-flex justify-content-center">
                                            <div class="col-12">
                                                <ul id="progressbar" class="text-center">
                                                    <%
                                                        if(orderStatus.equalsIgnoreCase("Pending")){
                                                    %>
                                                    <li class="active step0"></li>
                                                    <li class="step0"></li>
                                                    <li class="step0"></li>
                                                    <li class="step0"></li>
                                                    <% } else if(orderStatus.equalsIgnoreCase("Shipping")) { %>
                                                    <li class="active step0"></li>    
                                                    <li class="active step0"></li>    
                                                    <li class="active step0"></li>    
                                                    <li class="step0"></li>    
                                                    <% } else { %>
                                                    <li class="active step0"></li>
                                                    <li class="active step0"></li>
                                                    <li class="active step0"></li>
                                                    <li class="active step0"></li>
                                                    <% } %>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="row top">
                                            <div class="col-3">
                                                <div class="d-flex icon-content">
                                                    <img class="icon" src="https://i.imgur.com/9nnc9Et.png">
                                                    <div class="d-flex flex-column">
                                                        <p class="font-weight-bold">Order<br>Processed</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="d-flex icon-content">
                                                    <img class="icon" src="https://i.imgur.com/u1AzR7w.png">
                                                    <div class="d-flex flex-column">
                                                        <p class="font-weight-bold">Order<br>Shipped</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="d-flex icon-content">
                                                    <img class="icon" src="https://i.imgur.com/TkPm63y.png">
                                                    <div class="d-flex flex-column">
                                                        <p class="font-weight-bold">Order<br>On The Way</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="d-flex icon-content">
                                                    <img class="icon" src="https://i.imgur.com/HdsziHP.png">
                                                    <div class="d-flex flex-column">
                                                        <p class="font-weight-bold">Order<br>Arrived</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="sherah-page-inner sherah-border sherah-default-bg mg-top-25">
                                    <div class="sherah-table__head sherah-table__main">
                                        <h4 class="sherah-order-title">Items from Order #<%=orderId%></h4>
                                        <div class="sherah-order-right">
                                            <p class="sherah-order-text"><%=date%> / <%=count%> items / Total $<%=amount%></p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12 mg-top-30">
                                            <div class="sherah-table-order">
                                                <table id="sherah-table__orderv1" class="sherah-table__main sherah-table__main--orderv1">
                                                    <thead class="sherah-table__head">
                                                        <tr>
                                                            <th class="sherah-table__column-1 sherah-table__h1">Product</th>
                                                            <th class="sherah-table__column-2 sherah-table__h2">Products name</th>
                                                            <th class="sherah-table__column-3 sherah-table__h3">Price</th>
                                                            <th class="sherah-table__column-4 sherah-table__h4">Total Amount</th>
                                                        </tr>
                                                    </thead> 
                                                    <tbody class="sherah-table__body">
                                                        <%
                                                            for (OrderDetail oDetail : list) {
                                                        %>
                                                        <tr>
                                                            <td class="sherah-table__column-1 sherah-table__data-1">
                                                                <div class="sherah-table__product--thumb">
                                                                    <img src=".<%=ps.GetImageProductById(oDetail.getProductId())%>" style="width: 80px; height: 80px">
                                                                </div>
                                                            </td>
                                                            <td class="sherah-table__column-2 sherah-table__data-2">
                                                                <div class="sherah-table__product-name">
                                                                    <h4 class="sherah-table__product-name--title">
                                                                        <%=ps.GetNameProductById(oDetail.getProductId())%>
                                                                    </h4>
                                                                    <p class="sherah-table__product-name--text">Color : 
                                                                        <%=ps.GetColorProductById(oDetail.getProductId())%>
                                                                    </p>
                                                                </div>
                                                            </td>
                                                            <td class="sherah-table__column-3 sherah-table__data-3">
                                                                <div class="sherah-table__product-content">
                                                                    <p class="sherah-table__product-desc">$<%=ps.GetPriceProductById(oDetail.getProductId())%> x <%=oDetail.getQuantity()%></p>
                                                                </div>
                                                            </td>
                                                            <td class="sherah-table__column-4 sherah-table__data-4">
                                                                <div class="sherah-table__product-content">
                                                                    <p class="sherah-table__product-desc">$<%=(ps.GetPriceProductById(oDetail.getProductId()) * oDetail.getQuantity())%></p>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <% }%>
                                                    </tbody>
                                                </table>
                                                <div class="order-totals">
                                                    <ul class="order-totals__list">
                                                        <li class="order-totals__list--sub"><span>Subtotal</span> <span class="order-totals__amount">$<%=ods.GetSumAmount(orderId)%></span></li>
                                                        <li><span>Vat Tax</span> <span class="order-totals__amount">+5$</span></li>
                                                        <li><span>Delivery Charges</span> 
                                                            <span class="order-totals__amount">+<%= delivery == 2 ? 10 : 5%>$</span>
                                                        </li>
                                                        <li><span>Discount</span> <span class="order-totals__amount">-<%= discount == 0 ? 0 : 10%>$</span></li>
                                                        <li class="order-totals__bottom"><span>Total</span> <span class="order-totals__amount">$<%=amount%></span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12 mg-top-30">
                                            <div class="sherah-table--v1">
                                                <table id="sherah-table__orderv1" class="sherah-table__main sherah-table__main--orderv1 sherah-border">
                                                    <thead class="sherah-table__head">
                                                        <tr>
                                                            <th class="sherah-table__column-1 sherah-table__h1">Transaction</th>
                                                            <th class="sherah-table__column-2 sherah-table__h2">Date</th>
                                                            <th class="sherah-table__column-3 sherah-table__h3">Total Amount</th>
                                                        </tr>
                                                    </thead> 
                                                    <tbody class="sherah-table__body">
                                                        <tr>
                                                            <td class="sherah-table__column-1 sherah-table__data-1">
                                                                <div class="sherah-table__product-name">
                                                                    <p class="sherah-table__product-gateway">#<%=transaction.getTransactionId()%></p>
                                                                </div>
                                                            </td>
                                                            <td class="sherah-table__column-2 sherah-table__data-2">
                                                                <div class="sherah-table__product-content">
                                                                    <p class="sherah-table__product-desc"><%=transaction.getDate()%></p>
                                                                </div>
                                                            </td>
                                                            <td class="sherah-table__column-2 sherah-table__data-2">
                                                                <div class="sherah-table__product-content">
                                                                    <p class="sherah-table__product-desc">$<%=transaction.getAmount()%></p>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="sherah-table--v1 mg-top-30">
                                                <table id="sherah-table__orderv1" class="sherah-table__main sherah-table__main--orderv1 sherah-border">
                                                    <thead class="sherah-table__head">
                                                        <tr>
                                                            <th class="sherah-table__column-1 sherah-table__h1">Liquidator</th>
                                                            <th class="sherah-table__column-2 sherah-table__h2">Total Amount</th>
                                                        </tr>
                                                    </thead> 
                                                    <tbody class="sherah-table__body">
                                                        <tr>
                                                            <td class="sherah-table__column-1 sherah-table__data-1">
                                                                <div class="sherah-table__product-name">
                                                                    <h4 class="sherah-table__product-gateway"><%=user.getName()%></h4>
                                                                </div>
                                                            </td>
                                                            <td class="sherah-table__column-2 sherah-table__data-2">
                                                                <div class="sherah-table__product-content">
                                                                    <p class="sherah-table__product-desc">$<%=transaction.getAmount()%></p>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-12">
                                        <div class="sherah-contact-card sherah-default-bg sherah-border mg-top-30">
                                            <h4 class="sherah-contact-card__title">Customer Contact</h4>
                                            <div class="sherah-vcard__body">
                                                <div class="sherah-vcard__img">
                                                    <img src=".<%=user.getAvatar()%>" alt="Avatar">
                                                </div>
                                                <div class="sherah-vcard__content">
                                                    <h4 class="sherah-vcard__title"><%=user.getName()%></h4>
                                                    <ul class="sherah-vcard__contact">
                                                        <li><a href="tel:+84<%=user.getMobile()%>">
                                                                <svg class="sherah-color1__fill" xmlns="http://www.w3.org/2000/svg" width="13.983" height="13.981" viewBox="0 0 13.983 13.981">
                                                                <path id="Path_468" data-name="Path 468" d="M243.018,85.567c0,.4,0,.8,0,1.2a1.111,1.111,0,0,1-1.184,1.18,12.682,12.682,0,0,1-11.3-6.853,12.1,12.1,0,0,1-1.5-5.83,1.144,1.144,0,0,1,1.262-1.3q1.16,0,2.32,0a1.129,1.129,0,0,1,1.227,1.2,8.25,8.25,0,0,0,.362,2.282,1.287,1.287,0,0,1-.255,1.32c-.358.423-.668.886-1.009,1.323a.281.281,0,0,0-.028.36,8.757,8.757,0,0,0,3.635,3.627.263.263,0,0,0,.337-.029c.474-.368.958-.724,1.432-1.091a1.118,1.118,0,0,1,1.052-.211,9.653,9.653,0,0,0,2.55.406,1.1,1.1,0,0,1,1.094,1.131C243.026,84.712,243.018,85.139,243.018,85.567Z" transform="translate(-229.038 -73.968)"></path>
                                                                </svg>(+84) <%=user.getMobile()%></a>
                                                        </li>
                                                        <li>
                                                            <a href="mailto:<%=user.getEmail()%>">
                                                                <svg class="sherah-color1__fill" xmlns="http://www.w3.org/2000/svg" width="13.98" height="14.033" viewBox="0 0 13.98 14.033">
                                                                <g id="Group_131" data-name="Group 131" transform="translate(-219.859 -62.544)">
                                                                <path id="Path_472" data-name="Path 472" d="M271.363,95.475h3.71c.626,0,.7.079.7.716,0,1.447,0,2.894,0,4.342a.459.459,0,0,1-.2.413c-.844.645-1.677,1.3-2.522,1.948a.71.71,0,0,1-.393.137q-1.291.018-2.583,0a.664.664,0,0,1-.371-.122q-1.289-.983-2.558-1.991a.523.523,0,0,1-.172-.359c-.012-1.493-.008-2.986-.007-4.479,0-.486.116-.6.594-.605Zm.637,5.474a3.893,3.893,0,0,0,.7.341,1.257,1.257,0,0,0,1.345-.694,2.636,2.636,0,0,0,.269-1.913,3.02,3.02,0,1,0-3.112,3.8c.349.016.57-.177.522-.467-.044-.264-.23-.339-.476-.359a2.2,2.2,0,0,1-1.7-3.381,2.155,2.155,0,0,1,2.948-.685.478.478,0,0,0-.623.271,1.437,1.437,0,0,0-1.921.8A2.33,2.33,0,0,0,269.8,99.7,1.44,1.44,0,0,0,272,100.949Z" transform="translate(-44.527 -31.12)"></path>
                                                                <path id="Path_473" data-name="Path 473" d="M243.053,251.784H230.261c.094-.08.151-.133.213-.181q2.254-1.754,4.512-3.5a.749.749,0,0,1,.418-.145c.86-.013,1.721-.01,2.582,0a.571.571,0,0,1,.325.1q2.348,1.812,4.686,3.636a.367.367,0,0,0,.1.038Z" transform="translate(-9.83 -175.207)"></path>
                                                                <path id="Path_474" data-name="Path 474" d="M219.859,174.433l4.671,3.633-4.671,3.633Z" transform="translate(0 -105.737)"></path>
                                                                <path id="Path_475" data-name="Path 475" d="M389.225,178.113l4.667-3.63v7.26Z" transform="translate(-160.053 -105.784)"></path>
                                                                <path id="Path_476" data-name="Path 476" d="M325.243,63.516h-2.686c.416-.344.766-.661,1.148-.931a.487.487,0,0,1,.446.032C324.512,62.877,324.843,63.18,325.243,63.516Z" transform="translate(-97.051 0)"></path>
                                                                <path id="Path_477" data-name="Path 477" d="M442.145,142.025v-2.23l1.378,1.157Z" transform="translate(-210.063 -73.003)"></path>
                                                                <path id="Path_478" data-name="Path 478" d="M228.2,139.874v2.218l-1.369-1.064Z" transform="translate(-6.59 -73.078)"></path>
                                                                <path id="Path_479" data-name="Path 479" d="M334.105,152.656a3.655,3.655,0,0,1-.262.637.469.469,0,0,1-.756.075,1.118,1.118,0,0,1-.1-1.389.55.55,0,0,1,.984.143A4.005,4.005,0,0,1,334.105,152.656Z" transform="translate(-106.725 -84.286)"></path>
                                                                <path id="Path_480" data-name="Path 480" d="M370.08,135.548a1.9,1.9,0,0,1,.681,2.51.7.7,0,0,1-.225.232c-.245.152-.407.061-.408-.227,0-.649.006-1.3,0-1.947C370.128,135.922,370.1,135.727,370.08,135.548Z" transform="translate(-141.961 -68.99)"></path>
                                                                </g>
                                                                </svg><%=user.getEmail()%></a>
                                                        </li>
                                                        <li>
                                                            <a href="#">
                                                                <i class="fa-solid fa-location-dot sherah-color1"></i>
                                                                <p><%=user.getAddress()%></p>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-12">
                                        <div class="sherah-contact-card sherah-default-bg  sherah-border mg-top-30">
                                            <h4 class="sherah-contact-card__title">Billing Address</h4>
                                            <div class="sherah-vcard__body">
                                                <div class="sherah-vcard__content">
                                                    <h4 class="sherah-vcard__title"><%=user.getName()%></h4>
                                                    <ul class="sherah-vcard__contact">
                                                        <li><a href="tel:+25 (734) 697-2907">
                                                                <svg class="sherah-color1__fill" xmlns="http://www.w3.org/2000/svg" width="13.983" height="13.981" viewBox="0 0 13.983 13.981">
                                                                <path id="Path_468" data-name="Path 468" d="M243.018,85.567c0,.4,0,.8,0,1.2a1.111,1.111,0,0,1-1.184,1.18,12.682,12.682,0,0,1-11.3-6.853,12.1,12.1,0,0,1-1.5-5.83,1.144,1.144,0,0,1,1.262-1.3q1.16,0,2.32,0a1.129,1.129,0,0,1,1.227,1.2,8.25,8.25,0,0,0,.362,2.282,1.287,1.287,0,0,1-.255,1.32c-.358.423-.668.886-1.009,1.323a.281.281,0,0,0-.028.36,8.757,8.757,0,0,0,3.635,3.627.263.263,0,0,0,.337-.029c.474-.368.958-.724,1.432-1.091a1.118,1.118,0,0,1,1.052-.211,9.653,9.653,0,0,0,2.55.406,1.1,1.1,0,0,1,1.094,1.131C243.026,84.712,243.018,85.139,243.018,85.567Z" transform="translate(-229.038 -73.968)"></path>
                                                                </svg>(+84)<%=bill.getMobile()%></a>
                                                        </li>
                                                        <li>
                                                            <a href="mailto:margaretraw@gmail.com">
                                                                <svg class="sherah-color1__fill" xmlns="http://www.w3.org/2000/svg" width="13.98" height="14.033" viewBox="0 0 13.98 14.033">
                                                                <g id="Group_131" data-name="Group 131" transform="translate(-219.859 -62.544)">
                                                                <path id="Path_472" data-name="Path 472" d="M271.363,95.475h3.71c.626,0,.7.079.7.716,0,1.447,0,2.894,0,4.342a.459.459,0,0,1-.2.413c-.844.645-1.677,1.3-2.522,1.948a.71.71,0,0,1-.393.137q-1.291.018-2.583,0a.664.664,0,0,1-.371-.122q-1.289-.983-2.558-1.991a.523.523,0,0,1-.172-.359c-.012-1.493-.008-2.986-.007-4.479,0-.486.116-.6.594-.605Zm.637,5.474a3.893,3.893,0,0,0,.7.341,1.257,1.257,0,0,0,1.345-.694,2.636,2.636,0,0,0,.269-1.913,3.02,3.02,0,1,0-3.112,3.8c.349.016.57-.177.522-.467-.044-.264-.23-.339-.476-.359a2.2,2.2,0,0,1-1.7-3.381,2.155,2.155,0,0,1,2.948-.685.478.478,0,0,0-.623.271,1.437,1.437,0,0,0-1.921.8A2.33,2.33,0,0,0,269.8,99.7,1.44,1.44,0,0,0,272,100.949Z" transform="translate(-44.527 -31.12)"></path>
                                                                <path id="Path_473" data-name="Path 473" d="M243.053,251.784H230.261c.094-.08.151-.133.213-.181q2.254-1.754,4.512-3.5a.749.749,0,0,1,.418-.145c.86-.013,1.721-.01,2.582,0a.571.571,0,0,1,.325.1q2.348,1.812,4.686,3.636a.367.367,0,0,0,.1.038Z" transform="translate(-9.83 -175.207)"></path>
                                                                <path id="Path_474" data-name="Path 474" d="M219.859,174.433l4.671,3.633-4.671,3.633Z" transform="translate(0 -105.737)"></path>
                                                                <path id="Path_475" data-name="Path 475" d="M389.225,178.113l4.667-3.63v7.26Z" transform="translate(-160.053 -105.784)"></path>
                                                                <path id="Path_476" data-name="Path 476" d="M325.243,63.516h-2.686c.416-.344.766-.661,1.148-.931a.487.487,0,0,1,.446.032C324.512,62.877,324.843,63.18,325.243,63.516Z" transform="translate(-97.051 0)"></path>
                                                                <path id="Path_477" data-name="Path 477" d="M442.145,142.025v-2.23l1.378,1.157Z" transform="translate(-210.063 -73.003)"></path>
                                                                <path id="Path_478" data-name="Path 478" d="M228.2,139.874v2.218l-1.369-1.064Z" transform="translate(-6.59 -73.078)"></path>
                                                                <path id="Path_479" data-name="Path 479" d="M334.105,152.656a3.655,3.655,0,0,1-.262.637.469.469,0,0,1-.756.075,1.118,1.118,0,0,1-.1-1.389.55.55,0,0,1,.984.143A4.005,4.005,0,0,1,334.105,152.656Z" transform="translate(-106.725 -84.286)"></path>
                                                                <path id="Path_480" data-name="Path 480" d="M370.08,135.548a1.9,1.9,0,0,1,.681,2.51.7.7,0,0,1-.225.232c-.245.152-.407.061-.408-.227,0-.649.006-1.3,0-1.947C370.128,135.922,370.1,135.727,370.08,135.548Z" transform="translate(-141.961 -68.99)"></path>
                                                                </g>
                                                                </svg><%=bill.getEmail()%></a>
                                                        </li>
                                                        <li><a href="#">
                                                                <i class="fa-solid fa-location-dot sherah-color1"></i>
                                                                <%=bill.getAddress()%></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Dashboard Inner -->
                        </div>
                    </div>
                </div>	
            </div>	
        </section>	
        <!-- End sherah Dashboard -->

        <%@include file="/common-admin/Js.jsp" %>
        <script src="https://cdn.jsdelivr.net/gh/AmagiTech/JSLoader/amagiloader.js"></script>
        <script>
            AmagiLoader.show();
            setTimeout(() => {
                AmagiLoader.hide();
            }, 600);
        </script>
        <script>
            $('#sherah-table__vendor').DataTable({
                searching: true,
                info: false,
                lengthChange: true,
                scrollCollapse: true,
                paging: true,
                language: {
                    paginate: {
                        next: '<i class="fas fa-angle-right"></i>', // Font Awesome class for next button
                        previous: '<i class="fas fa-angle-left"></i>' // Font Awesome class for previous button
                    },
                    lengthMenu: 'Showing _MENU_',
                    searchPlaceholder: 'Search...',
                    search: '<span class="sherah-data-table-label">Search</span>',

                }
            });
        </script>

    </body>
</html>

