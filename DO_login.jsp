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
    <%
        if (request.getParameter("Register_Success") != null) {
    %>
    <script>alert('Registration Success');</script>
    <%            }
    %>
    <%
        if (request.getParameter("Failed") != null) {
    %>
    <script>alert('Login Failed');</script>
    <%            }
    %>
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
                        <img src="img/do_login.png" width="450" height="350" />
                    </center>
                </div>
                <div class="col-md-6">
                    <br>
                    <center>
                        <h2 class="tm-text-primary ">Data Owner Login</h2><br><br>
                    </center>

                    <form id="contact-form" action="do_signin.jsp" method="POST" class="tm-contact-form mx-auto">
                        <div class="form-group">
                            <label><b>Email :</b></label>
                            <input type="email" name="email" class="form-control rounded-0" placeholder="Enter Your Email" required />
                        </div>
                        <div class="form-group">
                            <label><b>Password :</b></label>
                            <input type="password" name="pass" class="form-control rounded-0" placeholder="Enter Your Password" required />
                        </div>
                        <div class="form-group tm-text-right">
                            <button type="submit" class="btn btn-success">Login</button>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="do_signup.jsp" class="btn btn-primary">Register !</a>
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
