<%--
  Created by IntelliJ IDEA.
  User: hyeon
  Date: 2019-05-27
  Time: 오후 7:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=EUC-KR" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>수강신청 입력</title>
</head>
<body>
<%@ include file="top.jsp" %>
<% if (session_id == null) response.sendRedirect("login.jsp"); %>

<table width="75%" align="center" border>
    <br>
    <tr>
        <th>과목번호</th>
        <th>분반</th>
        <th>수업시간-1</th>
        <th>수업시간-1</th>
        <th>수업시간-2</th>
        <th>수업시간-2</th>
        <th>과목명</th>
        <th>학점</th>
        <th>수강신청</th>
    </tr>

    <%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String mySQL = "";
    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String user = "dbp";
    String pw = "123";
    String driver = "oracle.jdbc.driver.OracleDriver";

    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, user, pw);
        stmt = conn.createStatement();

        mySQL = "select c_id, c_unit, c_day1, c_time1, c_day2, c_time2, c_name, c_credit " +
                "from course " +
                "where c_id not in (select c_id from enroll where s_id='" + session_id + "')";

        rs = stmt.executeQuery(mySQL);

        if(rs != null) {
            while(rs.next()) {
                String c_id = rs.getString("c_id");
                int c_unit = rs.getInt("c_unit");
                int c_day1 = rs.getInt("c_day1");
                int c_time1 = rs.getInt("c_time1");
                int c_day2 = rs.getInt("c_day2");
                int c_time2 = rs.getInt("c_time2");
                String c_name = rs.getString("c_name");
                int c_credit = rs.getInt("c_credit");
                %>

    <tr>
        <td align="center"><%=c_id%></td>
        <td align="center"><%=c_unit%></td>
        <td align="center"><%=c_day1%></td>
        <td align="center"><%=c_time1%></td>
        <td align="center"><%=c_day2%></td>
        <td align="center"><%=c_time2%></td>
        <td align="center"><%=c_name%></td>
        <td align="center"><%=c_credit%></td>
        <td align="center"><a href="insert_verify.jsp?c_id=<%=c_id%>">신청</a></td>
    </tr>
    <%
            }
        }
        stmt.close();
        conn.close();
    }

    catch(ClassNotFoundException e) {
        e.printStackTrace();
    }

    catch(SQLException e) {
        System.err.println("SQLException : " + e.getMessage());
    }
    %>
</table>
</body>
</html>
