<%@ page contentType="text/html;charset=EUC-KR" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>수강신청 입력</title>
</head>
<body>
<%@ include file="top.jsp" %>

<%	session_id = (String)session.getAttribute("userID");
	if (session_id == null) response.sendRedirect("login.jsp");
%>

<table width="75%" align="center" border>
    <br>
    <tr>
        <th>과목번호</th>
        <th>과목명</th>
        <th>분반</th>
        <th>강의시간</th>
        <th>교수명</th>
        <th>학점</th>
        <th>정원</th>
        <th>신청</th>
        <th>여석</th>
        <th>교과구분</th>
        <th>수강신청</th>
    </tr>

    <%
    String day[]={"일","월","화","수","목","금","토"};
    
    Connection conn = null;
    Connection conn2 = null;
    Connection conn3 = null;
    Statement stmt = null;
    Statement stmt2 = null;
    Statement stmt3 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
    String mySQL = "";
    String mySQL2 = "";
    String mySQL3 = "";
    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String user = "dbp";
    String pw = "123";
    String driver = "oracle.jdbc.driver.OracleDriver";
    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, user, pw);
        conn2 = DriverManager.getConnection(url, user, pw);
        conn3 = DriverManager.getConnection(url, user, pw);
        stmt = conn.createStatement();
        stmt2 = conn2.createStatement();
        stmt3 = conn2.createStatement();
        mySQL = "select c_id, c_unit, c_day1, c_time1, c_day2, c_time2, c_name, c_credit, c_personnel, c_type from course";
        rs = stmt.executeQuery(mySQL);
        if(rs != null) {
            while(rs.next()) {
                String c_id = rs.getString("c_id");
                String c_unit = rs.getString("c_unit");
                
                mySQL3 = "select p_name from professor where p_id = (select p_id from teach where c_id = '"+c_id+"' and c_unit= '" + c_unit + "')";
                rs3=stmt3.executeQuery(mySQL3);
                String p_name="";
                if(rs3!=null){
                	while(rs3.next()){
                		p_name = rs3.getString("p_name");
                	}
                }
                String c_day1 = day[rs.getInt("c_day1")];
                String c_time1 = Integer.toString(rs.getInt("c_time1"))+"교시";
                String c_day2 = day[rs.getInt("c_day2")];
                String c_time2 = Integer.toString(rs.getInt("c_time2"))+"교시";
                String c_name = rs.getString("c_name");
                int c_credit = rs.getInt("c_credit");
                int c_personnel = rs.getInt("c_personnel");
                int remain=0;;
                int registered=0;
                
                mySQL2="select COUNT(c_id) as cnt from enroll where c_id = '"+c_id+"' and c_unit='"+c_unit+"'";
                rs2=stmt2.executeQuery(mySQL2);
                if(rs2!=null){
                	while(rs2.next()){
                		registered = rs2.getInt("cnt");
                	}
                }
                remain = c_personnel - registered;
                int c_type = rs.getInt("c_type");
                String full_day = c_day1+" "+c_time1+" "+", "+c_day2+" "+c_time2;
                String type;
                if(c_type==0){
                	type="교양";
                }
                else{
                	type="전공";
                }
                
                %>

    <tr>
        <td align="center"><%=c_id%></td>
        <td align="center"><%=c_name%></td>
        <td align="center"><%=c_unit%></td>
        <td align="center"><%=full_day%></td>
        <td align="center"><%=p_name%></td>
        <td align="center"><%=c_credit%></td>
        <td align="center"><%=c_personnel%></td>
        <td align="center"><%=registered%></td>
        <td align="center"><%=remain%></td>
        <td align="center"><%=type%></td>
        <td align="center"><a href="insert_verify.jsp?c_id=<%=c_id%>">신청</a></td>
    </tr>
    <%
            }
        }
        /*stmt3.close();
        conn3.close();*/
        stmt2.close();
    	conn2.close();
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