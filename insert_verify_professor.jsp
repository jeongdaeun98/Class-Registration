<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
<form method="post" action="insert_professor.jsp"></form>
 <%
 String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
 String user = "dbp";
 String passwd = "123";
 String driver = "oracle.jdbc.driver.OracleDriver";
 try {
	 String c_id = request.getParameter("c_id");
	 String p_id = (String)session.getAttribute("userID");
	 String c_name = request.getParameter("c_name");
	 String c_unit = request.getParameter("c_unit");
	 int c_type = Integer.parseInt(request.getParameter("c_type"));
	 int t_day1 = Integer.parseInt(request.getParameter("t_day1"));
	 int t_day2 = Integer.parseInt(request.getParameter("t_day2"));
	 int t_time1 = Integer.parseInt(request.getParameter("t_time1"));
	 int t_time2 = Integer.parseInt(request.getParameter("t_time2"));
	 int t_perssonnel = Integer.parseInt(request.getParameter("t_perssonnel"));
	 String t_location = request.getParameter("t_location");
	 int c_credit = Integer.parseInt(request.getParameter("c_credit"));
	 String c_major = request.getParameter("c_major");
	 if(t_day1 == t_day2 && t_time1 == t_time2) %><script>alert("시간과 날짜가 동일합니다.");location.href="insert_professor.jsp";</script> <%
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dburl, user, passwd);
		CallableStatement cstmt = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
    	cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
    	cstmt.execute();
    	int nYear = cstmt.getInt(1);
    	cstmt = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
    	cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
    	cstmt.execute();
    	int nSemester = cstmt.getInt(1);
    	cstmt = conn.prepareCall("{call insertCourse(?,?,?,?,?,?)}");
    	cstmt.setString(1,c_id);
    	cstmt.setString(2,c_name);
    	cstmt.setString(3,c_unit);
    	cstmt.setInt(4,c_credit);
    	cstmt.setInt(5,c_type);
    	cstmt.setString(6,c_major);
    	cstmt.execute();
    cstmt = conn.prepareCall("{call insertTeach(?,?,?,?,?,?,?,?,?,?,?)}");
    cstmt.setString(1,p_id);
	cstmt.setString(2,c_id);
	cstmt.setString(3,c_unit);
	cstmt.setInt(4,nYear);
	cstmt.setInt(5,nSemester);
	cstmt.setInt(6,t_day1);
	cstmt.setInt(7,t_time1);
	cstmt.setInt(8,t_day2);
	cstmt.setInt(9,t_time2);
	cstmt.setInt(10,t_perssonnel);
	cstmt.setString(11,t_location);
	cstmt.execute();
    cstmt.close();
    conn.close();
 }
 catch(SQLException e){
	 if(e.getErrorCode() == 20011){
		 System.out.println( e.getMessage());
		 %>
		 <script>alert("현재 개설된 강의,분반이므로 확인바랍니다.");location.href="insert_professor.jsp";</script><%
	 }
	 else if(e.getErrorCode() == 20012){
		 System.out.println( e.getMessage());
		 %>
		 <script>alert("이미 같은 장소에 개설된 강의가 있습니다.");location.href="insert_professor.jsp";</script><%
	 }
	 else{
		 System.out.println( e.getMessage());
		 %>
		 <script>alert("올바른 형식을 입력해주세요.");location.href="insert_professor.jsp";</script><%
	 }
 }
 catch(Exception e){
	 System.out.println( e.getMessage());
	 %><script>alert("다시 입력해주세요.");location.href="insert_professor.jsp";</script><%
 }
    %>
</body>
</html>