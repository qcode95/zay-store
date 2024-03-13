<%@page import="com.fpt.prj301.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>        
        <title>Admin Page</title>
        <%@include file="/common-admin/Header.jsp" %>
    </head>

    <%
        User user = (User) session.getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        }

        int countProduct = (int) request.getAttribute("countProduct");
        int countUser = (int) request.getAttribute("countUser");
        int countOrder = (int) request.getAttribute("countOrder");
        int countTransaction = (int) request.getAttribute("countTransaction");

        int sumAmount = (int) request.getAttribute("sumAmount");
    %>

    <body id="sherah-dark-light">

        <div class="sherah-body-area">

            <%@include file="/common-admin/Sidebar.jsp" %>

            <%@include file="/common-admin/Navbar.jsp" %>

            <!-- sherah Dashboard -->
            <section class="sherah-adashboard sherah-show">
                <div class="container">
                    <div class="row">	
                        <div class="col-12 sherah-main__column">
                            <div class="sherah-body">
                                <!-- Dashboard Inner -->
                                <div class="sherah-dsinner">
                                    <div class="row mg-top-10">
                                        <div class="col-lg-3 col-md-6 col-12">
                                            <!-- Progress Card -->
                                            <div class="sherah-progress-card sherah-border sherah-default-bg mg-top-30">
                                                <div class="sherah-progress-card__icon sherah-default-bg sherah-border">
                                                    <svg class="sherah-color2__fill" xmlns="http://www.w3.org/2000/svg" width="26.672" height="30.636" viewBox="0 0 26.672 30.636">
                                                    <g id="Group_70" data-name="Group 70" transform="translate(-272.518 -5.918)">
                                                    <path id="Path_251" data-name="Path 251" d="M285.855,36.554q-5.443,0-10.885,0a2.152,2.152,0,0,1-2.447-2.412q-.01-9.39.014-18.78a3.035,3.035,0,0,1,.383-1.406c1.292-2.312,2.644-4.59,3.947-6.9a2.07,2.07,0,0,1,1.993-1.141q7,.028,13.995,0a2.075,2.075,0,0,1,1.991,1.147c1.327,2.338,2.7,4.652,4.022,6.991a2.4,2.4,0,0,1,.306,1.124q.028,9.48.011,18.959a2.152,2.152,0,0,1-2.445,2.414Q291.3,36.556,285.855,36.554ZM297.39,15.348H274.351c-.012.211-.03.387-.031.562q0,9.057-.011,18.113c0,.577.186.746.758.744q10.73-.025,21.461-.011c.858,0,.86,0,.86-.861q0-8.937,0-17.874ZM284.969,7.724c-2.077,0-4.089-.01-6.1.017a.778.778,0,0,0-.516.374c-.971,1.646-1.92,3.305-2.871,4.963a2.945,2.945,0,0,0-.152.376h9.64Zm11.423,5.748a1.4,1.4,0,0,0-.08-.258c-1-1.741-2-3.485-3.029-5.212a.773.773,0,0,0-.576-.267c-1.832-.02-3.664-.013-5.5-.009a2.737,2.737,0,0,0-.373.048v5.7Z" />
                                                    <path id="Path_252" data-name="Path 252" d="M351.281,143.152l3.6-3.605c.141-.141.275-.288.426-.418a.889.889,0,1,1,1.262,1.253c-.4.439-.837.851-1.259,1.273q-1.582,1.583-3.166,3.164c-.63.627-1.05.632-1.669.02-.636-.629-1.274-1.258-1.9-1.9a.886.886,0,0,1-.063-1.365.906.906,0,0,1,1.328.1C350.317,142.133,350.762,142.615,351.281,143.152Z" transform="translate(-66.652 -117.042)" />
                                                    </g>
                                                    </svg>
                                                </div>
                                                <div class="sherah-progress-card__content">
                                                    <div class="sherah-progress-card__heading">
                                                        <span class="sherah-pcolor">Products</span>
                                                        <h4 class="sherah-progress-card__title"><b class="count-animate"><%=countProduct%> <br> Product</b></h4>	
                                                    </div>
                                                    <div class="sherah-progress-card__button">
                                                        <a href="<%=request.getContextPath()%>/products?page=1" class="sherah-see-all">View all products</a>
                                                    </div>

                                                </div>
                                            </div>
                                            <!-- End Progress Card -->
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-12">
                                            <!-- Progress Card -->
                                            <div class="sherah-progress-card sherah-border sherah-default-bg mg-top-30">
                                                <div class="sherah-progress-card__icon sherah-default-bg sherah-border">
                                                    <svg class="sherah-color1__fill" xmlns="http://www.w3.org/2000/svg" width="35.176" height="30.636" viewBox="0 0 35.176 30.636">
                                                    <g id="Group_1177" data-name="Group 1177" transform="translate(-207.977 -44.521)">
                                                    <path id="Path_253" data-name="Path 253" d="M218.474,150.774c3.084-3.627,11.1-3.619,14.16-.016.113-.172.217-.333.324-.493a4.348,4.348,0,0,1,3.515-2.1,12.57,12.57,0,0,1,3.269.165,4.445,4.445,0,0,1,3.4,4.375c.019,2.426.01,4.853,0,7.28a2.083,2.083,0,0,1-2.259,2.276c-1.808.022-3.617.016-5.425,0-.419,0-.63.082-.767.542a2.316,2.316,0,0,1-2.413,1.657c-1.579.019-3.159.006-4.739.006q-4.224,0-8.447,0a2.493,2.493,0,0,1-2.761-1.87.806.806,0,0,0-.625-.312c-1.739-.025-3.479-.012-5.219-.015-1.79,0-2.51-.716-2.511-2.482,0-2.289,0-4.578,0-6.868a4.633,4.633,0,0,1,4.607-4.8c.343-.014.687.007,1.03-.008A4.854,4.854,0,0,1,218.474,150.774Zm7.083,11.624c2.172,0,4.345,0,6.517,0,.424,0,.705-.08.7-.594-.023-1.966.05-3.937-.055-5.9a5.977,5.977,0,0,0-4.737-5.523,15.559,15.559,0,0,0-3.272-.2,6.2,6.2,0,0,0-6.351,6.325c-.023,1.692.02,3.385-.017,5.076-.014.644.219.826.836.818C221.3,162.381,223.431,162.4,225.558,162.4Zm15.5-2.242c0-2.623.055-5.2-.025-7.779a2.373,2.373,0,0,0-2.232-2.155,14.355,14.355,0,0,0-1.85-.035,2.591,2.591,0,0,0-2.6,3.3,21.233,21.233,0,0,1,.49,5.781c0,.287,0,.575,0,.885Zm-24.813,0c.014-.264.033-.486.035-.708a22.529,22.529,0,0,1,.495-5.987,2.59,2.59,0,0,0-2.632-3.277c-.457-.015-.915-.013-1.372,0a2.581,2.581,0,0,0-2.727,2.773c-.007,2.2,0,4.392,0,6.588,0,.2.021.4.033.612Z" transform="translate(0 -89.312)"/>
                                                    <path id="Path_254" data-name="Path 254" d="M298.589,44.523a5.972,5.972,0,1,1-6.069,5.89A5.967,5.967,0,0,1,298.589,44.523Zm-.1,2.068a3.9,3.9,0,1,0,3.912,3.931A3.889,3.889,0,0,0,298.486,46.591Z" transform="translate(-72.929 0)"/>
                                                    <path id="Path_255" data-name="Path 255" d="M224.343,84.1a3.77,3.77,0,1,1,3.749-3.755A3.764,3.764,0,0,1,224.343,84.1Zm-.03-2.066a1.7,1.7,0,1,0-1.693-1.7A1.688,1.688,0,0,0,224.313,82.03Z" transform="translate(-10.849 -27.636)"/>
                                                    <path id="Path_256" data-name="Path 256" d="M400.423,76.561a3.769,3.769,0,1,1-3.855,3.644A3.755,3.755,0,0,1,400.423,76.561Zm1.613,3.752a1.7,1.7,0,1,0-1.67,1.719A1.685,1.685,0,0,0,402.036,80.312Z" transform="translate(-162.683 -27.637)"/>
                                                    </g>
                                                    </svg>
                                                </div>
                                                <div class="sherah-progress-card__content">
                                                    <div class="sherah-progress-card__heading">
                                                        <span class="sherah-pcolor">Users</span>
                                                        <h4 class="sherah-progress-card__title"><b class="count-animate"><%=countUser%> <br> User</b></h4>	
                                                    </div>
                                                    <div class="sherah-progress-card__button">
                                                        <a href="<%=request.getContextPath()%>/users" class="sherah-see-all">View all users</a>
                                                    </div>

                                                </div>
                                            </div>
                                            <!-- End Progress Card -->
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-12">
                                            <!-- Progress Card -->
                                            <div class="sherah-progress-card sherah-border sherah-default-bg mg-top-30">
                                                <div class="sherah-progress-card__icon sherah-default-bg sherah-border">
                                                    <svg class="sherah-color3__fill" xmlns="http://www.w3.org/2000/svg" width="30.359" height="30.366" viewBox="0 0 30.359 30.366">
                                                    <g id="Group_69" data-name="Group 69" transform="translate(-242.991 -23.995)">
                                                    <path id="Path_244" data-name="Path 244" d="M249.517,188.942c.854.139,1.633.271,2.413.391.448.069.945.14.856.737s-.609.506-1.042.441c-.721-.107-1.44-.232-2.227-.36,0,.35,0,.662,0,.974a.622.622,0,0,1-.693.7q-2.579,0-5.158,0c-.464,0-.674-.266-.674-.718q0-5.217,0-10.434c0-.494.264-.711.745-.709,1.166,0,2.332-.013,3.5.008a2.439,2.439,0,0,1,2.017,1.223c.265-.168.508-.33.758-.479a4.631,4.631,0,0,1,5.791.613,1.642,1.642,0,0,0,1.167.425c1.581-.027,3.162-.011,4.743-.01,2.125,0,3.145,1.373,2.527,3.394a.879.879,0,0,0,.027.213c.215-.144.406-.249.572-.386,1.524-1.258,3.038-2.527,4.565-3.781a2.38,2.38,0,1,1,3.021,3.675c-2.271,1.779-4.522,3.583-6.826,5.317a8.274,8.274,0,0,1-6.68,1.494c-.408-.072-.817-.143-1.227-.2s-.834-.176-.778-.693c.062-.571.521-.554.957-.488.547.082,1.092.172,1.638.255a7.061,7.061,0,0,0,5.569-1.452c2.177-1.674,4.331-3.378,6.491-5.074a1.2,1.2,0,1,0-1.5-1.842c-1.6,1.319-3.188,2.656-4.8,3.96a1.569,1.569,0,0,1-.9.338c-2.391.027-4.782.021-7.173.006a1.128,1.128,0,0,1-.691-.225.59.59,0,0,1-.085-.577,1.007,1.007,0,0,1,.663-.361c1.462-.032,2.924-.016,4.387-.016.2,0,.4.007.593,0a1.191,1.191,0,0,0,1.208-1.2,1.178,1.178,0,0,0-1.239-1.165c-1.877-.012-3.755.014-5.632-.022a2.192,2.192,0,0,1-.992-.381c-.387-.231-.71-.567-1.094-.8-1.629-1.006-3.114-.64-4.628.712a.708.708,0,0,0-.162.356,1.561,1.561,0,0,0-.007.354C249.517,185.066,249.517,186.98,249.517,188.942Zm-1.189,1.668c0-2.792.005-5.514,0-8.236a1.1,1.1,0,0,0-.946-1.183c-1.053-.058-2.111-.016-3.154-.016v9.435Z" transform="translate(0 -137.466)" />
                                                    <path id="Path_245" data-name="Path 245" d="M336.414,31.727A7.71,7.71,0,1,1,328.756,24,7.725,7.725,0,0,1,336.414,31.727Zm-8.331,4.064a2.433,2.433,0,0,1-1.723-1.929c-.08-.415-.053-.847.453-.942s.656.256.724.71a1.161,1.161,0,0,0,1.579.955,1.183,1.183,0,0,0,.762-1.268,1.212,1.212,0,0,0-1.2-1.019,2.371,2.371,0,0,1-2.274-1.821c-.3-1.19.281-2.2,1.677-2.886V25.243a6.486,6.486,0,0,0,0,12.919Zm1.24,2.387a6.524,6.524,0,0,0,5.892-6.927c-.2-3.155-3.04-6.041-5.886-5.971v2.34a2.421,2.421,0,0,1,1.741,2.139.593.593,0,0,1-.507.741c-.4.056-.619-.185-.672-.578a1.991,1.991,0,0,0-.062-.348,1.187,1.187,0,0,0-1.286-.822,1.185,1.185,0,0,0-.071,2.335,3.567,3.567,0,0,0,.413.031,2.368,2.368,0,0,1,.836,4.5c-.136.067-.276.126-.4.181Z" transform="translate(-68.751 0)"/>
                                                    <path id="Path_246" data-name="Path 246" d="M338.739,264.607c-.144-.236-.43-.5-.392-.7a.836.836,0,0,1,.6-.519c.156-.017.494.352.5.552,0,.225-.281.452-.44.679Z" transform="translate(-84.043 -210.998)" />
                                                    </g>
                                                    </svg>
                                                </div>
                                                <div class="sherah-progress-card__content">
                                                    <div class="sherah-progress-card__heading">
                                                        <span class="sherah-pcolor">Orders</span>
                                                        <h4 class="sherah-progress-card__title"><b class="count-animate"><%=countOrder%> <br> Order</b></h4>	
                                                    </div>
                                                    <div class="sherah-progress-card__button">
                                                        <a href="<%=request.getContextPath()%>/orders" class="sherah-see-all">View all orders</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Progress Card -->
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-12">
                                            <!-- Progress Card -->
                                            <div class="sherah-progress-card sherah-border sherah-default-bg mg-top-30">
                                                <div class="sherah-progress-card__icon sherah-default-bg sherah-border">
                                                    <svg class="sherah-color4__fill" xmlns="http://www.w3.org/2000/svg" width="35.176" height="30.636" viewBox="0 0 35.176 30.636">
                                                    <g id="Group_1177" data-name="Group 1177" transform="translate(-207.977 -44.521)">
                                                    <path id="Path_253" data-name="Path 253" d="M218.474,150.774c3.084-3.627,11.1-3.619,14.16-.016.113-.172.217-.333.324-.493a4.348,4.348,0,0,1,3.515-2.1,12.57,12.57,0,0,1,3.269.165,4.445,4.445,0,0,1,3.4,4.375c.019,2.426.01,4.853,0,7.28a2.083,2.083,0,0,1-2.259,2.276c-1.808.022-3.617.016-5.425,0-.419,0-.63.082-.767.542a2.316,2.316,0,0,1-2.413,1.657c-1.579.019-3.159.006-4.739.006q-4.224,0-8.447,0a2.493,2.493,0,0,1-2.761-1.87.806.806,0,0,0-.625-.312c-1.739-.025-3.479-.012-5.219-.015-1.79,0-2.51-.716-2.511-2.482,0-2.289,0-4.578,0-6.868a4.633,4.633,0,0,1,4.607-4.8c.343-.014.687.007,1.03-.008A4.854,4.854,0,0,1,218.474,150.774Zm7.083,11.624c2.172,0,4.345,0,6.517,0,.424,0,.705-.08.7-.594-.023-1.966.05-3.937-.055-5.9a5.977,5.977,0,0,0-4.737-5.523,15.559,15.559,0,0,0-3.272-.2,6.2,6.2,0,0,0-6.351,6.325c-.023,1.692.02,3.385-.017,5.076-.014.644.219.826.836.818C221.3,162.381,223.431,162.4,225.558,162.4Zm15.5-2.242c0-2.623.055-5.2-.025-7.779a2.373,2.373,0,0,0-2.232-2.155,14.355,14.355,0,0,0-1.85-.035,2.591,2.591,0,0,0-2.6,3.3,21.233,21.233,0,0,1,.49,5.781c0,.287,0,.575,0,.885Zm-24.813,0c.014-.264.033-.486.035-.708a22.529,22.529,0,0,1,.495-5.987,2.59,2.59,0,0,0-2.632-3.277c-.457-.015-.915-.013-1.372,0a2.581,2.581,0,0,0-2.727,2.773c-.007,2.2,0,4.392,0,6.588,0,.2.021.4.033.612Z" transform="translate(0 -89.312)"/>
                                                    <path id="Path_254" data-name="Path 254" d="M298.589,44.523a5.972,5.972,0,1,1-6.069,5.89A5.967,5.967,0,0,1,298.589,44.523Zm-.1,2.068a3.9,3.9,0,1,0,3.912,3.931A3.889,3.889,0,0,0,298.486,46.591Z" transform="translate(-72.929 0)"/>
                                                    <path id="Path_255" data-name="Path 255" d="M224.343,84.1a3.77,3.77,0,1,1,3.749-3.755A3.764,3.764,0,0,1,224.343,84.1Zm-.03-2.066a1.7,1.7,0,1,0-1.693-1.7A1.688,1.688,0,0,0,224.313,82.03Z" transform="translate(-10.849 -27.636)"/>
                                                    <path id="Path_256" data-name="Path 256" d="M400.423,76.561a3.769,3.769,0,1,1-3.855,3.644A3.755,3.755,0,0,1,400.423,76.561Zm1.613,3.752a1.7,1.7,0,1,0-1.67,1.719A1.685,1.685,0,0,0,402.036,80.312Z" transform="translate(-162.683 -27.637)"/>
                                                    </g>
                                                    </svg>
                                                </div>
                                                <div class="sherah-progress-card__content">
                                                    <div class="sherah-progress-card__heading">
                                                        <span class="sherah-pcolor">Transactions</span>
                                                        <h4 class="sherah-progress-card__title"><b class="count-animate"><%=countTransaction%> Transaction</b></h4>	
                                                    </div>
                                                    <div class="sherah-progress-card__button">
                                                        <a href="<%=request.getContextPath()%>/transactions" class="sherah-see-all">View all transactions</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Progress Card -->
                                        </div>
                                    </div>
                                    <div class="row sherah-gap-30">
                                        <div class="col-lg-6 col-12">
                                            <!-- Charts Two -->
                                            <div class="charts-main sherah-default-bg charts-home-two sherah-border mg-top-30">
                                                <div class="charts-main__heading  mg-btm-20 charts-main__heading--v2">
                                                    <h3 class="sherah-heading__title">Total Orders</h3>
                                                    <div class="sherah-charts-tabs">
                                                        <!-- Tab List -->
                                                        <div class="sherah-charts-tabs__list list-group " id="list-tab" role="tablist">
                                                            <a class="list-group-item" data-bs-toggle="list" href="#sherah_tab1" role="tab" href="profile.html">7 Days</a>
                                                            <a class="list-group-item active" data-bs-toggle="list" href="#sherah_tab1" role="tab">Monthly</a>
                                                            <a class="list-group-item" data-bs-toggle="list" href="#sherah_tab1" role="tab">Yearly</a>
                                                        </div>
                                                    </div>
                                                    <!-- End Topbar -->
                                                </div>
                                                <div class="sherah-flex-between mg-btm-30">
                                                    <div class="charts-main__middle m-0">
                                                        <ul class="sherah-progress-list sherah-progress-list__bg sherah-progress-list__inline sherah-gap-50">
                                                            <li>
                                                                <span class="sherah-progress-list__color sherah-color1__bg"></span>
                                                                <p>Orders<span><%=countOrder%> Order(s)</span></p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="tab-content" id="nav-tabContent">
                                                    <div class="tab-pane fade show active" id="sherah_tab1" role="tabpanel" aria-labelledby="sherah_tab1">
                                                        <div class="sherah-chart__inside sherah-chart__total--sales">
                                                            <canvas id="myChart_Total_Sales_Home"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Charts Two -->
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-12">
                                                    <!-- Sherah Order Card -->
                                                    <div class="sherah-order-card sherah-default-bg sherah-border sherah-flex-between mg-top-30">
                                                        <div class="sherah-order-card__first">
                                                            <p class="sherah-order-card__text mg-btm-10">Recent Transaction <span class="sherah-bcolor"><%=countTransaction%></span></p>
                                                            <div class="sherah-chart__inside sherah-chart__inside--aorder">
                                                                <canvas id="myChart_active_creators"></canvas>
                                                            </div>
                                                        </div>
                                                        <div class="sherah-progress__single circle__one" data-value="0.115">
                                                        </div>
                                                    </div>
                                                    <!-- End Sherah Order Card -->
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-12">
                                                    <!-- Sherah Order Card -->
                                                    <div class="sherah-order-card sherah-default-bg sherah-border sherah-flex-between mg-top-30">
                                                        <div class="sherah-order-card__first">
                                                            <p class="sherah-order-card__text mg-btm-10">Recent <br>Order <span class="sherah-bcolor"><%=countOrder%></span></p>
                                                            <div class="sherah-chart__inside sherah-chart__inside--aorder">
                                                                <canvas id="myChart_recent_orders"></canvas>
                                                            </div>
                                                        </div>
                                                        <div class="sherah-progress__single circle__two" data-value="0.115"></div>
                                                    </div>
                                                    <!-- End Sherah Order Card -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">               
                                            <!-- Charts One -->
                                            <div class="charts-main sherah-default-bg charts-home-two sherah-border mg-top-30">
                                                <!-- Top Heading -->
                                                <div class="charts-main__heading  mg-btm-20">
                                                    <h3 class="sherah-heading__title">Total Amount Each Month</h3>
                                                </div>
                                                <div class="sherah-flex-between mg-btm-30">
                                                    <div class="charts-main__middle m-0">
                                                        <ul class="sherah-progress-list sherah-progress-list__bg sherah-progress-list__inline sherah-gap-50">
                                                            <li>
                                                                <span class="sherah-progress-list__color sherah-color4__bg"></span>
                                                                <p>Amount<span>$<%=sumAmount%></span></p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- Chart Dropdown Menu -->
                                                    <div class="sherah-chart__dropdown sherah-chart__dropdown--bg">
                                                        <ul  class="nav nav-tabs sherah-dropdown__list" id="nav-tab" role="tablist">
                                                            <li class="nav-item dropdown">
                                                                <a class="sherah-sidebar_btn sherah-offset-bg  sherah-border sherah-heading__tabs nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Whole Year &nbsp; <svg width="13" height="6" viewBox="0 0 13 6" fill="none" xmlns="http://www.w3.org/2000/svg"><path opacity="0.7" d="M12.4124 0.247421C12.3327 0.169022 12.2379 0.106794 12.1335 0.0643287C12.0291 0.0218632 11.917 0 11.8039 0C11.6908 0 11.5787 0.0218632 11.4743 0.0643287C11.3699 0.106794 11.2751 0.169022 11.1954 0.247421L7.27012 4.07837C7.19045 4.15677 7.09566 4.219 6.99122 4.26146C6.88678 4.30393 6.77476 4.32579 6.66162 4.32579C6.54848 4.32579 6.43646 4.30393 6.33202 4.26146C6.22758 4.219 6.13279 4.15677 6.05312 4.07837L2.12785 0.247421C2.04818 0.169022 1.95338 0.106794 1.84895 0.0643287C1.74451 0.0218632 1.63249 0 1.51935 0C1.40621 0 1.29419 0.0218632 1.18975 0.0643287C1.08531 0.106794 0.990517 0.169022 0.910844 0.247421C0.751218 0.404141 0.661621 0.616141 0.661621 0.837119C0.661621 1.0581 0.751218 1.2701 0.910844 1.42682L4.84468 5.26613C5.32677 5.73605 5.98027 6 6.66162 6C7.34297 6 7.99647 5.73605 8.47856 5.26613L12.4124 1.42682C12.572 1.2701 12.6616 1.0581 12.6616 0.837119C12.6616 0.616141 12.572 0.404141 12.4124 0.247421Z"></path></svg></a>
                                                                <ul class="dropdown-menu sherah-sidebar_dropdown">
                                                                    <a class="list-group-item" data-bs-toggle="list" data-bs-target="#sherah-chart__t1" role="tab">5 Months</a>
                                                                    <a class="list-group-item" data-bs-toggle="list" data-bs-target="#sherah-chart__t1" role="tab">7 Months</a>
                                                                    <a class="list-group-item"  data-bs-toggle="list" data-bs-target="#sherah-chart__t1" role="tab">Whole Year</a>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- End Chart Dropdown Menu -->
                                                </div>
                                                <div class="charts-main__one">
                                                    <div class="tab-content" id="nav-tabContent">
                                                        <div class="tab-pane fade show active" id="sherah-chart__t1" role="tabpanel" aria-labelledby="sherah-chart__t1">
                                                            <div class="sherah-chart__inside sherah-chart__monthly--states">
                                                                <!-- Chart One -->
                                                                <canvas id="myChart_one_monthly"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Charts One -->
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-12">
                                        <!-- Charts One -->
                                        <div class="charts-main charts-home-four sherah-default-bg sherah-border mg-top-30">
                                            <!-- Top Heading -->
                                            <div class="charts-main__heading  mg-btm-30">
                                                <h4 class="sherah-heading__title">Sales by Countrys</h4>
                                            </div>
                                            <div class="sherah-vector-map mg-top-20">
                                                <div id="sherah-map"></div>
                                            </div>
                                        </div>
                                        <!-- End Charts One -->
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
        <script src="https://cdn.jsdelivr.net/gh/AmagiTech/JSLoader/amagiloader.js"></script>
        <script>
            AmagiLoader.show();
            setTimeout(() => {
                AmagiLoader.hide();
            }, 600);
        </script>
        <script>
            $.noConflict();
            $(document).ready(function () {
                $('#sherah-map').vectorMap({
                    map: 'world_mill_en',
                    backgroundColor: 'transparent',
                    panControl: false,
                    zoomControl: false,
                    regionStyle: {
                        initial: {
                            fill: '#C5C5C5'
                        },
                        hover: {
                            fill: '#09AD95'
                        }
                    },
                    showTooltip: true,

                });

            });
        </script>
        <script>
            fetch('/zaystore/chart-data')
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok: ${response.status}');
                        }
                        return response.json();
                    })
                    .then(data => {

                        var ctx = document.getElementById('myChart_one_monthly').getContext('2d');

                        var myChart_one_monthly = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                                datasets: [{
                                        label: 'Amount',
                                        data: data,
                                        backgroundColor: '#F9C200',
                                        fill: true,
                                        tension: 0.4,
                                        borderWidth: 0,
                                        borderSkipped: false,
                                        borderRadius: 4,
                                        barPercentage: 0.7,
                                        categoryPercentage: 0.7,
                                    }]
                            },
                            options: {
                                intersect: false,
                                maintainAspectRatio: false,
                                responsive: true,
                                scales: {
                                    x: {
                                        ticks: {
                                        },
                                        grid: {
                                            display: false,
                                        },

                                    },
                                    y: {
                                        ticks: {
                                            callback: function (value, index, values) {
                                                return value;
                                            }
                                        },
                                        grid: {
                                            drawBorder: false,
                                            color: '#c5c5c573',
                                            borderDash: [10, 10]
                                        },
                                    },

                                },
                                plugins: {
                                    tooltip: {
                                        padding: 10,
                                        displayColors: true,
                                        yAlign: 'bottom',
                                        backgroundColor: '#fff',
                                        titleColor: '#000',
                                        titleFont: {weight: 'normal'},
                                        bodyColor: '#2F3032',
                                        cornerRadius: 12,
                                        font: {
                                            size: 14
                                        },
                                        caretSize: 9,
                                        bodySpacing: 100,

                                    },
                                    legend: {
                                        position: 'top',
                                        display: false,
                                    },
                                    title: {
                                        display: false,
                                        text: 'Sell History'
                                    }
                                }
                            }
                        });
                        setInterval(() => {
                            if (document.body.classList.contains('active')) {
                                myChart_one_monthly.options.scales.y.grid.color = '#E2E7F11C ';
                            } else {
                                myChart_one_monthly.options.scales.y.grid.color = '#c5c5c573 ';
                            }
                            myChart_one_monthly.update();
                        }, 500);
                    })
                    .catch(error => {
                        console.error('Fetch error:', error);
                    });
        </script>
        <script>
            fetch('/zaystore/chart-data-one')
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok: ${response.status}');
                        }
                        return response.json();
                    })
                    .then(data => {
                        const ctx_two = document.getElementById('myChart_Total_Sales_Home').getContext('2d');

                        const gradientBg = ctx_two.createLinearGradient(0, 0, 0, 190);

                        gradientBg.addColorStop(0, 'rgba(97, 118, 254, 0.43)');
                        gradientBg.addColorStop(1, 'rgba(97, 118, 254, 0)');
                        
                        const maxDataValue = Math.max(data);
                        
                        const myChart_Total_Sales_Home = new Chart(ctx_two, {
                            type: 'line',
                            data: {
                                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                                datasets: [{
                                        label: 'Order',
                                        data: data,
                                        backgroundColor: gradientBg,
                                        borderColor: '#6176FE',
                                        pointRadius: 1,
                                        tension: 0.5,
                                        borderWidth: 4,
                                        fill: true,
                                        fillColor: '#fff',
                                    }]
                            },
                            options: {

                                maintainAspectRatio: false,
                                responsive: true,
                                scales: {
                                    x: {
                                        grid: {
                                            display: true,
                                            color: '#c5c5c573',
                                        },
                                        suggestedMax: maxDataValue, suggestedMin: 80,

                                    },
                                    y: {
                                        suggestedMax: maxDataValue, suggestedMin: 80,
                                        grid: {
                                            display: true,

                                            color: '#c5c5c573',
                                            borderDash: [10, 10]
                                        },
                                    },
                                },

                                plugins: {
                                    legend: {
                                        position: 'bottom',
                                        display: false,
                                    },
                                    title: {
                                        display: false,
                                    }
                                }
                            }
                        });
                        setInterval(() => {
                            if (document.body.classList.contains('active')) {
                                myChart_Total_Sales_Home.options.scales.x.grid.color = '#E2E7F11C ';
                                myChart_Total_Sales_Home.options.scales.y.grid.color = '#E2E7F11C ';
                            } else {
                                myChart_Total_Sales_Home.options.scales.x.grid.color = '#c5c5c573 ';
                                myChart_Total_Sales_Home.options.scales.y.grid.color = '#c5c5c573 ';
                            }
                            myChart_Total_Sales_Home.update();
                        }, 500);
                    });
        </script>
        <script>
            new CircleProgress('.circle__one', {
                max: 1000,
                value: <%=countTransaction%>,
            }
            );

            new CircleProgress('.circle__two', {
                max: 1000,
                value: <%=countOrder%>,

            });
        </script>
    </body>
</html>
