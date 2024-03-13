<%@page import="com.fpt.prj301.service.impl.ProductServiceImpl"%>
<%@page import="com.fpt.prj301.model.Brand"%>
<%@page import="com.fpt.prj301.model.Category"%>
<%@page import="com.fpt.prj301.model.Product"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shop Page</title>
        <%@include file="/common/Header.jsp" %>
    </head>

    <%
        List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
        List<Category> listCategory = (List<Category>) request.getAttribute("listCategory");
        List<Brand> listBrand = (List<Brand>) request.getAttribute("listBrand");
        int id = (int) request.getAttribute("id");
        ProductServiceImpl ps = new ProductServiceImpl();
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
                        <h1 class="mb-0 bread">Shop</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-lg-10 order-md-last">
                        <div class="row">

                            <%
                                for (Product product : listProduct) {
                            %>

                            <div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">
                                <div class="product d-flex flex-column">
                                    <a href="<%=product.getQuantity() != 0 ? request.getContextPath()+"/shopping?id="+product.getId() : request.getContextPath()+"/product-sold-out?id="+product.getId()%>" 
                                       class="img-prod">
                                        <img class="img-fluid" src=".<%=product.getImage()%>" style="width: 300px; height: 400px;"
                                             alt="Product's Image">
                                        <%
                                            if(product.getQuantity() == 0){
                                        %>
                                            <span class="status">Sold Out</span>
                                        <% } %>
                                        <div class="overlay"></div>
                                    </a>
                                    <div class="text py-3 pb-4 px-3">
                                        <div class="d-flex">
                                            <div class="cat">
                                                <span><%=ps.GetCategoryName(product.getCategory())%></span>
                                            </div>
                                            <div class="rating">
                                                <p class="text-right mb-0">

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
                                            </div>
                                        </div>
                                        <h3><a href="<%=product.getQuantity() != 0 ? request.getContextPath()+"/shopping?id="+product.getId() : request.getContextPath()+"/product-sold-out?id="+product.getId()%>">
                                                <%=product.getName()%></a></h3>
                                        <div class="pricing">
                                            <p class="price"><span>$ <%=product.getPrice()%></span></p>
                                        </div>
                                        <p class="bottom-area d-flex px-3">
                                            <%
                                                if(product.getQuantity() != 0){
                                            %>
                                            <a href="<%=request.getContextPath()%>/shopping?id=<%=product.getId()%>" class="add-to-cart text-center py-2 mr-1"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
                                            <a href="<%=request.getContextPath()%>/shopping?id=<%=product.getId()%>" class="buy-now text-center py-2">Buy now<span><i class="ion-ios-cart ml-1"></i></span></a>
                                            <% } %>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <%
                                }
                            %>

                        </div>
                        <!--Pagination-->
                        <div class="row mt-5">
                            <div class="col text-center">
                                <div class="block-27">
                                    <ul>
                                        <c:if test="${tag > 1}">
                                            <li><a href="<%=request.getContextPath()%>/shop-category?cid=<%=id%>&page=${tag - 1}">&lt;</a></li>
                                            </c:if>

                                        <c:forEach begin="${(tag - 5) < 1 ? 1 : (tag - 5)}" end="${(tag + 5) > endP ? endP : (tag + 5)}" var="i">
                                            <li class="${tag == i ? "active" : ""}">
                                                <a href="./shop-category?cid=<%=id%>&page=${i}" style="text-decoration: none;">${i}</a>
                                            </li>
                                        </c:forEach>

                                        <c:if test="${tag < endP}">
                                            <li><a href="<%=request.getContextPath()%>/shop-category?cid=<%=id%>&page=${tag + 1}">&gt;</a></li>
                                            </c:if>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End Pagination-->                

                    <div class="col-md-4 col-lg-2">
                        <div class="sidebar">
                            <div class="sidebar-box-2">
                                <a href="<%=request.getContextPath()%>/shop?page=1"><h2 class="heading">Products</h2></a>
                                <div class="fancy-collapse-panel">
                                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="headingOne">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Category
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                                <div class="panel-body">
                                                    <ul>

                                                        <%
                                                            for (Category category : listCategory) {
                                                        %>

                                                        <li>
                                                            <a href="<%=request.getContextPath()%>/shop-category?cid=<%=category.getId()%>&page=1">
                                                                <%=category.getName()%></a>
                                                        </li>

                                                        <%
                                                            }
                                                        %>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="fancy-collapse-panel">
                                    <div class="panel-group" id="accordion1" role="tablist" aria-multiselectable="true">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="headingOne">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">Brand
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                                <div class="panel-body">
                                                    <ul>

                                                        <%
                                                            for (Brand brand : listBrand) {
                                                        %>

                                                        <li>
                                                            <a href="<%=request.getContextPath()%>/shop-brand?bid=<%=brand.getId()%>&page=1">
                                                                <%=brand.getName()%></a>
                                                        </li>

                                                        <%
                                                            }
                                                        %>

                                                    </ul>
                                                </div>
                                            </div>
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
        <%@include file="/common/Instagram.jsp" %>
        <%@include file="/common/Footer.jsp" %>
        <%@include file="/common/Js.jsp" %>
    </body>
</html>
