<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>강의추가 및 삭제</title>
    <script language="javascript">
    function showPopup(){
    	window.open("insert_professor.jsp","insert","width=500,height=500,left=100,top=50");
    }
    </script>
</head>
<body>
<%
String session_identity = (String)session.getAttribute("identity");
if(session_identity!=null){
	if(session_identity.equals("student")){
%>
		<%@include file="top.jsp"%>
	<%}
	else{
%>
		<%@include file="top_professor.jsp"%>
	<%}
}
else{%>
	<%@include file="top.jsp"%>
<%}
%>
<%	String sessionID = (String)session.getAttribute("userID");
	if (sessionID == null) { %>
	<script>
		alert("로그인한 후 사용하세요.");
		location.href="login.jsp";
	</script>
<%	}
	session.setMaxInactiveInterval(20*60);

    String day[]={"일","월","화","수","목","금","토"};
    String type[]={"교양", "전공"};
    
    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String user = "dbp";
    String pw = "123";
    String driver = "oracle.jdbc.driver.OracleDriver";
    try {
        Class.forName(driver);
        Connection conn = DriverManager.getConnection(url, user, pw);
        CallableStatement cstmt = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
        cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
        cstmt.execute();
        int nYear = cstmt.getInt(1);
        cstmt = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
        cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
        cstmt.execute();
        int nSemester = cstmt.getInt(1);
        cstmt.close();
%>
<br>
<table width="75%" align="center" border="0">
	<tr><td align="center"><font size="5px"><b><%= nYear %>학년도 <%= nSemester %>학기 강의 	</b></font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" value="강의 추가"onclick="showPopup();"/></td></tr>
		<br>
</table>
<table width="75%" align="center" border>
    <tr>
        <th>과목번호</th>
        <th>과목명</th>
        <th>분반</th>
        <th>교과구분</th>
        <th>강의시간</th>
        <th>교수명</th>
        <th>학점</th>
        <th>정원</th>
        <th>신청</th>
        <th>삭제</th>
    </tr>
<%
        Statement stmt = conn.createStatement();
        String selectAttributes = "select c.c_id as c_id, c.c_name as c_name, c.c_unit as c_unit, c.c_type as c_type, t.t_day1 as t_day1, t.t_time1 as t_time1, t.t_day2 as t_day2,"+
        		"t.t_time2 as t_time2, t.t_location as t_location, p.p_name as p_name, c.c_credit as c_credit, t.t_personnel as t_personnel "
        		+ "from course c, teach t, professor p "
        		+ "where c.c_id = t.c_id AND c.c_unit = t.c_unit AND t.p_id = p.p_id AND t.t_year = '" + nYear + "' AND t.t_semester = '" + nSemester + "' and t.p_id = '"+
        				sessionID+"'";
        ResultSet rs = stmt.executeQuery(selectAttributes);
        if(rs != null) {
            while(rs.next()) {
                String c_id = rs.getString("c_id");
                String c_name = rs.getString("c_name");
                String c_unit = rs.getString("c_unit");
                String c_type = type[rs.getInt("c_type")];
                String t_day1 = day[rs.getInt("t_day1")];
                int t_time1 = rs.getInt("t_time1");
                String full_day = t_day1 + " " + t_time1 + "교시";
                String t_day2 = day[rs.getInt("t_day2")];
                int t_time2 = rs.getInt("t_time2");
                if (!rs.wasNull())
                	full_day += ", " + t_day2 + " " + t_time2 + "교시";
               	full_day += " (" + rs.getString("t_location") +")";
                String p_name = rs.getString("p_name");
                int c_credit = rs.getInt("c_credit");
                int t_personnel = rs.getInt("t_personnel");
                
                int registered = 0;
                String queryRegisteredCount = "select COUNT(*) as cnt from enroll where c_id = '"+c_id+"' and c_unit='"+c_unit+"'";
                
                Statement stmt2 = conn.createStatement();
                ResultSet rs2 = stmt2.executeQuery(queryRegisteredCount);
                if(rs2 != null){
                	while(rs2.next()){
                		registered = rs2.getInt("cnt");
                	}
                }
                
				stmt2.close();
				
%>
    <tr>
        <td align="center"><%=c_id%></td>
        <td align="center"><%=c_name%></td>
        <td align="center"><%=c_unit%></td>
        <td align="center"><%=c_type%></td>
        <td align="center"><%=full_day%></td>
        <td align="center"><%=p_name%></td>
        <td align="center"><%=c_credit%></td>
        <td align="center"><%=t_personnel%></td>
        <td align="center"><%=registered%></td>
        <td align="center"><a href="delete_verify_professor.jsp?c_id=<%=c_id%>&c_unit=<%=c_unit%>">삭제</a></td>
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