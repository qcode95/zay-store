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
                                                <%
                                                    if (order.getStatus().equalsIgnoreCase("Shipping")) {
                                                %>
                                                <td class="sherah-table__column-7 sherah-table__data-7">
                                                    <div class="sherah-table__status sherah-color1 sherah-color1__bg--opactity"><%=order.getStatus()%></div>
                                                </td>
                                                <% } else if (order.getStatus().equalsIgnoreCase("Pending")) {%>
                                                <td class="sherah-table__column-7 sherah-table__data-7">
                                                    <div class="sherah-table__status sherah-color4 sherah-color4__bg--opactity"><%=order.getStatus()%></div>
                                                </td>
                                                <% } else if (order.getStatus().equalsIgnoreCase("Delivered")) {%>
                                                <td class="sherah-table__column-7 sherah-table__data-7">
                                                    <div class="sherah-table__status sherah-color3 sherah-color3__bg--opactity"><%=order.getStatus()%></div>
                                                </td>
                                                <% } else {%>
                                                <td class="sherah-table__column-7 sherah-table__data-7">
                                                    <div class="sherah-table__status sherah-color2 sherah-color2__bg--opactity"><%=order.getStatus()%></div>
                                                </td>
                                                <% }%>
                                                <td class="sherah-table__column-8 sherah-table__data-8">
                                                    <div class="sherah-table__status__group">
                                                        <a href="<%=request.getContextPath()%>/order-detail-user?id=<%=order.getOrderId()%>" class="sherah-table__action sherah-color1 sherah-color1__bg--opactity">
                                                            <i class="fa-regular fa-eye"></i>
                                                        </a>
                                                        <%
                                                            if (order.getStatus().equalsIgnoreCase("Pending")) {
                                                        %>    
                                                        <a href="<%=request.getContextPath()%>/cancel-order?id=<%=order.getOrderId()%>" class="sherah-table__action sherah-color2 sherah-color2__bg--offset">
                                                            <svg class="sherah-color2__fill"  xmlns="http://www.w3.org/2000/svg" width="16.247" height="18.252" viewBox="0 0 16.247 18.252">
                                                            <g id="Icon" transform="translate(-160.007 -18.718)">
                                                            <path id="Path_484" data-name="Path 484" d="M185.344,88.136c0,1.393,0,2.786,0,4.179-.006,1.909-1.523,3.244-3.694,3.248q-3.623.007-7.246,0c-2.15,0-3.682-1.338-3.687-3.216q-.01-4.349,0-8.7a.828.828,0,0,1,.822-.926.871.871,0,0,1,1,.737c.016.162.006.326.006.489q0,4.161,0,8.321c0,1.061.711,1.689,1.912,1.69q3.58,0,7.161,0c1.2,0,1.906-.631,1.906-1.695q0-4.311,0-8.622a.841.841,0,0,1,.708-.907.871.871,0,0,1,1.113.844C185.349,85.1,185.343,86.618,185.344,88.136Z" transform="translate(-9.898 -58.597)" />
                                                            <path id="Path_485" data-name="Path 485" d="M164.512,21.131c0-.517,0-.98,0-1.443.006-.675.327-.966,1.08-.967q2.537,0,5.074,0c.755,0,1.074.291,1.082.966.005.439.005.878.009,1.317a.615.615,0,0,0,.047.126h.428c1,0,2,0,3,0,.621,0,1.013.313,1.019.788s-.4.812-1.04.813q-7.083,0-14.165,0c-.635,0-1.046-.327-1.041-.811s.4-.786,1.018-.789C162.165,21.127,163.3,21.131,164.512,21.131Zm1.839-.021H169.9v-.764h-3.551Z" transform="translate(0 0)" />
                                                            <path id="Path_486" data-name="Path 486" d="M225.582,107.622c0,.9,0,1.806,0,2.709a.806.806,0,0,1-.787.908.818.818,0,0,1-.814-.924q0-2.69,0-5.38a.82.82,0,0,1,.81-.927.805.805,0,0,1,.79.9C225.585,105.816,225.582,106.719,225.582,107.622Z" transform="translate(-58.483 -78.508)" />
                                                            <path id="Path_487" data-name="Path 487" d="M266.724,107.63c0-.9,0-1.806,0-2.709a.806.806,0,0,1,.782-.912.818.818,0,0,1,.818.919q0,2.69,0,5.38a.822.822,0,0,1-.806.931c-.488,0-.792-.356-.794-.938C266.721,109.411,266.724,108.521,266.724,107.63Z" transform="translate(-97.561 -78.509)" />
                                                            </g>
                                                            </svg>
                                                        </a>
                                                        <% } %>
                                                        <% if (order.getStatus().equalsIgnoreCase("Shipping")) {%>
                                                        <a href="<%=request.getContextPath()%>/delivered?id=<%=order.getOrderId()%>" class="sherah-table__action sherah-color3 sherah-color3__bg--opactity">
                                                            <i class="fa-solid fa-parachute-box"></i>
                                                        </a>
                                                        <% } %>
                                                        <%
                                                            if (order.getStatus().equalsIgnoreCase("Delivered")) {
                                                        %>
                                                        <a href="<%=request.getContextPath()%>/refund?id=<%=order.getOrderId()%>" class="sherah-table__action sherah-color2 sherah-color2__bg--opactity">
                                                            <i class="fa-solid fa-rotate-right"></i>
                                                        </a>
                                                        <% } %>
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

