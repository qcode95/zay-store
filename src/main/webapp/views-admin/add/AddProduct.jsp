<%@page import="com.fpt.prj301.model.User"%>
<%@page import="com.fpt.prj301.model.Brand"%>
<%@page import="com.fpt.prj301.model.Category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <title>Add Product Page</title>
        <%@include file="/common-admin/Header.jsp" %>
        <script src="https://cdn.rawgit.com/kimmobrunfeldt/progressbar.js/1.0.1/dist/progressbar.min.js"></script>
    </head>

    <%
        User user = (User) session.getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        }

        List<Category> listC = (List<Category>) request.getAttribute("listC");
        List<Brand> listB = (List<Brand>) request.getAttribute("listB");
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
                                            <h2 class="sherah-breadcrumb__title">Upload Product</h2>
                                            <ul class="sherah-breadcrumb__list"> 
                                                <li><a href="<%=request.getContextPath()%>/dashboard">Home</a></li>
                                                <li class="active"><a href="<%=request.getContextPath()%>/add">Upload Product</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="sherah-page-inner sherah-border sherah-basic-page sherah-default-bg mg-top-25 p-0">
                                    <form class="sherah-wc__form-main" action="./add" method="post" id="addForm" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-lg-6 col-12">
                                                <!-- Product Info -->
                                                <div class="product-form-box sherah-border mg-top-30">
                                                    <h4 class="form-title m-0">Basic Information</h4>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <label class="sherah-wc__form-label">Product Title*</label>
                                                                <div class="form-group__input">
                                                                    <input class="sherah-wc__form-input" id="name"
                                                                           placeholder="Type here" type="text" name="name">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-12">
                                                            <div class="form-group">
                                                                <label class="sherah-wc__form-label">Price*</label>
                                                                <div class="form-group__input">
                                                                    <input class="sherah-wc__form-input" id="price"
                                                                           placeholder="Type here" type="number" min="1" name="price">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-12">
                                                            <div class="form-group">
                                                                <label class="sherah-wc__form-label">Rating*</label>
                                                                <div class="form-group__input">
                                                                    <input class="sherah-wc__form-input" id="rating"
                                                                           placeholder="Type here" min="1" max="5" type="number" name="rating">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <label class="sherah-wc__form-label">About Description</label>
                                                                <div class="form-group__input">
                                                                    <textarea class="tinymce" id="description" placeholder="Type here" type="text" name="description"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-12">
                                                            <div class="form-group">
                                                                <label class="sherah-wc__form-label">Category*</label>
                                                                <select class="form-group__input" name="category" aria-label="Default select example">
                                                                    <%
                                                                        for (Category c : listC) {
                                                                    %>
                                                                    <option value="<%=c.getId()%>"><%=c.getName()%></option>
                                                                    <% } %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-12">
                                                            <div class="form-group">
                                                                <label class="sherah-wc__form-label">Brand*</label>
                                                                <select class="form-group__input" name="brand" aria-label="Default select example">
                                                                    <%
                                                                        for (Brand b : listB) {
                                                                    %>
                                                                    <option value="<%=b.getId()%>"><%=b.getName()%></option>
                                                                    <% }%>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End Product Info -->
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <!-- Organization -->
                                                <div class="product-form-box sherah-border mg-top-30">
                                                    <h4 class="form-title m-0">Organization</h4>
                                                    <div class="form-group">
                                                        <label class="sherah-wc__form-label">Add Category</label>
                                                        <div class="form-group__input">
                                                            <input class="sherah-wc__form-input" placeholder="Type here" id="category_add" type="text" name="p_title">
                                                            <button class="sherah-btn__add sherah-btn sherah-btn__secondary" type="button" onclick="addCategory()">Add</button>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="sherah-wc__form-label">Add Brand</label>
                                                        <div class="form-group__input">
                                                            <input class="sherah-wc__form-input" placeholder="Type here" id="brand_add" type="text" name="p_title">
                                                            <button class="sherah-btn__add sherah-btn sherah-btn__secondary" type="button" onclick="addBrand()">Add</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End Organization -->
                                                <!-- Specification -->
                                                <div class="product-form-box sherah-border mg-top-30">
                                                    <h4 class="form-title m-0">Specification</h4>
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-12">
                                                            <div class="form-group">
                                                                <label class="sherah-wc__form-label">Stock*</label>
                                                                <div class="form-group__input">
                                                                    <input class="sherah-wc__form-input" id="quantity" placeholder="Type here" type="number" min="1" name="quantity">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-12">
                                                            <div class="form-group">
                                                                <label class="sherah-wc__form-label">Color</label>
                                                                <div class="form-group__input">
                                                                    <input class="sherah-wc__form-input" id="color" placeholder="Type here" type="text" name="color">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End Specification -->
                                            </div>
                                        </div>
                                        <div class="product-form-box sherah-border mg-top-30">
                                            <div class="form-group">
                                                <div class="image-upload-group">
                                                    <div class="image-upload-group__single row">
                                                        <img id="image1" src="<%=request.getContextPath()%>/assets-admin/img/image_quy.png" style="width: 600px; height: 190px">
                                                        <!-- Progress bar -->
                                                        <div id="progressBarContainer"></div>
                                                    </div>
                                                    <div class="image-upload-group__single">
                                                        <img src="<%=request.getContextPath()%>/assets-admin/img/image_quy.png">
                                                    </div>
                                                    <div class="image-upload-group__single">
                                                        <img src="<%=request.getContextPath()%>/assets-admin/img/image_quy.png">
                                                    </div>
                                                    <div class="image-upload-group__single">
                                                        <img src="<%=request.getContextPath()%>/assets-admin/img/image_quy.png">
                                                    </div>
                                                    <div class="image-upload-group__single image-upload-group__single--upload">
                                                        <input type="file" class="btn-check" name="image" onchange="uploadImage()">
                                                        <label class="image-upload-label" for="image">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="91.787" height="84.116" viewBox="0 0 91.787 84.116">
                                                            <g id="Group_1021" data-name="Group 1021" transform="translate(891.292 39.276)">
                                                            <path id="Path_536" data-name="Path 536" d="M-891.292,158.124q1.434-5.442,2.867-10.884c1.3-4.961,2.586-9.926,3.9-14.884a2.8,2.8,0,0,1,2.664-2.251,2.654,2.654,0,0,1,2.763,1.848,3.929,3.929,0,0,1,.037,2q-3.073,12-6.226,23.984c-.64,2.452.088,3.739,2.533,4.394q29.033,7.775,58.067,15.543a2.893,2.893,0,0,0,3.97-2.327c.626-2.487,1.227-4.98,1.849-7.468a2.9,2.9,0,0,1,3.436-2.368,2.894,2.894,0,0,1,2.124,3.726c-.627,2.609-1.256,5.219-1.944,7.813A8.547,8.547,0,0,1-826,183.469q-29.3-7.827-58.584-15.682a8.566,8.566,0,0,1-6.552-6.853,1.264,1.264,0,0,0-.16-.3Z" transform="translate(0 -138.958)"/>
                                                            <path id="Path_537" data-name="Path 537" d="M-767.966,21.9c-9.648,0-19.3-.062-28.943.029a9.215,9.215,0,0,1-8.88-5.491,7.393,7.393,0,0,1-.451-3.232c-.027-14.606-.053-29.212,0-43.818a8.532,8.532,0,0,1,8.907-8.66q29.346-.008,58.693,0a8.581,8.581,0,0,1,8.877,8.872q.017,21.685,0,43.37a8.551,8.551,0,0,1-8.9,8.923C-748.432,21.915-758.2,21.9-767.966,21.9ZM-773.938.457l4.606-5.528q4.674-5.611,9.345-11.224a6.85,6.85,0,0,1,7.183-2.522c1.734.377,2.87,1.622,3.969,2.909q6.341,7.428,12.7,14.838a6.488,6.488,0,0,1,.426.631l.211-.158v-.789q0-14.429,0-28.857c0-2.179-1.125-3.294-3.316-3.295q-29.216,0-58.432,0c-2.141,0-3.277,1.115-3.278,3.25q-.008,18.865,0,37.73a5.429,5.429,0,0,0,.07.624l.239.127a5.744,5.744,0,0,1,.529-.721Q-794.05,1.826-788.4-3.808c3.131-3.127,7.065-3.129,10.21,0C-776.8-2.422-775.412-1.022-773.938.457Zm-25.649,14.9a3.316,3.316,0,0,0,2.611.808q28.949,0,57.9,0c.239,0,.478,0,.717-.005a2.828,2.828,0,0,0,2.864-2.923c.02-1.195-.052-2.393.023-3.584a2.712,2.712,0,0,0-.78-2.072q-8.569-9.946-17.1-19.927c-1.071-1.25-1.417-1.243-2.489.044q-7.71,9.264-15.424,18.523c-1.468,1.762-3.193,1.826-4.833.189q-3.076-3.071-6.147-6.147c-.963-.962-1.146-.963-2.1-.01q-6.688,6.684-13.377,13.367C-798.31,14.2-798.937,14.753-799.587,15.358Z" transform="translate(-69.752)" />
                                                            <path id="Path_538" data-name="Path 538" d="M-734.635,39.893a7.657,7.657,0,0,1-7.659-7.6,7.688,7.688,0,0,1,7.7-7.667,7.682,7.682,0,0,1,7.612,7.663A7.653,7.653,0,0,1-734.635,39.893Zm-.029-5.742a1.9,1.9,0,0,0,1.938-1.906,1.934,1.934,0,0,0-1.886-1.884,1.927,1.927,0,0,0-1.936,1.92A1.9,1.9,0,0,0-734.664,34.151Z" transform="translate(-122.238 -52.421)"/>
                                                            </g>
                                                            </svg>
                                                            <span>image upload</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" mg-top-40 sherah-dflex sherah-dflex-gap-30 justify-content-end">
                                            <button type="submit" class="sherah-btn sherah-btn__primary">Publish Product</button>
                                            <a href="<%=request.getContextPath()%>/products?page=1" class="sherah-btn sherah-btn__third">Cancel</a>
                                        </div>
                                    </form>
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
        <script src="https://cdn.jsdelivr.net/gh/AmagiTech/JSLoader/amagiloader.js">
        </script>
        <script>
            AmagiLoader.show();
            setTimeout(() => {
                AmagiLoader.hide();
            }, 600);
        </script>
        <script>
            function addCategory() {
                var categoryValue = document.getElementById("category_add").value;
                if (categoryValue.trim() === "") {
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "Category fields have to be filled!",
                        footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                    });
                } else {
                    var xhr = new XMLHttpRequest();

                    var url = "add-category";
                    var method = "POST";

                    xhr.open(method, url, true);

                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                    var data = "p_title=" + encodeURIComponent(categoryValue);

                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            Swal.fire({
                                title: "Are you sure?",
                                text: "You won't be able to revert this!",
                                icon: "warning",
                                showCancelButton: true,
                                confirmButtonColor: "#3085d6",
                                cancelButtonColor: "#d33",
                                confirmButtonText: "Yes, do it!"
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    Swal.fire({
                                        title: "Yeah!",
                                        text: "Your category has been added.",
                                        icon: "success"
                                    });
                                    document.getElementById("category_add").value = "";
                                }
                            });
                        }
                    };

                    xhr.send(data);
                }
            }
            
            function addBrand() {
                var brandValue = document.getElementById("brand_add").value;
                if (brandValue.trim() === "") {
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "Brand fields have to be filled!",
                        footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                    });
                } else {
                    var xhr = new XMLHttpRequest();

                    var url = "add-brand";
                    var method = "POST";

                    xhr.open(method, url, true);

                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                    var data = "p_title=" + encodeURIComponent(brandValue);

                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            Swal.fire({
                                title: "Are you sure?",
                                text: "You won't be able to revert this!",
                                icon: "warning",
                                showCancelButton: true,
                                confirmButtonColor: "#3085d6",
                                cancelButtonColor: "#d33",
                                confirmButtonText: "Yes, do it!"
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    Swal.fire({
                                        title: "Yeah!",
                                        text: "Your brand has been added.",
                                        icon: "success"
                                    });
                                    document.getElementById("brand_add").value = "";
                                }
                            });
                        }
                    };

                    xhr.send(data);
                }
            }
        </script>
        <script>
            function uploadImage() {
                var input = document.getElementById('image');
                var image1 = document.getElementById('image1');
                var progressBarContainer = document.getElementById('progressBarContainer');

                if (input.files && input.files[0]) {
                    var formData = new FormData();
                    formData.append('image', input.files[0]);

                    // Display the image before upload
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        image1.src = e.target.result;
                    };
                    reader.readAsDataURL(input.files[0]);

                    // Display the progress bar
                    progressBarContainer.innerHTML = '<div id="progressBar"></div>';
                    var bar = new ProgressBar.Line('#progressBar', {
                        strokeWidth: 4,
                        easing: 'easeInOut',
                        duration: 1400,
                        color: '#FFEA82',
                        trailColor: '#eee',
                        trailWidth: 1,
                        svgStyle: {width: '100%', height: '100%'},
                        text: {
                            style: {
                                color: '#999',
                                position: 'absolute',
                                left: '40%',
                                top: '50%',
                                padding: 0,
                                margin: 0,
                                transform: null
                            },
                            autoStyleContainer: false
                        },
                        from: {color: '#FFEA82'},
                        to: {color: '#ED6A5A'},
                        step: (state, bar) => {
                            bar.setText(Math.round(bar.value() * 100) + ' %');
                        }
                    }); 

                    bar.animate(1.0); // Number from 0.0 to 1.0

                    // Simulate completion of upload
                    setTimeout(function () {
                        progressBarContainer.innerHTML = ''; // Remove progress bar when done

                        input.value = 'path/to/uploaded/image.jpg';
                    }, 1500); // Simulation time (can be changed)
                }
            }
        </script>
        <script>
            tinymce.init({
                selector: '.tinymce',
                width: 500,
                height: 300,
                plugins: [
                    'advlist', 'autolink', 'link', 'image', 'lists', 'charmap', 'prewiew', 'anchor', 'pagebreak',
                    'searchreplace', 'wordcount', 'visualblocks', 'code', 'fullscreen', 'insertdatetime', 'media',
                    'table', 'emoticons', 'template', 'codesample'
                ],
                toolbar: 'undo redo | styles | bold italic underline | alignleft aligncenter alignright alignjustify |' +
                        'bullist numlist outdent indent | link image | print preview media fullscreen | ' +
                        'forecolor backcolor emoticons',
                menu: {
                    favs: {title: 'menu', items: 'code visualaid | searchreplace | emoticons'}
                },
                menubar: false,
                content_style: 'body{font-family:Helvetica,Arial,sans-serif; font-size:16px}'
            });
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
            document.addEventListener("DOMContentLoaded", function () {
                // Chờ cho DOM được tải hoàn toàn trước khi thêm các sự kiện nghe
                var addForm = document.getElementById("addForm");

                addForm.addEventListener("submit", function (event) {
                    // Hủy sự kiện mặc định để ngăn form submit
                    event.preventDefault();

                    // Gọi hàm kiểm tra validation
                    if (validateForm()) {
                        // Nếu hợp lệ, thực hiện submit form
                        addForm.submit();
                    }
                });

                function validateForm() {
                    var name = document.getElementById("name").value;
                    var price = document.getElementById("price").value;
                    var rating = document.getElementById("rating").value;
                    var quantity = document.getElementById("quantity").value;
                    var color = document.getElementById("color").value;
                    var image = document.getElementById("image").value;

                    // Thực hiện các kiểm tra validation ở đây
                    // kiểm tra nếu một trường không được bỏ trống
                    if (name.trim() === "" || price.trim() === "" || rating.trim() === "" ||
                            image.trim() === "" || quantity.trim() === "" || color.trim() === "") {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "All fields have to be filled!",
                            footer: '<a href="#">Zay Store so sorry about this confuse?</a>'
                        });
                        return false;
                    }

                    // Nếu tất cả kiểm tra đều hợp lệ, trả về true
                    return true;
                }
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


