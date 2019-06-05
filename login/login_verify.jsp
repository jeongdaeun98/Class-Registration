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
    String identity=null;
    if(userID.length()==5){
    	identity="professor";
    }
    else{
    	identity="student";
    }
	
    Connection myConn;
    Statement stmt;
    ResultSet rs;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        myConn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
            "dbp", "123");
        String mySQL=null;
        
        if(identity.equals("student")){
        	mySQL= "select s_id as id from students where s_id='" + userID + "' and s_pwd='" + userPassword + "'";
        }
        else if(identity.equals("professor")){
        	mySQL= "select p_id as id from professor where p_id='" + userID + "' and p_pwd='" + userPassword + "'";
        }
        
        stmt = myConn.createStatement();
        rs = stmt.executeQuery(mySQL);
        if(rs.next()) {
            String getID = rs.getString("id");
            if(getID.equals(userID)){
                session.setAttribute("userID", getID);
                session.setAttribute("identity", identity);
                response.sendRedirect("main.jsp");
            }
        }

        else {%>
        	<script type = "text/javascript"> 
        	alert("로그인에 실패하였습니다.");
       		location.href="login.jsp" 
        	</script>
        <%}

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
