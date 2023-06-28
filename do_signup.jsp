<%-- 
    Document   : DO_login
    Created on : 23 Mar, 2021, 11:48:50 AM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Practical Multi-keyword Ranked Search</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
    </head>
    <body>
        <!-- Page Loader -->
        <div id="loader-wrapper">
            <div id="loader"></div>
            <div class="loader-section section-left"></div>
            <div class="loader-section section-right"></div>

        </div>
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand">
                    <i class="fas fa-bars mr-2"></i>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2 active" href="DO_login.jsp">Data Owner</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="DU_login.jsp">Data User</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="Cloud_login.jsp">Cloud</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="tm-hero d-flex justify-content-center align-items-center" id="tm-video-container">
            <video autoplay muted loop id="tm-video">
                <source src="video/search.mp4" type="video/mp4">
            </video> 
            <div class="intro-content">
                <h3>Practical Multi-keyword Ranked Search with
                    Access Control over Encrypted Cloud Data</h3>
            </div>
        </div>
        <div class="container-fluid tm-mt-60">
            <div class="row tm-mb-50">
                <div class="col-md-6">
                    <center>
                        <br> <br> <br> <br> <br>
                        <img src="img/reg.jpg" width="450" height="500" />
                    </center>
                </div>
                <div class="col-md-6">
                    <br>
                    <center>
                        <h2 class="tm-text-primary ">Data Owner Register</h2><br><br>
                    </center>
                    <form id="contact-form" action="do_reg" method="POST" class="tm-contact-form mx-auto">
                        <div class="form-group">
                            <label><b>Name :</b></label>
                            <input type="text" name="username" class="form-control rounded-0" placeholder="Enter Your Name" required />
                        </div>
                        <div class="form-group">
                            <label><b>DOB :</b></label>
                            <input type="date" name="dob" class="form-control rounded-0" required />
                        </div>
                        <div class="form-group">
                            <label><b>Email :</b></label>
                            <input type="email" name="email" class="form-control rounded-0" placeholder="Enter Your Email" required />
                        </div>
                        <div class="form-group">
                            <label><b>Gender :</b></label>
                            <select class="form-control" id="contact-select" name="gender" required>
                                <option value="">Select Your Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Others</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label><b>Phone :</b></label>
                            <input type="text" name="phone" class="form-control rounded-0" placeholder="Enter Your Phone No" required />
                        </div>
                        <div class="form-group">
                            <label><b>Address :</b></label>
                            <input type="text" name="address" class="form-control rounded-0" placeholder="Enter Your Address" required />
                        </div>
                        <div class="form-group">
                            <label><b>Password :</b></label>
                            <input type="password" name="pass" class="form-control rounded-0" placeholder="Enter Your Password" required />
                        </div>
                        <div class="form-group tm-text-right">
                            <button type="submit" class="btn btn-success">Sign Up</button>
                        </div>
                    </form>   
                </div> 
            </div>
        </div>
        <footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
            <div class="container-fluid tm-container-small">
                <div class="row">
                </div>
            </div>
        </footer>
        <script src="js/plugins.js"></script>
        <script>
            $(window).on("load", function () {
                $('body').addClass('loaded');
            });
        </script>
    </body>
</html>
