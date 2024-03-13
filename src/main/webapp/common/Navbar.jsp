<%@page import="com.fpt.prj301.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.fpt.prj301.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="py-1 bg-black">
    <div class="container">
        <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
            <div class="col-lg-12 d-block">
                <div class="row d-flex">
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                        <span class="text">(+84) 398973408</span>
                    </div>
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon icon-envelope"></span></div>
                        <span class="text">zaystore123@gmail.com</span>
                    </div>
                    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                        <span class="text">3-5 Business days delivery &amp; Free Returns</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/home">Zay Store</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="<%=request.getContextPath()%>/home" class="nav-link" style="font-size: .7rem">Home</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/views/about/About.jsp" class="nav-link" style="font-size: .7rem">About</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/views/contact/Contact.jsp" class="nav-link" style="font-size: .7rem">Contact</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/shop?page=1" class="nav-link" style="font-size: .7rem">Shop</a></li>
                
                <%
                    User userNav = (User) session.getAttribute("account");
                    if(userNav == null){
                %>
                
                <li class="nav-item"><a href="<%=request.getContextPath()%>/login" class="nav-link" style="font-size: .7rem">Login</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/register" class="nav-link" style="font-size: .7rem">Register</a></li>
                <% } %>
                
                <li class="nav-item"><a href="<%=request.getContextPath()%>/cart" class="nav-link" style="font-size: .7rem"><span class="icon-shopping_cart"></span>[${cartList == null ? 0 : cartList.size()}]</a></li>
                
                <%
                    if(userNav != null){
                %>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" 
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: .7rem"><span class="icon-user"></span></a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/profile">Profile</a>
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/order-user">Orders</a>
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/log-out">Log Out</a>
                    </div>
                </li>
                
                <% } %>
                
            </ul>
        </div>
    </div>
</nav>
