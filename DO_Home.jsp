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
        if (request.getParameter("Success") != null) {
    %>
    <script>alert('Login Success');</script>
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
                            <a class="nav-link nav-link-2 active" href="DU_Home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="Upload_file.jsp">Upload File</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="My_files.jsp">My Files</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="req_files.jsp">Requested Files</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="downloaded_files1.jsp">Downloaded Files</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="index.html">Logout</a>
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
        <%
            String id = (String) session.getAttribute("doid");
            String name = (String) session.getAttribute("doname");
            String email = (String) session.getAttribute("domail");


        %>
        <div class="container-fluid tm-mt-60">
            <div class="row tm-mb-50">
                <center>
                    <h2 class="tm-text-primary ">Welcome <%=name.toUpperCase()%>!</h2><br><br>
                </center>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <br>
                    <img src="img/dohome.jpg" width="1100" height="550" />
                </div> 
            </div>
        </div>
        <script src="js/plugins.js"></script>
        <script>
        $(window).on("load", function () {
            $('body').addClass('loaded');
        });
        </script>
    </body>
</html>
