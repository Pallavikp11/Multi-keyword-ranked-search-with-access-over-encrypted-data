<%-- 
    Document   : DO_login
    Created on : 23 Mar, 2021, 11:48:50 AM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
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
                            <a class="nav-link nav-link-2" href="DU_Home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="Get_search_token.jsp">Search Token</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="Search_file.jsp">Search File</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2 active" href="Requested_files.jsp">Requested Files</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="downloaded_files2.jsp">Downloaded Files</a>
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
        <div class="container-fluid tm-mt-60">
            <div class="row tm-mb-50">
                <center>
                    <h2 class="tm-text-primary ">Decrypted File</h2><br><br>
                </center>
                <div class="col-md-4">
                    <br>
                    <center>
                        <img src="img/download1.jpg" width="450" height="400" />
                    </center>
                </div>
                <div class="col-md-7">
                    <br>
                    <%
                        String uid = (String) session.getAttribute("duid");
                        String fid = request.getParameter("fid");
                        String time = request.getParameter("time");
                        String dkey = request.getParameter("dkey");
                        System.out.println("File ID : " + fid);
                        Connection con = SQLconnection.getconnection();
                        Statement st = con.createStatement();
                        Statement st1 = con.createStatement();
                        Statement st2 = con.createStatement();
                        Statement st3 = con.createStatement();
                        Statement st4 = con.createStatement();
                        String file = null;
                        try {

                            ResultSet rs1 = st1.executeQuery("Select * from request where uid = '" + uid + "' AND fid = '" + fid + "' AND time ='" + time + "' AND dkey = '" + dkey + "' AND access_policy = 'Read' ");
                            if (rs1.next() == true) {
                                ResultSet rs = st.executeQuery("Select * from do_files where id = '" + fid + "'");
                                if (rs.next()) {
                    %>
                    <form id="contact-form" method="POST" class="tm-contact-form mx-auto">
                        <div class="form-group">
                            <input type="hidden" value="<%=fid%>" name="fid">
                            <input type="hidden" value="<%=dkey%>" name="dkey">
                            <label><b>File Name:</b></label><br>
                            <input type="text" class="form-control" style="width: 500px;" name="filename" readonly="" value="<%=rs.getString("filename")%>" />   <br> 
                        </div>
                        <div class="form-group">
                            <label><b>File Content:</b></label><br>
                            <textarea class="form-control" style=" height: 190px; width: 500px;resize: none" readonly="" name="data"><%=rs.getString("data")%></textarea>  <br>         
                        </div>
                    </form> 
                    <%                          }
                    } else {
                        ResultSet rt = st2.executeQuery("Select * from request where uid = '" + uid + "' AND fid = '" + fid + "' AND time ='" + time + "' AND dkey = '" + dkey + "'");
                        if (rt.next()) {
                            ResultSet rt1 = st3.executeQuery("Select * from do_files where id = '" + fid + "'");

                            if (rt1.next()) {

                    %>
                    <form id="contact-form" method="POST" action="download" class="tm-contact-form mx-auto">
                        <div class="form-group">
                            <input type="hidden" value="<%=fid%>" name="fid">
                            <input type="hidden" value="<%=dkey%>" name="dkey">
                            <label><b>File Name:</b></label><br>
                            <input type="text" class="form-control" name="filename" readonly="" value="<%=rt.getString("filename")%>" />   <br> 
                        </div>
                        <div class="form-group">
                            <label><b>File Content:</b></label><br>
                            <textarea class="form-control" style=" height: 170px;resize: none" readonly="" name="data"><%=rt1.getString("data")%></textarea>  <br>         
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-download"></i> &nbsp;Download
                            </button>
                        </div>
                    </form>
                    <%           }
                                } else {
                                    response.sendRedirect("view_requested.jsp?Incorrect_key_values");
                                }
                            }

                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
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
