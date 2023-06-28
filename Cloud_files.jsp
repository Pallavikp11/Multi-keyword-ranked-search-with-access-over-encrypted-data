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
    <style>

        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 2px solid black;
            align:"center";  cellpadding:"0"; cellspacing:"2";
            padding: 15px;
        }


        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #009999;
            color: white;
        }
    </style>
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
                            <a class="nav-link nav-link-2" href="Cloud_Home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2 active" href="Cloud_files.jsp">Cloud Files</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="downloaded_files.jsp">Downloaded Files</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="graph.jsp">Graph</a>
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
                <div class="col-lg-12">
                    <br>
                    <center>
                        <h2 class="tm-text-primary ">Cloud Files</h2><br><br>
                    </center>
                    <table id="customers">
                        <tr>
                            <th>File ID</th>
                            <th>File Name</th>
                            <th>Data Owner Name</th>
                            <th>File Keyword</th>
                            <th>Uploaded Time</th>
                        </tr>
                        <%
                            Connection con = SQLconnection.getconnection();
                            Statement st = con.createStatement();
                            try {
                                ResultSet rs = st.executeQuery("SELECT * FROM do_files");
                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString("id")%></td>
                            <td><%=rs.getString("filename")%></td>
                            <td><%=rs.getString("doname")%></td>
                            <td><%=rs.getString("filekeyword")%></td>
                            <td><%=rs.getString("time")%></td>
                        </tr>
                        <%                                        }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }


                        %>
                    </table>
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
