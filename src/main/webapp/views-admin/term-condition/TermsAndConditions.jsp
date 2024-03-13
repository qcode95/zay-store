<%@page import="com.fpt.prj301.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <title>Terms & Conditions Page</title>
        <%@include file="/common-admin/Header.jsp" %>
    </head>
    <%
        User user = (User) session.getAttribute("account");
        if(user == null){
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
                                                <li class="active"><a href="<%=request.getContextPath()%>/views-admin/term-condition/TermsAndConditions.jsp">Terms & Conditions </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="sherah-page-inner sherah-default-bg sherah-border sherah-basic-page mg-top-25">
                                    <h3>01. Welcome to Our Privacy Policy, What is a Terms and Conditions Agreement?</h3>
                                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomiised words which don't look even slightlys believable. If youare going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.All the Lorem Ipsum gieneratorss on the Internet tend to repeat predefined chunks asnecessary, making this the first true generator on the Internet. It uses a dictionary of over Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>
                                    <h3>02. Why Do Ecommerce Stores Need a Terms and Conditions Agreement?</h3>
                                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomiised words which don't look even slightlys believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.All the Lorem Ipsum gieneratorss on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over Latin words, combined with a handful of model sentence structures.</p>
                                    <ol>
                                        <li>Limitations of liability</li>
                                        <li>Intellectual property/trademark protection</li>
                                        <li>Pricing and payment terms, including shipping, returns, exchanges and cancellations</li>
                                        <li>Product information dispute resolution</li>
                                    </ol>
                                    <h3>03. What to Include in a Terms and Conditions Agreement for Ecommerce Stores</h3>
                                    <p><span class="sherah-color1">If you own or operate an ecommerce store, it's a good idea to have a Terms and Conditions agreement posted on your website, though it's not required by law.</span> A good Terms and Conditions agreement allows you to legally define and enforce the rules your customers must follow to interact with and make purchases from your online store. In addition to this, the Terms an Conditions agreement also gives you a platform to limit your liability in case a product you sell is faulty, and to define what happens in the event of a customer dispute.</p>
                                    <ul>
                                        <li>It can protect you and your business from <span class="sherah-color1">liability</span></li>
                                        <li>It can clarify your online store's <span class="sherah-color1">checkout process</span></li>
                                        <li>It can  <span class="sherah-color1">protect your intellectual property and trademarks, </span>and define acceptable use cases</li>
                                        <li>It can give a detailed account of how you intend on  <span class="sherah-color1">handling and resolving disputes</span></li>
                                        <li>It gives you a platform to <span class="sherah-color1">explain your payment terms, </span>delivery terms, product information, warranties, return/refund policy, order cancellation and so forth</li>
                                    </ul>
                                    <h3>04. Collect personal information</h3>
                                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomiised words which don't look even slightlys believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.All the Lorem Ipsum gieneratorss on the Internet tend to repeat predefined chunks asnecessary, making this the first true generator on the Internet. It uses a dictionary of over Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. </p>
                                    <p>The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.It is a long established fact that a readers will be distracted by the readable content of a pagewhen looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many as desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.</p>
                                    <p class="sherah-last-update sherah-bcolor"><span>Last updated November 13, 2022</span></p>
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
            jQuery(document).ready(function ($) {
                $('[data-countdown]').each(function () {
                    var $this = $(this), finalDate = $(this).data('countdown');
                    $this.countdown(finalDate, function (event) {
                        $this.html(event.strftime(' %H : %M : %S'));
                    });
                });
            });
        </script>
        <script>
            const ctx_side_two = document.getElementById('myChart_Side_One').getContext('2d');
            const myChart_Side_One = new Chart(ctx_side_two, {
                type: 'doughnut',

                data: {
                    labels: [
                        'Total Sold',
                        'Total Cancel',
                        'Total Cancel',
                        'Total Planding'
                    ],
                    datasets: [{
                            label: 'My First Dataset',
                            data: [16, 16, 16, 30],
                            backgroundColor: [
                                '#5356FB',
                                '#F539F8',
                                '#FFC210',
                                '#E3E4FE'
                            ],
                            hoverOffset: 2,
                            borderWidth: 0,
                        }]
                },

                options: {

                    responsive: true,
                    plugins: {
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

            const ctx_side_three = document.getElementById('myChart_Side_Two').getContext('2d');
            const myChart_Side_Two = new Chart(ctx_side_three, {
                type: 'line',

                data: {
                    labels: ['12:00 AM', '04:00 AM', '08:00 AM'],
                    datasets: [{
                            label: 'Visitor',
                            data: [40, 90, 10],
                            backgroundColor: '#D8D8FE',
                            borderColor: '#5356FB',
                            pointRadius: 3,
                            pointBackgroundColor: '#5356FB',
                            pointBorderColor: '#5356FB',
                            borderWidth: 4,
                            tension: 0.9,
                            fill: true,
                            fillColor: '#fff',

                        }]
                },

                options: {
                    responsive: true,
                    scales: {
                        x: {
                            grid: {
                                display: false,
                                drawBorder: false,
                            },

                        },
                        y: {
                            grid: {
                                display: false,
                                drawBorder: false,
                            },
                            ticks: {
                                display: false
                            }
                        },
                    },

                    plugins: {
                        legend: {
                            position: 'top',
                            display: false,
                        },
                        title: {
                            display: false,
                            text: 'Visitor: 2k'
                        }
                    }
                }
            });
        </script>

    </body>
</html>

