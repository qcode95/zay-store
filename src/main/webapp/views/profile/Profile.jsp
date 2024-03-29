<%@page import="com.fpt.prj301.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile Page</title>
        <%@include file="/common-admin/Header.jsp" %>
        <style>
            .button-62 {
                background: linear-gradient(to bottom right, #EF4765, #FF9A5A);
                border: 0;
                border-radius: 12px;
                color: #FFFFFF;
                cursor: pointer;
                display: inline-block;
                font-family: -apple-system,system-ui,"Segoe UI",Roboto,Helvetica,Arial,sans-serif;
                font-size: 16px;
                font-weight: 500;
                line-height: 2.5;
                outline: transparent;
                padding: 0 1rem;
                text-align: center;
                text-decoration: none;
                transition: box-shadow .2s ease-in-out;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                white-space: nowrap;
            }

            .button-62:not([disabled]):focus {
                box-shadow: 0 0 .25rem rgba(0, 0, 0, 0.5), -.125rem -.125rem 1rem rgba(239, 71, 101, 0.5), .125rem .125rem 1rem rgba(255, 154, 90, 0.5);
            }

            .button-62:not([disabled]):hover {
                box-shadow: 0 0 .25rem rgba(0, 0, 0, 0.5), -.125rem -.125rem 1rem rgba(239, 71, 101, 0.5), .125rem .125rem 1rem rgba(255, 154, 90, 0.5);
            }
            .button-60 {
                align-items: center;
                appearance: none;
                background-color: #fff;
                border: 1px solid #dbdbdb;
                border-radius: .375em;
                box-shadow: none;
                box-sizing: border-box;
                color: #363636;
                cursor: pointer;
                display: inline-flex;
                font-family: BlinkMacSystemFont,-apple-system,"Segoe UI",Roboto,Oxygen,Ubuntu,Cantarell,"Fira Sans","Droid Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
                font-size: 1rem;
                height: 2.5em;
                justify-content: center;
                line-height: 1.5;
                padding: calc(.5em - 1px) 1em;
                position: relative;
                text-align: center;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                vertical-align: top;
                white-space: nowrap;
            }

            .button-60:active {
                border-color: #4a4a4a;
                outline: 0;
            }

            .button-60:focus {
                border-color: #485fc7;
                outline: 0;
            }

            .button-60:hover {
                border-color: #b5b5b5;
            }

            .button-60:focus:not(:active) {
                box-shadow: rgba(72, 95, 199, .25) 0 0 0 .125em;
            }
            #email_input {
                max-height: 0;
                overflow: hidden;
                opacity: 0;
                visibility: hidden;
                transition: max-height 0.3s ease-in-out, opacity 0.3s ease-in-out, visibility 0s 0.3s;
            }

            #email_input.active {
                max-height: 100px;
                opacity: 1;
                visibility: visible;
                transition: max-height 0.3s ease-in-out, opacity 0.3s ease-in-out, visibility 0s 0s;
            }
            #phone_input {
                max-height: 0;
                overflow: hidden;
                opacity: 0;
                visibility: hidden;
                transition: max-height 0.3s ease-in-out, opacity 0.3s ease-in-out, visibility 0s 0.3s;
            }

            #phone_input.active {
                max-height: 100px;
                opacity: 1;
                visibility: visible;
                transition: max-height 0.3s ease-in-out, opacity 0.3s ease-in-out, visibility 0s 0s;
            }
        </style>
    </head>

    <%
        User user = (User) session.getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        }

        int start = Math.min(4, user.getEmail().length());
        int end = Math.max(10, user.getEmail().length() - 10);
    %>
    <%!
        private String maskString(String str, int start, int end) {
            if (str == null || str.isEmpty()) {
                return str;
            }

            StringBuilder maskedString = new StringBuilder(str);
            for (int i = start; i < end; i++) {
                maskedString.setCharAt(i, '*');
            }

            return maskedString.toString();
        }
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
                                <!-- Sherah Breadcrumb -->
                                <div class="sherah-breadcrumb mg-top-30">
                                    <h2 class="sherah-breadcrumb__title">Setting</h2>
                                    <ul class="sherah-breadcrumb__list"> 
                                        <li><a href="<%=request.getContextPath()%>/home">Home</a></li>
                                        <li class="active"><a href="<%=request.getContextPath()%>/profile">Personal Information</a></li>
                                    </ul>
                                </div>
                                <!-- End Sherah Breadcrumb -->
                                <div class="sherah-personals">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-2 col-12 sherah-personals__list mg-top-30">
                                            <div class="sherah-psidebar sherah-default-bg">
                                                <!-- Features Tab List -->
                                                <div class="list-group sherah-psidebar__list" id="list-tab" role="tablist">
                                                    <a class="list-group-item active" data-bs-toggle="list" href="#id1" role="tab"><span class="sherah-psidebar__icon"><svg xmlns="http://www.w3.org/2000/svg" width="15.137" height="18.151" viewBox="0 0 15.137 18.151">
                                                            <g id="Icon" transform="translate(-127.285 -217.094)">
                                                            <path id="Path_170" data-name="Path 170" d="M142.35,419.766a7.862,7.862,0,0,0-.848-2.97,3.353,3.353,0,0,0-2.566-1.817,1.5,1.5,0,0,0-1.176.242c-.2.152-.422.281-.637.415a4.018,4.018,0,0,1-4.074.264c-.428-.2-.8-.5-1.205-.738a1.126,1.126,0,0,0-.59-.214,3.558,3.558,0,0,0-1.664.413,3.71,3.71,0,0,0-1.65,1.987,9.533,9.533,0,0,0-.618,4.357,2.808,2.808,0,0,0,1.984,2.447c.232.072.471.12.707.18h9.607c.008-.027.03-.03.054-.032a2.906,2.906,0,0,0,2.747-2.994A11.6,11.6,0,0,0,142.35,419.766Zm-2.985,3.494c-1.506.018-3.012,0-4.518,0v0h-4.323a2.435,2.435,0,0,1-1.276-.3,1.763,1.763,0,0,1-.892-1.556,9.141,9.141,0,0,1,.523-3.565,3.452,3.452,0,0,1,.766-1.219,2.21,2.21,0,0,1,1.5-.617c.071,0,.12.044.175.077.425.253.818.557,1.269.768a5.066,5.066,0,0,0,5.088-.319c.246-.152.488-.31.73-.467a.357.357,0,0,1,.233-.053,2.3,2.3,0,0,1,1.95,1.33,6.775,6.775,0,0,1,.691,2.433,10.99,10.99,0,0,1,.074,1.45A1.888,1.888,0,0,1,139.365,423.26Z" transform="translate(0 -189.086)"/>
                                                            <path id="Path_171" data-name="Path 171" d="M201.205,217.094a4.372,4.372,0,1,0,4.358,4.377A4.363,4.363,0,0,0,201.205,217.094Zm0,7.68a3.308,3.308,0,1,1,3.3-3.314A3.3,3.3,0,0,1,201.2,224.775Z" transform="translate(-66.452 0)" />
                                                            </g>
                                                            </svg>

                                                        </span><span class="sherah-psidebar__title">Personal Info</span>
                                                    </a>
                                                    <a class="list-group-item" data-bs-toggle="list" href="#id5" role="tab"><span class="sherah-psidebar__icon"><svg xmlns="http://www.w3.org/2000/svg" width="13.498" height="17.259" viewBox="0 0 13.498 17.259">
                                                            <g id="Icon" transform="translate(660.4 -193.609)">
                                                            <path id="Path_184" data-name="Path 184" d="M-660.4,203.045a1.613,1.613,0,0,1,.523-.923,1.916,1.916,0,0,1,.388-.246.186.186,0,0,0,.127-.2c0-.8-.008-1.607,0-2.411a5.44,5.44,0,0,1,2.5-4.683,5.586,5.586,0,0,1,3.571-.959,5.609,5.609,0,0,1,3.648,1.591,5.179,5.179,0,0,1,1.621,3.125,16.885,16.885,0,0,1,.075,1.849.488.488,0,0,1-.5.495q-1.044.01-2.088,0a.5.5,0,0,1-.508-.511c-.006-.337,0-.674,0-1.011a2.567,2.567,0,0,0-2.756-2.516,2.562,2.562,0,0,0-2.443,2.363c-.035.9-.007,1.8-.007,2.724h7.7a1.513,1.513,0,0,1,1.477.863,1.669,1.669,0,0,1,.161.7c.012,2.006.01,4.012.005,6.018a1.515,1.515,0,0,1-1.333,1.538.193.193,0,0,0-.046.022h-10.734a.3.3,0,0,0-.063-.024,1.538,1.538,0,0,1-.973-.549,1.792,1.792,0,0,1-.345-.776Zm6.733,6.812h5.108c.426,0,.619-.19.619-.609q0-2.95,0-5.9c0-.416-.194-.6-.624-.6h-10.182c-.426,0-.619.19-.619.609q0,2.942,0,5.884c0,.439.188.621.641.621Zm4.687-10.191a5.512,5.512,0,0,0-.138-1.6,4.667,4.667,0,0,0-5.709-3.293,4.527,4.527,0,0,0-3.472,4.046c-.063.951-.022,1.909-.026,2.865,0,.014.013.029.018.04h1.014v-.19q0-1.146,0-2.293a3.686,3.686,0,0,1,.265-1.381,3.7,3.7,0,0,1,4.171-2.146,3.562,3.562,0,0,1,2.847,3.532c0,.139,0,.278,0,.423Z" transform="translate(0 0)" />
                                                            <path id="Path_185" data-name="Path 185" d="M-538.592,438.065c0-.243,0-.487,0-.73a.158.158,0,0,0-.109-.174,1.479,1.479,0,0,1-.883-1.448,1.5,1.5,0,0,1,1.146-1.363,1.508,1.508,0,0,1,1.734.918,1.481,1.481,0,0,1-.735,1.868.236.236,0,0,0-.163.257c.009.448,0,.9,0,1.345,0,.354-.193.582-.494.585s-.5-.228-.5-.593C-538.592,438.508-538.592,438.286-538.592,438.065Zm.5-2.76a.5.5,0,0,0-.5.5.5.5,0,0,0,.5.5.5.5,0,0,0,.5-.5A.5.5,0,0,0-538.094,435.3Z" transform="translate(-115.541 -230.447)" />
                                                            </g>
                                                            </svg>
                                                        </span><span class="sherah-psidebar__title">Change Password </span>
                                                    </a>
                                                    <a class="list-group-item" data-bs-toggle="list" href="#id6" role="tab"><span class="sherah-psidebar__icon"><svg xmlns="http://www.w3.org/2000/svg" width="14.217" height="14.272" viewBox="0 0 14.217 14.272">
                                                            <g id="Icon" transform="translate(660.76 -197.338)">
                                                            <path id="Path_186" data-name="Path 186" d="M-418.017,281.88a1.04,1.04,0,0,1-.1-.209c-.04-.183-.143-.229-.325-.22-.371.017-.742.008-1.114,0a.155.155,0,0,0-.166.105,1.371,1.371,0,0,1-1.552.76,1.376,1.376,0,0,1-1.059-1.337,1.374,1.374,0,0,1,1.08-1.35,1.37,1.37,0,0,1,1.525.711.17.17,0,0,0,.178.112c.391-.005.782-.007,1.173,0,.1,0,.155-.031.175-.129a.258.258,0,0,1,.044-.109c.118-.145.057-.24-.06-.356-.814-.8-1.62-1.615-2.429-2.423-.038-.038-.078-.074-.123-.116a1.7,1.7,0,0,1-1.249.189,1.81,1.81,0,0,1-1.409-1.847,1.809,1.809,0,0,1,1.518-1.7,1.826,1.826,0,0,1,2.126,1.889,2.91,2.91,0,0,1-.221.731c-.027.078-.041.125.027.192q1.323,1.292,2.641,2.59c.01.01.023.018.044.034a2.084,2.084,0,0,1,.9-.233,2.094,2.094,0,0,1,.9.234c.033-.031.063-.057.091-.084q1.072-1.071,2.145-2.141a.172.172,0,0,0,.05-.217,1.265,1.265,0,0,1,.287-1.4,1.294,1.294,0,0,1,1.413-.364,1.293,1.293,0,0,1,.94,1.1,1.35,1.35,0,0,1-1.24,1.575,2.737,2.737,0,0,1-.594-.088.208.208,0,0,0-.151.021q-1.15,1.14-2.291,2.288c-.007.007-.009.017,0-.009l.25.8,1.751.323c.017-.025.035-.047.05-.072a1.809,1.809,0,0,1,2.046-.859,1.846,1.846,0,0,1,1.286,1.816,1.8,1.8,0,0,1-1.681,1.772,1.827,1.827,0,0,1-1.923-1.588c-.006-.047-.044-.121-.079-.129-.558-.127-1.118-.245-1.683-.367a1.954,1.954,0,0,1-.559.674.138.138,0,0,0-.032.121c.232.782.469,1.562.7,2.344.023.076.062.094.136.1a1.378,1.378,0,0,1,1.27,1.451,1.38,1.38,0,0,1-1.46,1.294,1.376,1.376,0,0,1-1.29-1.489,1.308,1.308,0,0,1,.4-.857.149.149,0,0,0,.043-.18q-.373-1.149-.74-2.3c-.023-.071-.044-.12-.137-.117a1.7,1.7,0,0,1-.787-.183.141.141,0,0,0-.192.028q-1.367,1.375-2.741,2.741c-.076.075-.053.128-.019.205a1.787,1.787,0,0,1-.808,2.384,1.731,1.731,0,0,1-1.964-.2,1.719,1.719,0,0,1-.592-1.9,1.741,1.741,0,0,1,1.416-1.322,1.786,1.786,0,0,1,1.17.154.131.131,0,0,0,.179-.027q1.388-1.4,2.781-2.786A.511.511,0,0,0-418.017,281.88Zm-3.619-5.23a.889.889,0,0,0,.871-.887.855.855,0,0,0-.847-.868.853.853,0,0,0-.865.849A.862.862,0,0,0-421.636,276.65Zm-.216,10.6a.827.827,0,0,0,.849-.858.856.856,0,0,0-.851-.853.855.855,0,0,0-.861.857A.854.854,0,0,0-421.852,287.253Zm6.268-6.28a.853.853,0,0,0-.864-.85.854.854,0,0,0-.847.853.857.857,0,0,0,.857.859A.856.856,0,0,0-415.585,280.973Zm5.229,1.046a.857.857,0,0,0-.864-.851.858.858,0,0,0-.847.855.859.859,0,0,0,.858.859A.858.858,0,0,0-410.356,282.019Zm-1.581-5.132a.424.424,0,0,0,.44-.408.43.43,0,0,0-.422-.443.423.423,0,0,0-.429.418A.42.42,0,0,0-411.937,276.887Zm-9.029,4.516a.425.425,0,0,0,.437-.411.43.43,0,0,0-.425-.44.422.422,0,0,0-.427.42A.42.42,0,0,0-420.966,281.4Zm5.909,4.993a.423.423,0,0,0,.433.429.425.425,0,0,0,.415-.418.418.418,0,0,0-.426-.434A.416.416,0,0,0-415.057,286.4Z" transform="translate(-237.087 -76.608)" />
                                                            </g>
                                                            </svg>
                                                        </span><span class="sherah-psidebar__title">Connect With Social </span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-9 col-md-10 col-12  sherah-personals__content mg-top-30">
                                            <div class="sherah-ptabs">

                                                <div class="sherah-ptabs__inner">
                                                    <div class="tab-content" id="nav-tabContent">
                                                        <!--  Features Single Tab -->
                                                        <div class="tab-pane fade show active" id="id1" role="tabpanel">
                                                            <form action="./edit-infor" method="post" enctype="multipart/form-data" id="editForm">
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <div class="sherah-ptabs__separate">
                                                                            <div class="sherah-ptabs__form-main">
                                                                                <div class="sherah__item-group sherah-default-bg sherah-border">
                                                                                    <!--Profile Cover Info -->
                                                                                    <div class="sherah-profile-cover sherah-offset-bg sherah-dflex">
                                                                                        <div class="sherah-profile-cover__img">
                                                                                            <img src=".<%=user.getAvatar()%>" alt="Avatar" id="avatar1">
                                                                                            <div style="left: 20px; top: 20px">
                                                                                                <input type="file" id="avatar" name="avatar" hidden onchange="editAvatar()"/>
                                                                                                <label for="avatar" class="button-60">Edit Avatar</label>
                                                                                            </div>x
                                                                                        </div>
                                                                                        <div class="sherah-profile-cover__content">
                                                                                            <h3 class="sherah-profile-cover__title"><%=user.getName()%></h3>
                                                                                            <span class="sherah-profile-cover__text sherah-color1"><%=maskString(user.getEmail(), start, end)%></span>
                                                                                            <ul class="sherah-social mg-top-30">
                                                                                                <li><a href="#" class="sherah-pcolor sherah-border sherah-default-bg"><i class="fa-brands fa-facebook-f"></i></a></li>
                                                                                                <li><a href="#" class="sherah-pcolor sherah-border sherah-default-bg"><i class="fa-brands fa-twitter"></i></a></li>
                                                                                                <li><a href="#" class="sherah-pcolor sherah-border sherah-default-bg"><i class="fa-brands fa-linkedin"></i></a></li>
                                                                                                <li><a href="#" class="sherah-pcolor sherah-border sherah-default-bg"><svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 13 13">
                                                                                                        <path id="Path_193" data-name="Path 193" d="M-395.137,386.139q0-.953,0-1.906c0-.237-.074-.31-.311-.31h-3.775a1.256,1.256,0,0,1-.866-.3,1.162,1.162,0,0,1-.323-1.239,1.136,1.136,0,0,1,.963-.773c.122-.011.245-.017.367-.017h3.609c.272,0,.336-.064.336-.337q0-1.875,0-3.749a1.257,1.257,0,0,1,.3-.866,1.162,1.162,0,0,1,1.239-.323,1.137,1.137,0,0,1,.773.963c.011.122.017.245.017.367q0,1.8,0,3.609c0,.272.064.336.337.336h3.749a1.257,1.257,0,0,1,.866.3,1.162,1.162,0,0,1,.323,1.239,1.137,1.137,0,0,1-.963.773c-.122.011-.245.017-.367.017q-1.8,0-3.609,0c-.272,0-.336.064-.336.337q0,1.875,0,3.749a1.256,1.256,0,0,1-.3.866,1.162,1.162,0,0,1-1.239.323,1.1,1.1,0,0,1-.769-.963c-.024-.617-.016-1.236-.022-1.854C-395.137,386.3-395.137,386.22-395.137,386.139Z" transform="translate(400.472 -376.258)"/>
                                                                                                        </svg></a></li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!-- End Profile Cover Info -->

                                                                                    <div class="sherah-profile-info__v2 mg-top-30">

                                                                                        <h3 class="sherah-profile-info__heading mg-btm-30">Personal Information</h3>
                                                                                        <%
                                                                                            String successMsg = (String) request.getAttribute("successMsg");
                                                                                            if (successMsg != null) {
                                                                                        %>
                                                                                        <div class="alert alert-success text-center text-success" role="alert">
                                                                                            <%=successMsg%>
                                                                                        </div>
                                                                                        <% }%>
                                                                                        <%
                                                                                            String failedMsg = (String) request.getAttribute("failedMsg");
                                                                                            if (failedMsg != null) {
                                                                                        %>
                                                                                        <div class="alert alert-danger text-center text-danger" role="alert">
                                                                                            <%=failedMsg%>
                                                                                        </div>
                                                                                        <% }%>
                                                                                        <%
                                                                                            String wrongMsg = (String) request.getAttribute("wrongMsg");
                                                                                            if (wrongMsg != null) {
                                                                                        %>
                                                                                        <div class="alert alert-danger text-center text-danger" role="alert">
                                                                                            <%=wrongMsg%>
                                                                                        </div>
                                                                                        <% }%>
                                                                                        <ul class="sherah-profile-info__list sherah-dflex-column">

                                                                                            <li class="sherah-dflex">
                                                                                                <h4 class="sherah-profile-info__title">Full Name :</h4>
                                                                                                <p class="sherah-profile-info__text">
                                                                                                    <input class="form-control" value="<%=user.getName()%>" id="name" name="name">
                                                                                                </p>
                                                                                            </li>
                                                                                            <li class="sherah-dflex">
                                                                                                <h4 class="sherah-profile-info__title">Email :</h4>
                                                                                                <p class="sherah-profile-info__text">
                                                                                                    <%=maskString(user.getEmail(), start, end)%>
                                                                                                    &nbsp;
                                                                                                    <span>
                                                                                                        <a href="#" onclick="toggleEditEmail(event)" style="color: #0062cc">Edit</a>
                                                                                                        <i class="fas fa-edit" style="color: #0062cc"></i>
                                                                                                    </span>
                                                                                                    <input class="form-control" value="<%=user.getEmail()%>" id="email_input" name="email">
                                                                                                </p>
                                                                                            </li>
                                                                                            <li class="sherah-dflex">
                                                                                                <h4 class="sherah-profile-info__title">Phone :</h4>
                                                                                                <p class="sherah-profile-info__text">
                                                                                                    (+84) <%=user.getMobile()%>
                                                                                                    &nbsp;
                                                                                                    <span>
                                                                                                        <a href="#" onclick="toggleEditPhone(event)" style="color: #0062cc">Edit</a>
                                                                                                        <i class="fas fa-edit" style="color: #0062cc"></i>
                                                                                                    </span>
                                                                                                    <input class="form-control" value="0<%=user.getMobile()%>" id="phone_input" name="phone">
                                                                                                </p>
                                                                                            </li>
                                                                                            <li class="sherah-dflex">
                                                                                                <h4 class="sherah-profile-info__title">Address :</h4>
                                                                                                <p class="sherah-profile-info__text"><%=user.getAddress()%></p>
                                                                                            </li>
                                                                                            <li class="sherah-dflex">
                                                                                                <h4 class="sherah-profile-info__title">Country :</h4>
                                                                                                <p class="sherah-profile-info__text">Việt Nam</p>
                                                                                            </li>
                                                                                            <li class="sherah-dflex">
                                                                                                <h4 class="sherah-profile-info__title">Language :</h4>
                                                                                                <p class="sherah-profile-info__text">Vietnamese</p>
                                                                                            </li>
                                                                                            <li class="sherah-dflex">
                                                                                                <button type="submit" class="button-62" role="button">Save</button>
                                                                                            </li>
                                                                                        </ul>

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>

                                                        <div class="tab-pane fade" id="id5" role="tabpanel">
                                                            <div class="sherah-paymentm sherah__item-group sherah-default-bg sherah-border ">
                                                                <h4 class="sherah__item-group sherah-default-bg sherah-border__title">Change Password</h4>
                                                                <div class="row">
                                                                    <div class="col-xxl-8  col-lg-6 col-md-6 col-12">
                                                                        <!-- Form -->
                                                                        <form class="sherah-wc__form-main sherah-form-main--v2 p-0" action="./change-password" method="post" id="changeForm">
                                                                            <input name="email" value="<%=user.getEmail()%>" hidden>
                                                                            <div class="form-group">
                                                                                <label class="sherah-wc__form-label">Old Password *</label>
                                                                                <div class="form-group__input">
                                                                                    <input class="sherah-wc__form-input" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;" id="old-password" type="password" name="old-password" placeholder="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="sherah-wc__form-label">New Password *</label>
                                                                                <div class="form-group__input">
                                                                                    <input class="sherah-wc__form-input" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;" id="new-password" type="password" name="new-password" placeholder="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="sherah-wc__form-label">Re-enter Password *</label>
                                                                                <div class="form-group__input">
                                                                                    <input class="sherah-wc__form-input" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;" id="re-new-password" type="password" name="re-new-password" placeholder="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group mg-top-30">
                                                                                <button type="submit" class="sherah-btn sherah-btn__primary">Changed Password</button>
                                                                            </div>
                                                                        </form>	
                                                                        <!-- End Sign in Form -->
                                                                    </div>
                                                                    <div class="col-xxl-4 col-lg-6 col-md-6 col-12">
                                                                        <div class="sherah-password__img">
                                                                            <img src="<%=request.getContextPath()%>/assets-admin/img/p-update-img.png" alt="">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade" id="id6" role="tabpanel">
                                                            <div class="sherah-accordion accordion accordion-flush sherah__item-group sherah-default-bg sherah-border" id="sherah-accordion">
                                                                <div class="sherah__item-group sherah-default-bg sherah-border mg-top-30">
                                                                    <h4 class="sherah-default-bg sherah-border__title">Social Account</h4>
                                                                    <div class="sherah__item-form--group">
                                                                        <form class="sherah-wc__form-main p-0">
                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="sherah__item-form--group mg-top-form-20">
                                                                                        <label class="sherah-wc__form-label">Facebook *</label>
                                                                                        <div class="sherah-input-icon">
                                                                                            <input class="sherah-wc__form-input" type="url" placeholder="Facebook profile link">
                                                                                            <div class="sherah-form-icon sherah-color1"><i class="fa-brands fa-facebook-f"></i></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>	
                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="sherah__item-form--group mg-top-form-20">
                                                                                        <label class="sherah-wc__form-label">Instagram *</label>
                                                                                        <div class="sherah-input-icon">
                                                                                            <input class="sherah-wc__form-input" type="url" placeholder="Instagram profile link">
                                                                                            <div class="sherah-form-icon sherah-color1"><i class="fa-brands fa-instagram"></i></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>	
                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="sherah__item-form--group mg-top-form-20">
                                                                                        <label class="sherah-wc__form-label">Twitter *</label>
                                                                                        <div class="sherah-input-icon">
                                                                                            <input class="sherah-wc__form-input" type="url" placeholder="Twitter profile link">
                                                                                            <div class="sherah-form-icon sherah-color1"><i class="fa-brands fa-twitter"></i></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>	
                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="sherah__item-form--group  mg-top-form-20">
                                                                                        <label class="sherah-wc__form-label">Google Plus*</label>
                                                                                        <div class="sherah-input-icon">
                                                                                            <input class="sherah-wc__form-input" type="url" placeholder="Google Plus profile link">
                                                                                            <div class="sherah-form-icon sherah-color1"><i class="fa-brands fa-google-plus"></i></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>	
                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="sherah__item-form--group  mg-top-form-20">
                                                                                        <label class="sherah-wc__form-label">Pinterest* </label>
                                                                                        <div class="sherah-input-icon">
                                                                                            <input class="sherah-wc__form-input" type="url" placeholder="Pinterest profile Link">
                                                                                            <div class="sherah-form-icon sherah-color1"><i class="fa-brands fa-pinterest"></i></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>	
                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="sherah__item-form--group  mg-top-form-20">
                                                                                        <label class="sherah-wc__form-label">Dribbble *</label>
                                                                                        <div class="sherah-input-icon">
                                                                                            <input class="sherah-wc__form-input" type="url" placeholder="Dribbble profile Link">
                                                                                            <div class="sherah-form-icon sherah-color1"><i class="fa-brands fa-dribbble"></i></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>	
                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="sherah__item-form--group  mg-top-form-20">
                                                                                        <label class="sherah-wc__form-label">Linkedin *</label>
                                                                                        <div class="sherah-input-icon">
                                                                                            <input class="sherah-wc__form-input" type="url" placeholder="Linkdin profile link">
                                                                                            <div class="sherah-form-icon sherah-color1"><i class="fa-brands fa-linkedin"></i></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>	
                                                                                <div class="col-lg-6 col-12">
                                                                                    <div class="sherah__item-form--group  mg-top-form-20">
                                                                                        <label class="sherah-wc__form-label">Behance *</label>
                                                                                        <div class="sherah-input-icon">
                                                                                            <input class="sherah-wc__form-input" type="url" placeholder="Behance profile link">
                                                                                            <div class="sherah-form-icon sherah-color1"><i class="fa-brands fa-behance"></i></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>	
                                                                            </div>	
                                                                            <div class="row mg-top-30">
                                                                                <div class="sherah__item-form--group">
                                                                                    <button type="submit" class="sherah-btn sherah-btn__primary">Save Now</button>
                                                                                </div>
                                                                            </div>
                                                                        </form>	
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade" id="id7" role="tabpanel">
                                                            <div class="sherah-ptabs__page sherah__item-group sherah-default-bg sherah-border" >
                                                                <h4 class="sherah__item-group sherah-default-bg sherah-border__title">Terms and Conditions</h4>
                                                                <h3 class="sherah-ptabs__page-title">1. Definitions</h3>
                                                                <p>What you do own when you buy an NFT are the keys to a non-fungible – perhaps unique – token. That token is yours to trade or hold or display in Decentraland. But the digital file associated with an NFT is just as easy to copy and paste and download as any other – the Finally, players lose their NFTs sometimes according to the rules and regulations of the NFT game.</p>

                                                                <h3 class="sherah-ptabs__page-title">2. Acceptance</h3>
                                                                <p>Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Capacity. You confirm that you have the legal capacity to receive and hold and make use of the NFT under French jurisdiction and any other relevant jurisdiction.Acceptance. By participating in the Sale, You accept and agree to these Terms and Conditions without any condition or restriction.If You do not agree to this Contract, You shall not participate in the Sale made by the Company Exercitation veniam consequat sunt nostrud amet.Capacity. You confirm that you have the legal capacity to receive and hold find to end.Contract, You shall not participate in the Sale made by the Company Exercitation venia</p>

                                                                <blockquote>In reality, the most important aspect of a great dashboard is the part that gets the least amount of attention: The underlying data. More than any other aspect, the data will make or break a dashboard.Within this definition, successful administration appears to rest on three basic skills, which we will call technical, and conceptual.
                                                                </blockquote>

                                                                <h3 class="sherah-ptabs__page-title">3. The Sale</h3>
                                                                <p>The Company offers NFTs featuring the Betonyou universe. The holders of one or more NFTs will be able to win cryptos while playing video games. In the future, the Company plans to develop its own games and Metaverse around the Betonyou universe (“Project”).</p>
                                                                <p>To release the NFTs and fund the project, the Company offers NFTs from a dedicated website("Sale"). The web address of this website will be given at the time of the mint. The NFT acquisition does not confer any rights on the Company or in the future development.</p>

                                                                <h3 class="sherah-ptabs__page-title">4. Purchaser’s obligations</h3>
                                                                <p>To the fullest extent permitted by applicable law, You undertake to indemnify, defend and hold harmless the Company from and against all claims, demands, actions, damages, losses, costs and expenses (including attorneys’ fees) that arise from or relate to (i) your Subscription or use of the NFTs; (ii) your responsibilities or obligations under this Contract; and (iii) your breach of this Contract.</p>

                                                                <p>Company undertakes to act with the care normally expected from a professional in his field and to comply with the best practice in force. The best endeavor obligation only binds the Company.</p>

                                                            </div>
                                                        </div>

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

        <%@include file="/common-admin/Js.jsp" %>
        <script src="https://cdn.jsdelivr.net/gh/AmagiTech/JSLoader/amagiloader.js">
        </script>
        <script>
            function editAvatar() {
                var input = document.getElementById('avatar');
                var avatar1 = document.getElementById('avatar1');

                if (input.files && input.files[0]) {
                    var formData = new FormData();
                    formData.append('image', input.files[0]);

                    // Display the image before upload
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        avatar1.src = e.target.result;
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
        <script>
            function toggleEditEmail(event) {
                event.preventDefault();
                var emailInput = document.getElementById('email_input');

                if (emailInput.classList.contains('active')) {
                    emailInput.classList.remove('active');
                } else {
                    emailInput.classList.add('active');
                }
            }
            function toggleEditPhone(event) {
                event.preventDefault();
                var phoneInput = document.getElementById('phone_input');

                if (phoneInput.classList.contains('active')) {
                    phoneInput.classList.remove('active');
                } else {
                    phoneInput.classList.add('active');
                }
            }
        </script>
        <script>
            AmagiLoader.show();
            setTimeout(() => {
                AmagiLoader.hide();
            }, 600);
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Chờ cho DOM được tải hoàn toàn trước khi thêm các sự kiện nghe
                var editForm = document.getElementById("editForm");
                var changeForm = document.getElementById("changeForm");

                editForm.addEventListener("submit", function (event) {
                    // Hủy sự kiện mặc định để ngăn form submit
                    event.preventDefault();

                    // Gọi hàm kiểm tra validation
                    if (validateEditForm()) {
                        // Nếu hợp lệ, thực hiện submit form
                        editForm.submit();
                    }
                });

                changeForm.addEventListener("submit", function (event) {
                    // Hủy sự kiện mặc định để ngăn form submit
                    event.preventDefault();

                    // Gọi hàm kiểm tra validation
                    if (validateChangeForm()) {
                        // Nếu hợp lệ, thực hiện submit form
                        changeForm.submit();
                    }
                });

                function validateEditForm() {
                    var name = document.getElementById("name").value;
                    var email = document.getElementById("email_input").value;
                    var phone = document.getElementById("phone_input").value;

                    // Thực hiện các kiểm tra validation ở đây
                    // kiểm tra nếu một trường không được bỏ trống
                    if (name.trim() === "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Name field have to be filled!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }
                    
                    if (email.trim() === "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Email field have to be filled!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }
                    
                    var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                    if (!emailRegex.test(email)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Invalid Email address!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }
                    
                    if (phone.trim() === "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Phone field have to be filled!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }if (phone.trim() === "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Phone field have to be filled!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }
                    
                    if (phone.length < 10 || phone.length > 10) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Phone must be 10 digit!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }
                    // Nếu tất cả kiểm tra đều hợp lệ, trả về true
                    return true;
                }

                function validateChangeForm() {
                    var oldPassword = document.getElementById("old-password").value;
                    var nPassword = document.getElementById("new-password").value;
                    var reNewPassword = document.getElementById("re-new-password").value;

                    // Thực hiện các kiểm tra validation ở đây
                    // kiểm tra nếu một trường không được bỏ trống
                    if (oldPassword.trim() === "" || nPassword.trim() === "" || reNewPassword.trim() === "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "All fields have to be filled!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Kiểm tra mật khẩu có khớp không
                    if (nPassword !== reNewPassword) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Passwords do not match!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Kiểm tra new Password không trùng với old Password
                    if (nPassword === oldPassword) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Do not enter Old Password for New Password !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }
                    
                    // Kiểm tra độ dài mật khẩu
                    if (nPassword.length <= 8) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Passwords need at least 8 charactors !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (nPassword.length >= 24) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Passwords need at most 24 charactors !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Kiểm tra các trường hợp đặc biệt của mật khẩu
                    var upperRegex = /[A-Z]/;
                    var lowerRegex = /[a-z]/;
                    var numberRegex = /[0-9]/;
                    var specialRegex = /[^A-Za-z0-9]/;

                    if (!upperRegex.test(nPassword)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 uppercase character !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (!lowerRegex.test(nPassword)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 lower character !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (!numberRegex.test(nPassword)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 numberic character !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    if (!specialRegex.test(nPassword)) {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Password need at least 1 special character !",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Nếu tất cả kiểm tra đều hợp lệ, trả về true
                    return true;
                }
            });
        </script>
    </body>
</html>
