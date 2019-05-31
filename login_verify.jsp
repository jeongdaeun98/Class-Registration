<%--
  Created by IntelliJ IDEA.
  User: hyeon
  Date: 2019-05-21
  Time: 오후 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="./login.jsp"%>
<form method="post" action="login.jsp"></form>
<form method="post" action="main.jsp"></form>

<%
    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");

    Connection myConn;
    Statement stmt;
    ResultSet rs;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        myConn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
            "dbp", "123");
        String mySQL= "select s_id from students where s_id='" + userID + "' and s_pwd='" + userPassword + "'";
        stmt = myConn.createStatement();
        System.out.println(mySQL);

        rs = stmt.executeQuery(mySQL);

        if(rs.next()) {
            String getID = rs.getString("s_id");
            if(getID.equals(userID)){
                session.setAttribute("user", getID);
                response.sendRedirect("main.jsp");
            }
        }

        else {
            response.sendRedirect("login.jsp");
        }

        rs.close();
        stmt.close();
        myConn.close();
    }
    catch(ClassNotFoundException e) {
        e.printStackTrace();
    }
    catch(SQLException e) {
        e.printStackTrace();
    }

%>
