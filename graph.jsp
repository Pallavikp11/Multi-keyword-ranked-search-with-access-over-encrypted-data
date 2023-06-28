<%-- 
    Document   : DO_login
    Created on : 23 Mar, 2021, 11:48:50 AM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.Gson"%>
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
                            <a class="nav-link nav-link-2" href="Cloud_Home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="Cloud_files.jsp">Cloud Files</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2" href="downloaded_files.jsp">Downloaded Files</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-2 active" href="graph.jsp">Graph</a>
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
                        <h2 class="tm-text-primary ">Analysis</h2><br><br>
                    </center>
                    <%
                        String val1 = "", val2 = "", val3 = "";
                        String val11 = "", val22 = "", val33 = "";
                        int i = 0;

                        try {
                            Connection con = SQLconnection.getconnection();

                            Statement st1 = con.createStatement();
                            ResultSet rs2 = st1.executeQuery("SELECT  AVG(enc_time) FROM  do_files ");
                            rs2.next();
                            {
                                val2 = rs2.getString("AVG(enc_time)");
                            }
                            rs2.close();
                            Statement st2 = con.createStatement();
                            ResultSet rs3 = st2.executeQuery("SELECT  AVG(decrypt_time) FROM  download ");
                            rs3.next();
                            {
                                val3 = rs3.getString("AVG(decrypt_time)");
                            }
                            System.out.println("count------------------> " + val2);
                            System.out.println("count------------------> " + val3);

                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                    <script type="text/javascript">
                        window.onload = function () {

                            var chart = new CanvasJS.Chart("chartContainer", {
                                animationEnabled: true,
                                exportEnabled: true,
                                theme: "light2", // "light1", "light2", "dark1", "dark2"
                                title: {
                                    text: ""
                                },
                                axisY: {
                                    title: "Time in MS"
                                },
                                data: [{
                                        type: "column",
                                        showInLegend: true,
                                        legendMarkerColor: "grey",
                                        legendText: "Entities",
                                        dataPoints: [
                                            {y: <%=val2%>, label: "Avg Encryption_Time in MS"},
                                            {y: <%=val3%>, label: "Avg Decryption_Time in MS"}

                                        ]
                                    }]
                            });
                            chart.render();
                        }
                    </script>
                    <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
                </div>
            </div>
        </div>
                                            <script type="text/javascript" src="assets/js/custom.js"></script>
                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                <!-- About us Skills Circle progress  -->
                <script>
                                            // First circle
                                            new Circlebar({
                                                element: "#circle-1",
                                                type: "progress",
                                                maxValue: "90"
                                            });

                                            // Second circle
                                            new Circlebar({
                                                element: "#circle-2",
                                                type: "progress",
                                                maxValue: "84"
                                            });

                                            // Third circle
                                            new Circlebar({
                                                element: "#circle-3",
                                                type: "progress",
                                                maxValue: "60"
                                            });

                                            // Fourth circle
                                            new Circlebar({
                                                element: "#circle-4",
                                                type: "progress",
                                                maxValue: "74"
                                            });

                </script>
        <script src="js/plugins.js"></script>
        <script>
                        $(window).on("load", function () {
                            $('body').addClass('loaded');
                        });
        </script>
    </body>
</html>
