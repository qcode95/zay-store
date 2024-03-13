<%@page import="com.fpt.prj301.model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <title>Users Page</title>
        <%@include file="/common-admin/Header.jsp" %>
    </head>

    <%
        User userCheck = (User) session.getAttribute("account");
        if(userCheck == null){
            response.sendRedirect("./login");
        }
        
        List<User> list = (List<User>) request.getAttribute("list");
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
                                <div class="row">
                                    <div class="col-12">
                                        <div class="sherah-breadcrumb mg-top-30">
                                            <h2 class="sherah-breadcrumb__title">Pages</h2>
                                            <ul class="sherah-breadcrumb__list"> 
                                                <li><a href="<%=request.getContextPath()%>/dashboard">Home</a></li>
                                                <li class="active"><a href="<%=request.getContextPath()%>/users">User List</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="sherah-table sherah-page-inner sherah-border sherah-default-bg mg-top-25">
                                    <table id="sherah-table__vendor" class="sherah-table__main sherah-table__main-v3">
                                        <!-- sherah Table Head -->
                                        <thead class="sherah-table__head">
                                            <tr>
                                                <th class="sherah-table__column-2 sherah-table__h2">Name</th>
                                                <th class="sherah-table__column-3 sherah-table__h3">Email</th>
                                                <th class="sherah-table__column-5 sherah-table__h5">Mobile</th>
                                                <th class="sherah-table__column-7 sherah-table__h6">Address</th>
                                            </tr>
                                        </thead>
                                        <tbody class="sherah-table__body">
                                            <%
                                                for (User user : list) {
                                            %>
                                            <tr>
                                                <td class="sherah-table__column-1 sherah-table__data-1">
                                                    <div class="sherah-table__product">
                                                        <div class="sherah-table__product-img">
                                                            <img src=".<%=user.getAvatar()%>" alt="Avatar">
                                                        </div>
                                                        <h4 class="sherah-table__vendor--title"><%=user.getName()%></h4>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-2 sherah-table__data-2">
                                                    <div class="sherah-table__product-content">
                                                        <p class="sherah-table__product-desc"><%=user.getEmail()%></p>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-4 sherah-table__data-4">
                                                    <div class="sherah-table__product-content">
                                                        <p class="sherah-table__product-desc"><%=user.getMobile()%></p>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-6 sherah-table__data-6">
                                                    <div class="sherah-table__product-content">
                                                        <p class="sherah-table__product-desc"><%=user.getAddress()%></p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
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
                    search: '<span class="sherah-data-table-label">Search</span>',
                }
            });
        </script>
    </body>
</html>

