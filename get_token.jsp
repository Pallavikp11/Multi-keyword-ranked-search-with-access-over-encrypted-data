<%-- 
    Document   : get_token
    Created on : 9 Jan, 2021, 6:45:23 PM
    Author     : JAVA-JP
--%>

<%@page import="Networks.Mail"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uid = request.getParameter("id");
    String uname = request.getParameter("name");
    String umail = request.getParameter("email");

    System.out.println("Check User uid And uname : " + uid + uname);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    Statement sto = con.createStatement();
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    String time = dateFormat.format(date);

    try {
        ResultSet rs = st.executeQuery("SELECT * FROM search_token where uid='" + uid + "'");
        if (rs.next() == true) {
            
            Random RANDOM = new SecureRandom();
            int PASSWORD_LENGTH = 5;
            String letters = "0123456789";
            String token = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                token += letters.substring(index, index + 1);
            }
            String Search_token = "F" + token;

            int i = st1.executeUpdate("update search_token set search_token='" + Search_token + "' WHERE uid = '"+ uid +"'");
            
           
            String msggg = "User Name : " + uname + " \nYour File Search Token : " + Search_token + "";
            Mail ma = new Mail();
            ma.secretMail(msggg, "Search_token", umail);
            String msg = "File Search Token:" + msggg;
            System.out.println("success");

            response.sendRedirect("Get_search_token.jsp?Success");
        } else {

            Random RANDOM = new SecureRandom();
            int PASSWORD_LENGTH = 5;
            String letters = "0123456789";
            String token = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                token += letters.substring(index, index + 1);
            }
            String Search_token = "F" + token;

            int i = sto.executeUpdate("insert into search_token(uid, uname, time , status , search_token)values('" + uid + "', '" + uname + "', '" + time + "', 'Approved', '" + Search_token + "')");;
            if (i != 0) {

                String msggg = "User Name : " + uname + " \n Your File Search Token : " + Search_token + "";
                Mail ma = new Mail();
                ma.secretMail(msggg, "Search_token", umail);
                String msg = "File Search Token:" + msggg;
                System.out.println("success");
            response.sendRedirect("Get_search_token.jsp?Success");
            }
            else {
            response.sendRedirect("Get_search_token.jsp?Failed");
        }
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>