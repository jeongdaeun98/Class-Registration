<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수강생 조회</title>
</head>
<body>
<%@ include file="top_professor.jsp" %>
<table width="75%" align="center" border="0">
	<br>
	<tr><td align="center"><font size="5px"><b>수강학생 조회</b></font></td></tr>
	<tr><td align="right">
	<br>
		<form name="search" action="view_students.jsp" method ="get">
			<select name="year" onchange="setTime()">
				<option value="2019" selected>2019</option>
				<option value="2018">2018</option>
			</select>
			<select name="semester" onchange="setTime()">
				<option value="1">1학기</option>
				<option value="2" selected>2학기</option>
			</select>
			<input type="text" placeholder="과목명 혹은 과목 번호를 입력하세요" name="course" style="width:25%" />
			<input type="text" placeholder="분반을 입력하세요" name="unit" maxlength="3"/>
			<input type="submit" value="검색"/>  
		</form>
	</td></tr>
</table>
<%	
	session_id = (String)session.getAttribute("userID");
	if (session_id == null) { %>
	<script>
		alert("로그인한 후 사용하세요.");
		location.href="login.jsp";
	</script>
<%	}  
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "dbp";
	String passwd = "123";
	Class.forName(dbdriver);
	Connection myConn=DriverManager.getConnection(dburl, user, passwd);
	Statement stmt = myConn.createStatement();
	int nYear = 0, nSemester = 0;
	String course = "", unit = "";
	try {
		nYear = Integer.parseInt(request.getParameter("year"));
		nSemester = Integer.parseInt(request.getParameter("semester"));
		course = request.getParameter("course");
		unit = request.getParameter("unit");
	} catch(Exception e) {
		nYear = 0;
		nSemester = 0;
		course = "";
		unit = "";
	}
	String selectCourse = "select c.c_id, c.c_name from course c, teach t "
							+ "where (c.c_id='" + course + "' or c.c_name='" + course + "') and c.c_id = t.c_id and t.c_unit='" + unit + "' and t.t_year='" + nYear + "' and t.t_semester='" + nSemester + "'";
	ResultSet rs = stmt.executeQuery(selectCourse);
	String c_id = "", c_name = "";
	if (rs.next()) {
		c_id = rs.getString("c_id");
		c_name = rs.getString("c_name");
	}
	if (nYear != 0 && c_id.equals("")) {
		rs.close();
		stmt.close(); %>
		<script>
			fail_to_search();
			function fail_to_search() {
				alert("해당 과목 데이터가 존재하지 않습니다.");
				location.href = "view_students.jsp";
			}
		</script>
<%	}
	rs.close();
	stmt.close();
	stmt = myConn.createStatement();
	String selectPid = "select p_id from teach where c_id='" + c_id + "' and c_unit='" + unit + "' and t_year='" + nYear + "' and t_semester='" + nSemester + "'";
	rs = stmt.executeQuery(selectPid);
	if (rs.next()) {
		String p_id = rs.getString("p_id");
		if (!p_id.equals(session_id)) { %>
			<script>
				invalid_approach();
				function invalid_approach() {
					alert("접근 권한이 없습니다.");
					location.href = "view_students.jsp";
				}
			</script>
<%		}
		else {
%>
<table width="75%" align="center" border="0">
	<tr><td align="center"><%=nYear%>년도 <%=nSemester%>학기 <%=c_name%> <%=unit%>분반에 수강신청한 학생</td></tr>
</table>
<table width="75%" align="center" border>
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>전공</th>
		<th>휴대폰 번호</th>
		<th>메일 주소</th>
	</tr>
<%
		}
	}
	stmt = myConn.createStatement();
	String selectStudents = "select s_id, s_name, s_major, s_phone, s_email from students where s_id in ("
					+ "select e.s_id from enroll e, teach t "
					+ "where t.p_id='" + session_id + "' and t.c_id='"+ c_id + "' and t.c_unit='" + unit + "' "
					+ "and t.t_year='" + nYear + "' and t.t_semester='" + nSemester + "' "
					+ "and t.c_id = e.c_id and t.c_unit = e.c_unit and t.t_year = e.e_year and t.t_semester = e.e_semester)";
	rs = stmt.executeQuery(selectStudents);
	if(rs != null) {
         while(rs.next()) {
        	 String s_id = rs.getString("s_id");
        	 String s_name = rs.getString("s_name");
        	 String s_major = rs.getString("s_major");
        	 String s_phone = rs.getString("s_phone");
        	 String s_email = rs.getString("s_email");
        	 %>
	<tr>
		<td align="center"><%=s_id%></td>
	    <td align="center"><%=s_name%></td>
	    <td align="center"><%=s_major%></td>
	    <td align="center"><%=s_phone%></td>
        <td align="center"><%=s_email%></td>
    </tr>
<%         }
	}
	stmt.close();
%>
</body>
</html>