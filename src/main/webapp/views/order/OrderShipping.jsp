<%@page import="com.fpt.prj301.service.UserService"%>
<%@page import="com.fpt.prj301.model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <title>Orders Page</title>
        <%@include file="/common-admin/Header.jsp" %>
    </head>

    <%
        User user = (User) session.getAttribute("account");
        if(user == null){
            response.sendRedirect("./login");
        }
        
        List<Order> list = (List<Order>) request.getAttribute("list");
        int countPending = (int) request.getAttribute("countPending");
        int countShipping = (int) request.getAttribute("countShipping");
        int countDelivered = (int) request.getAttribute("countDelivered");
        int countRefund = (int) request.getAttribute("countRefund");
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
                                            <h2 class="sherah-breadcrumb__title">Order List</h2>
                                            <ul class="sherah-breadcrumb__list"> 
                                                <li><a href="<%=request.getContextPath()%>/profile">Home</a></li>
                                                <li class="active"><a href="<%=request.getContextPath()%>/order-user">Order List</a></li>
                                            </ul>
                                        </div>
                                        <!-- End Sherah Breadcrumb -->
                                    </div>
                                </div>
                                <div class="sherah-breadcrumb__right mg-top-30">
                                    <div class="sherah-breadcrumb__right--second">
                                        <div class="sherah-product__nav list-group" id="list-tab">
                                            <a class="list-group-item" href="<%=request.getContextPath()%>/order-pending-user"><span>Pending (<%=countPending%>)</span></a>
                                            <a class="list-group-item" href="<%=request.getContextPath()%>/order-shipping-user"><span>Shipping (<%=countShipping%>)</span></a>
                                            <a class="list-group-item" href="<%=request.getContextPath()%>/order-delivered-user"><span>Delivered (<%=countDelivered%>)</span></a>
                                            <a class="list-group-item" href="<%=request.getContextPath()%>/order-refund-user"><span>Refund (<%=countRefund%>)</span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="sherah-table sherah-page-inner sherah-border sherah-default-bg mg-top-25">
                                    <table id="sherah-table__vendor" class="sherah-table__main sherah-table__main-v3">
                                        <!-- sherah Table Head -->
                                        <thead class="sherah-table__head">
                                            <tr>
                                                <th class="sherah-table__column-1 sherah-table__h1">Order ID</th>
                                                <th class="sherah-table__column-2 sherah-table__h2">Customer Name</th>
                                                <th class="sherah-table__column-3 sherah-table__h3">Date</th>
                                                <th class="sherah-table__column-5 sherah-table__h5">Total</th>
                                                <th class="sherah-table__column-7 sherah-table__h7">Order Status</th>
                                                <th class="sherah-table__column-8 sherah-table__h8">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="sherah-table__body">
                                            <%
                                                for (Order order : list) {
                                            %>
                                            <tr>
                                                <td class="sherah-table__column-1 sherah-table__data-1">
                                                    <div class="sherah-language-form__input">
                                                        <input class="sherah-language-form__check" id="checkbox" name="checkbox" type="checkbox">
                                                        <p class="crany-table__product--number">
                                                            <a href="<%=request.getContextPath()%>/order-detail-user?id=<%=order.getOrderId()%>" 
                                                               class="sherah-color1">#<%=order.getOrderId()%></a>
                                                        </p>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-2 sherah-table__data-2">
                                                    <div class="sherah-table__product-img">
                                                        <img src=".<%=user.getAvatar()%>" alt="Avatar">
                                                    </div>
                                                    <div class="sherah-table__product-content">
                                                        <p class="sherah-table__product-desc"><%=user.getName()%></p>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-3 sherah-table__data-3">
                                                    <p class="sherah-table__product-desc"><%=order.getDate()%></p>
                                                </td>
                                                <td class="sherah-table__column-5 sherah-table__data-5">
                                                    <div class="sherah-table__product-content">
                                                        <p class="sherah-table__product-desc">$<%=order.getAmount()%></p>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-7 sherah-table__data-7">
                                                    <div class="sherah-table__status sherah-color1 sherah-color1__bg--opactity"><%=order.getStatus()%></div>
                                                </td>
                                                <td class="sherah-table__column-8 sherah-table__data-8">
                                                    <div class="sherah-table__status__group">
                                                        <a href="<%=request.getContextPath()%>/order-detail-user?id=<%=order.getOrderId()%>" class="sherah-table__action sherah-color1 sherah-color1__bg--opactity">
                                                            <i class="fa-regular fa-eye"></i>
                                                        </a>
                                                        <a href="<%=request.getContextPath()%>/delivered?id=<%=order.getOrderId()%>" class="sherah-table__action sherah-color3 sherah-color3__bg--opactity">
                                                            <i class="fa-solid fa-parachute-box"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% }%>

                                        </tbody>
                                    </table>
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
            $.noConflict();
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
                    search: '<span class="sherah-data-table-label">Search</span>'
                }
            });
        </script>
    </body>
</html>

