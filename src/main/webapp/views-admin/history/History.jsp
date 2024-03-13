<%@page import="com.fpt.prj301.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <title>History Page</title>
        <%@include file="/common-admin/Header.jsp" %>
    </head>
    <%
        User user = (User) session.getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        }
    %>
    <body id="sherah-dark-light">

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
                                <div class="sherah-page-inner sherah-default-bg mg-top-30">
                                    <div class="row">
                                        <div class="col-12">
                                            <!-- Charts Three -->
                                            <div class="charts-main sherah-offset-bg">

                                                <div class="sherah-chart__dropdown--revenue mg-btm-30">
                                                    <!-- Top Heading -->
                                                    <h3 class="sherah-heading__title">Earning Each Month</h3>

                                                    <ul class="sherah-progress-list sherah-progress-list__inline">
                                                        <li>
                                                            <span class="sherah-progress-list__color sherah-color4__bg"></span>
                                                            <p>Amount</p>
                                                        </li>
                                                        <li>
                                                            <span class="sherah-progress-list__color sherah-color1__bg"></span>
                                                            <p>Order</p>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="charts-main__three">
                                                    <div class="sherah-chart__inside sherah-chart__revenue">
                                                        <canvas id="myChart_Visitor"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Charts Three -->
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
    <script src="https://cdn.jsdelivr.net/gh/AmagiTech/JSLoader/amagiloader.js"></script>
    <script>
        AmagiLoader.show();
        setTimeout(() => {
            AmagiLoader.hide();
        }, 600);
    </script>

    <script>
        fetch('/zaystore/chart-data-two')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok: ${response.status}');
                    }
                    return response.json();
                })
                .then(data => {
                    const ctx_market = document.getElementById('myChart_Visitor').getContext('2d');
            
                    var amountData = data.amountData;
                    var orderData = data.orderData;
                    var maxData = Math.max(amountData);
                    
                    const myChart_Visitor = new Chart(ctx_market, {
                        type: 'line',
                        
                        data: {
                            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                            datasets: [{
                                    label: 'Amount',
                                    data: amountData,
                                    backgroundColor: 'transparent',
                                    borderColor: '#F9C200',
                                    borderWidth: 5,
                                    fill: true,
                                    fillColor: '#fff',
                                    tension: 0.5,
                                    pointRadius: 1
                                },
                                {
                                    label: 'Order',
                                    data: orderData,
                                    backgroundColor: 'transparent',
                                    borderColor: '#6176FE',
                                    borderWidth: 5,
                                    fill: true,
                                    tension: 0.5,
                                    fillColor: '#fff',
                                    fill: 'start',
                                    pointRadius: 1
                                }]
                        },

                        options: {
                            maintainAspectRatio: false,
                            responsive: true,
                            scales: {
                                x: {
                                    grid: {
                                        display: false
                                    },
                                    suggestedMax: maxData, suggestedMin: 1000
                                },
                                y: {
                                    suggestedMax: maxData, suggestedMin: 1000,
                                    grid: {
                                        display: true,
                                        color: '#c5c5c573'
                                    },
                                },
                            },
                            plugins: {
                                legend: {
                                    position: 'top',
                                    display: false
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
                            myChart_Visitor.options.scales.y.grid.color = '#E2E7F11C ';
                        } else {
                            myChart_Visitor.options.scales.y.grid.color = '#c5c5c573';
                        }
                        myChart_Visitor.update();
                    }, 500);
                });
    </script>
</body>
</html>
