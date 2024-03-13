<%@page import="com.fpt.prj301.model.User"%>
<%@page import="com.fpt.prj301.service.impl.ProductServiceImpl"%>
<%@page import="com.fpt.prj301.model.Brand"%>
<%@page import="com.fpt.prj301.model.Category"%>
<%@page import="com.fpt.prj301.model.Product"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <title>Products Page</title>
        <%@include file="/common-admin/Header.jsp" %>
    </head>

    <%
        User user = (User) session.getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        }

        ProductServiceImpl ps = new ProductServiceImpl();

        List<Product> list = (List<Product>) request.getAttribute("list");
        List<Category> listC = (List<Category>) request.getAttribute("listC");
        List<Brand> listB = (List<Brand>) request.getAttribute("listB");

        int start = (int) request.getAttribute("start");
        int end = (int) request.getAttribute("end");
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
                                            <h2 class="sherah-breadcrumb__title">Products</h2>
                                            <ul class="sherah-breadcrumb__list"> 
                                                <li><a href="<%=request.getContextPath()%>/dashboard">Home</a></li>
                                                <li class="active"><a href="<%=request.getContextPath()%>/products?page=1">Products</a></li>
                                            </ul>
                                        </div>
                                        <!-- End Sherah Breadcrumb -->
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xxl-3 col-lg-4 col-12">
                                        <!-- Product Category Sidebar -->
                                        <div class="sherah-product-sidebar sherah-default-bg mg-top-30">
                                            <h4 class="sherah-product-sidebar__title sherah-border-btm">Product Categories</h4>
                                            <ul class="sherah-product-sidebar__list">
                                                <%
                                                    for (Category category : listC) {
                                                %>
                                                <li>
                                                    <a href="<%=request.getContextPath()%>/products-category?id=<%=category.getId()%>&page=1">
                                                        <span>
                                                            <i class="fa-solid fa-chevron-right"></i>
                                                            <%=category.getName()%>
                                                        </span>
                                                        <span class="count">
                                                            <%=ps.CountProductByCategory(category.getId())%>
                                                        </span>
                                                    </a>
                                                </li>
                                                <% } %>
                                            </ul>
                                        </div>
                                        <!-- End Product Category Sidebar -->
                                        <!-- Product Brand Sidebar -->
                                        <div class="sherah-product-sidebar sherah-default-bg mg-top-30">
                                            <h4 class="sherah-product-sidebar__title sherah-border-btm">Product Brands</h4>
                                            <ul class="sherah-product-sidebar__list">
                                                <%
                                                    for (Brand brand : listB) {
                                                %>
                                                <li>
                                                    <a href="<%=request.getContextPath()%>/products-brand?id=<%=brand.getId()%>&page=1">
                                                        <span>
                                                            <i class="fa-solid fa-chevron-right"></i>
                                                            <%=brand.getName()%>
                                                        </span>
                                                        <span class="count">
                                                            <%=ps.CountProductByBrand(brand.getId())%>
                                                        </span>
                                                    </a>
                                                </li>
                                                <% }%>
                                            </ul>
                                        </div>
                                        <!-- End Product Brand Sidebar -->
                                    </div>
                                    <div class="col-xxl-9 col-lg-8 col-12">
                                        <div class="sherah-breadcrumb__right mg-top-30">
                                            <div class="sherah-breadcrumb__right--first">
                                                <div class="sherah-header__form sherah-header__form--product">
                                                    <form class="sherah-header__form-inner" action="./search-product-name?page=1" method="post">
                                                        <button class="search-btn" type="submit">
                                                            <svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M15.6888 18.2542C10.5721 22.0645 4.46185 20.044 1.80873 16.2993C-0.984169 12.3585 -0.508523 7.01726 2.99926 3.64497C6.41228 0.362739 11.833 0.112279 15.5865 3.01273C19.3683 5.93475 20.8252 11.8651 17.3212 16.5826C17.431 16.6998 17.5417 16.8246 17.6599 16.9437C19.6263 18.9117 21.5973 20.8751 23.56 22.8468C24.3105 23.601 24.0666 24.7033 23.104 24.9575C22.573 25.0972 22.1724 24.8646 21.8075 24.4988C19.9218 22.6048 18.0276 20.7194 16.1429 18.8245C15.9674 18.65 15.8314 18.4361 15.6888 18.2542ZM2.39508 10.6363C2.38758 14.6352 5.61109 17.8742 9.62079 17.8977C13.6502 17.9212 16.9018 14.6914 16.9093 10.6597C16.9169 6.64673 13.7046 3.41609 9.69115 3.39921C5.66457 3.38232 2.40259 6.61672 2.39508 10.6363Z"></path>
                                                            </svg>
                                                        </button>
                                                        <input oninput="searchByName(this)" name="search" value="${txtS}" type="text" placeholder="Search">
                                                    </form>
                                                </div>
                                                <p>Showing <%=start%>–<%=end%> of <%=ps.CountProduct()%> results</p>
                                            </div>
                                            <div class="sherah-breadcrumb__right--second">
                                                <div class="sherah-product__nav list-group" id="list-tab">
                                                    <a class="list-group-item" href="<%=request.getContextPath()%>/products?page=1"><span>Products</span></a>
                                                    <a class="list-group-item" href="<%=request.getContextPath()%>/product-list"><span>Product List</span></a>
                                                </div>
                                                <a href="<%=request.getContextPath()%>/add" class="sherah-btn sherah-gbcolor">Upload Product</a>
                                            </div>
                                        </div>
                                        <div class="tab-content" id="nav-tabContent">
                                            <div class="tab-pane fade show active" id="tab_1" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <div class="row" id="products">
                                                    <%
                                                        for (Product product : list) {
                                                    %>
                                                    <div class="col-xxl-4 col-lg-6 col-md-6 col-12">
                                                        <!-- Single Product -->
                                                        <div class="sherah-product-card sherah-product-card__v2  sherah-default-bg sherah-border mg-top-30">
                                                            <!-- Card Image -->
                                                            <div class="sherah-product-card__img">
                                                                <img src=".<%=product.getImage()%>" style="width: 400px; height: 350px; border-radius: 5px">
                                                                <div class="sherah-product-card__buttons">
                                                                    <a class="sherah-product-card__buttons--single sherah-default-bg sherah-border" 
                                                                       href="<%=request.getContextPath()%>/update?id=<%=product.getId()%>">
                                                                        <svg class="sherah-default__fill" xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 18 20">
                                                                        <g id="Com" transform="translate(-0.268 0)">
                                                                        <path id="Path_527" data-name="Path 527" d="M7.895.663a4.9,4.9,0,0,1-.024.662c-.012,0-.206.035-.425.082A8.8,8.8,0,0,0,.334,8.8,9.839,9.839,0,0,0,.45,11.808a8.86,8.86,0,0,0,3.875,5.507l.226.14.56-.413a6.464,6.464,0,0,0,.56-.436.953.953,0,0,0-.218-.136,7.762,7.762,0,0,1-1.934-1.524,7.446,7.446,0,0,1-1.878-3.917,9.631,9.631,0,0,1,0-2.085,7.5,7.5,0,0,1,1.116-2.95A7.776,7.776,0,0,1,5.751,3.352a8.609,8.609,0,0,1,2.017-.678l.127-.023V3.2a3.624,3.624,0,0,0,.02.546c.04,0,2.521-1.843,2.521-1.871S7.954,0,7.915,0A5.311,5.311,0,0,0,7.895.663Z" transform="translate(0 0)"/>
                                                                        <path id="Path_528" data-name="Path 528" d="M13.219,2.958a3.6,3.6,0,0,0-.54.44,1.467,1.467,0,0,0,.27.168,7.818,7.818,0,0,1,2.918,2.95,7.809,7.809,0,0,1,.842,2.615,8.959,8.959,0,0,1-.1,2.362,7.546,7.546,0,0,1-4.848,5.514,10.126,10.126,0,0,1-1.275.343c-.044,0-.056-.1-.056-.546a3.622,3.622,0,0,0-.02-.546c-.04,0-2.521,1.843-2.521,1.871S10.376,20,10.416,20a5.307,5.307,0,0,0,.02-.662v-.659l.151-.023a14,14,0,0,0,1.755-.468A8.765,8.765,0,0,0,18,11.154a9.922,9.922,0,0,0-.119-2.962,8.86,8.86,0,0,0-3.875-5.507l-.226-.14Z" transform="translate(0.206)"/>
                                                                        </g>
                                                                        </svg>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <!-- Card Content -->
                                                            <div class="sherah-product-card__content sherah-dflex-column sherah-flex-gap-5">
                                                                <h4 class="sherah-product-card__title">
                                                                    <a href="<%=request.getContextPath()%>/update?id=<%=product.getId()%>" class="sherah-pcolor"><%=product.getName()%></a>
                                                                </h4>
                                                                <div class="sherah-product__bottom">
                                                                    <div class="sherah-product__bottom--single">
                                                                        <h5 class="sherah-product-card__price">$<%=product.getPrice()%></h5>	
                                                                        <div class="sherah-product-card__meta sherah-dflex sherah-flex-gap-30">
                                                                            <div class="sherah-product-card__rating sherah-dflex sherah-flex-gap-5">
                                                                                <%
                                                                                    for (int i = 1; i <= product.getRating(); i++) {
                                                                                %>
                                                                                <span class="sherah-color4"><i class="fa fa-star"></i></span>
                                                                                    <% } %>
                                                                                    <%
                                                                                        for (int i = 1; i <= 5 - product.getRating(); i++) {
                                                                                    %>
                                                                                <span class="sherah-color4"><i class="fa-regular fa-star"></i></span>
                                                                                    <% }%>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <a href="#" onclick="handleDelete(<%=product.getId()%>)" class="sherah-btn default">Delete</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- End Single Product -->
                                                    </div>
                                                    <% }%>
                                                </div>
                                                <div class="row mg-top-40">
                                                    <div class="sherah-pagination">
                                                        <ul class="sherah-pagination__list">
                                                            <c:if test="${tag > 1}">
                                                                <li class="sherah-pagination__button"><a href="./products?page=${tag - 1}"><i class="fas fa-angle-left"></i></a></li>
                                                                    </c:if>

                                                            <c:forEach begin="${(tag - 5) < 1 ? 1 : (tag - 5)}" end="${(tag + 5) > endP ? endP : (tag + 5)}" var="i">
                                                                <li class="${tag == i ? "active" : ""}"><a href="./products?page=${i}">${i}</a></li>
                                                                </c:forEach>

                                                            <c:if test="${tag < endP}">
                                                                <li class="sherah-pagination__button"><a href="./products?page=${tag + 1}"><i class="fas fa-angle-right"></i></a></li>
                                                                    </c:if>
                                                        </ul>
                                                    </div>
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

    </div>

    <%@include file="/common-admin/Js.jsp" %>
    <script src="https://cdn.jsdelivr.net/gh/AmagiTech/JSLoader/amagiloader.js">
    </script>
    <script>
        AmagiLoader.show();
        setTimeout(() => {
            AmagiLoader.hide();
        }, 600);
    </script>
    <script>
        function handleDelete(id) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this action!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it !'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Deleted!',
                        text: 'Product has been deleted :3',
                        icon: 'success',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = './delete?id=' + id;
                        }
                    });
                }
                if (!result.isConfirmed) {
                    Swal.fire({
                        title: 'Canceled',
                        text: 'Product is safe for now :)',
                        icon: 'error',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                    });
                }
            });
        }
    </script>
    <script>
        // Release the $ symbol from DataTables
        var dt = $.noConflict(true);

        // Use a different symbol for jQuery UI
        var jq = $.noConflict();
        jq(function () {
            jq("#slider-range").slider({
                range: true,
                min: 0,
                max: 500,
                values: [100, 300],
                slide: function (event, ui) {
                    jq("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);

                }
            });
            jq("#amount").val("$" + jq("#slider-range").slider("values", 0) +
                    " - $" + jq("#slider-range").slider("values", 1));

        });
    </script>
    <script>
        function searchByName(param) {
            var name = param.value;
            $.ajax({
                url: "/zaystore/search-product",
                type: "get",
                data: {
                    txt: name
                },
                success: function (data) {
                    var row = document.getElementById("products");
                    row.innerHTML = data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }
    </script>
</body>
</html>

