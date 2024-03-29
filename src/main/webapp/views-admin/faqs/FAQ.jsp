<%@page import="com.fpt.prj301.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <title>FAQs Page</title>
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
                                                <li class="active"><a href="<%=request.getContextPath()%>/views-admin/faqs/FAQ.jsp">FAQs</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="sherah-page-inner sherah-default-bg sherah-border pt-0 mg-top-25">
                                    <div class="sherah-accordion accordion accordion-flush" id="sherah-accordion">

                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-12">
                                                <!-- End Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-1">
                                                        <button class="accordion-button collapsed sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseTwo" aria-expanded="false" aria-controls="ac-collapseOne">1. What is the status of my order?</button>
                                                    </h2>
                                                    <div id="ac-collapseTwo" class="accordion-collapse collapse" aria-labelledby="sheraht-1" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->
                                                <!-- Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-2">
                                                        <button class="accordion-button collapsed  sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseThree" aria-expanded="false" aria-controls="ac-collapseTwo">2. How long does it take to ship my order?</button>
                                                    </h2>
                                                    <div id="ac-collapseThree" class="accordion-collapse collapse" aria-labelledby="sheraht-2" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->
                                                <!-- Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-3">
                                                        <button class="accordion-button   sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseThree2" aria-expanded="true" aria-controls="ac-collapseThree2">3. What payment methods do you accept?</button>
                                                    </h2>
                                                    <div id="ac-collapseThree2" class="accordion-collapse collapse show" aria-labelledby="sheraht-3" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->

                                                <!-- Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-4">
                                                        <button class="accordion-button collapsed sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseFour" aria-expanded="false" aria-controls="ac-collapseFour">4. Which currency will I be charged in?</button>
                                                    </h2>
                                                    <div id="ac-collapseFour" class="accordion-collapse collapse" aria-labelledby="sheraht-4" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->
                                                <!-- Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-5">
                                                        <button class="accordion-button collapsed sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseFive" aria-expanded="false" aria-controls="ac-collapseFive">5. Do you offer 3 or 4 times payment option?</button>
                                                    </h2>
                                                    <div id="ac-collapseFive" class="accordion-collapse collapse" aria-labelledby="sheraht-5" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->
                                                <!-- Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-6">
                                                        <button class="accordion-button collapsed sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseSix" aria-expanded="false" aria-controls="ac-collapseSix">6. How long does it take to ship my order?</button>
                                                    </h2>
                                                    <div id="ac-collapseSix" class="accordion-collapse collapse" aria-labelledby="sheraht-6" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->
                                                <!-- Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-7">
                                                        <button class="accordion-button collapsed sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseSeven" aria-expanded="false" aria-controls="ac-collapseSeven">7. Do you offer fast shipping?</button>
                                                    </h2>
                                                    <div id="ac-collapseSeven" class="accordion-collapse collapse" aria-labelledby="sheraht-7" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->
                                                <!-- Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-8">
                                                        <button class="accordion-button collapsed sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseEight" aria-expanded="false" aria-controls="ac-collapseEight">8. How can I track my package?</button>
                                                    </h2>
                                                    <div id="ac-collapseEight" class="accordion-collapse collapse" aria-labelledby="sheraht-8" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->
                                            </div> 
                                            <div class="col-lg-6 col-md-6 col-12">
                                                <!-- Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-9">
                                                        <button class="accordion-button collapsed sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseNine" aria-expanded="false" aria-controls="ac-collapseNine">9. Will I pay taxes for international shipping?</button>
                                                    </h2>
                                                    <div id="ac-collapseNine" class="accordion-collapse collapse" aria-labelledby="sheraht-9" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->
                                                <!-- Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-10">
                                                        <button class="accordion-button collapsed sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseTen" aria-expanded="false" aria-controls="ac-collapseTen">10. How long does it take to process a return?</button>
                                                    </h2>
                                                    <div id="ac-collapseTen" class="accordion-collapse collapse" aria-labelledby="sheraht-10" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->
                                                <!-- Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-11">
                                                        <button class="accordion-button collapsed sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseEleven" aria-expanded="false" aria-controls="ac-collapseEleven">11. Do you offer a referral program? How does it work?</button>
                                                    </h2>
                                                    <div id="ac-collapseEleven" class="accordion-collapse collapse" aria-labelledby="sheraht-11" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->
                                                <!-- Single Accordion -->
                                                <div class="accordion-item sherah-accordion__single mg-top-30">
                                                    <h2 class="accordion-header" id="sheraht-12">
                                                        <button class="accordion-button collapsed sherah-accordion__heading" type="button" data-bs-toggle="collapse" data-bs-target="#ac-collapseTwelve" aria-expanded="false" aria-controls="ac-collapseTwelve">12. Do you have physical stores?</button>
                                                    </h2>
                                                    <div id="ac-collapseTwelve" class="accordion-collapse collapse" aria-labelledby="sheraht-11" data-bs-parent="#sherah-accordion">
                                                        <div class="accordion-body sherah-accordion__body sherah-border-top">It is a long established fact that a reader will be distracte by the readable content of a page ourlooking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib of letters, as opposed to using 'Content here, content here.</div>
                                                    </div>
                                                </div>
                                                <!-- End Single Accordion -->  
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
