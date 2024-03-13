<%@page import="com.fpt.prj301.service.impl.UserServiceImpl"%>
<%@page import="com.fpt.prj301.model.Transaction"%>
<%@page import="com.fpt.prj301.model.User"%>
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
        
        UserServiceImpl us = new UserServiceImpl();
        List<Transaction> list = (List<Transaction>) request.getAttribute("list");
    %>

    <body id="sherah-dark-light">

        <%@include file="/common-admin/Sidebar.jsp" %>

        <%@include file="/common-admin/Navbar.jsp" %>

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
                                            <h2 class="sherah-breadcrumb__title">Transaction List</h2>
                                            <ul class="sherah-breadcrumb__list"> 
                                                <li><a href="<%=request.getContextPath()%>/dashboard">Home</a></li>
                                                <li class="active"><a href="<%=request.getContextPath()%>/transactions">Transaction List</a></li>
                                            </ul>
                                        </div>
                                        <!-- End Sherah Breadcrumb -->
                                    </div>
                                </div>
                                <div class="sherah-table sherah-page-inner sherah-border sherah-default-bg mg-top-25">
                                    <table id="sherah-table__vendor" class="sherah-table__main sherah-table__main-v3">
                                        <!-- sherah Table Head -->
                                        <thead class="sherah-table__head">
                                            <tr>
                                                <th class="sherah-table__column-1 sherah-table__h1">Transaction ID</th>
                                                <th class="sherah-table__column-2 sherah-table__h2">Order ID</th>
                                                <th class="sherah-table__column-3 sherah-table__h3">Customer Name</th>
                                                <th class="sherah-table__column-5 sherah-table__h5">Amount</th>
                                                <th class="sherah-table__column-7 sherah-table__h7">Date</th>
                                            </tr>
                                        </thead>
                                        <tbody class="sherah-table__body">
                                            <%
                                                for (Transaction transaction : list) {
                                            %>
                                            <tr>
                                                <td class="sherah-table__column-1 sherah-table__data-1">
                                                    <div class="sherah-language-form__input">
                                                        <input class="sherah-language-form__check" id="checkbox" name="checkbox" type="checkbox">
                                                        <p class="crany-table__product--number">#<%=transaction.getTransactionId()%></p>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-2 sherah-table__data-2">
                                                    <div class="sherah-language-form__input">
                                                        <p class="crany-table__product--number">#<%=transaction.getOid()%></p>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-2 sherah-table__data-2">
                                                    <div class="sherah-table__product-img">
                                                        <img src=".<%=us.GetAvatarById(transaction.getUid())%>" alt="Avatar">
                                                    </div>
                                                    <div class="sherah-table__product-content">
                                                        <p class="sherah-table__product-desc"><%=us.GetNameById(transaction.getUid())%></p>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-3 sherah-table__data-3">
                                                    <p class="sherah-table__product-desc">$<%=transaction.getAmount()%></p>
                                                </td>
                                                <td class="sherah-table__column-5 sherah-table__data-5">
                                                    <div class="sherah-table__product-content">
                                                        <p class="sherah-table__product-desc"><%=transaction.getDate()%></p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% } %>
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

