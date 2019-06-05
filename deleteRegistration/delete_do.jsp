<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String session_id = (String)session.getAttribute("userID");
	String c_id = request.getParameter("c_id");
	String c_unit = request.getParameter("c_unit");
%>
<%
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "dbp";
	String passwd = "123";
	
	Class.forName(dbdriver);
	Connection conn=DriverManager.getConnection(dburl, user, passwd);
	CallableStatement cstmt = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
    cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
    cstmt.execute();
    int nYear = cstmt.getInt(1);
    cstmt = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
    cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
    cstmt.execute();
    int nSemester = cstmt.getInt(1);
 
	Statement Stmt = conn.createStatement();
	String deleteEnroll = "delete from enroll where s_id='" + session_id + "' AND c_id='" + c_id + "' AND c_unit='" + c_unit + "' AND e_year='" + nYear + "' AND e_semester='" + nSemester + "'";
	int res = Stmt.executeUpdate(deleteEnroll);
	if (res > 0) { %>
		<script>
			alert_and_fin();
			function alert_and_fin() {
				alert("삭제 완료");
				location.href = "delete.jsp";
			}
		</script>
<%	}
	cstmt.close();
	Stmt.close();
%>