<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<html><head><title>수강신청 입력</title></head>
<body>
<%
	String s_id = (String)session.getAttribute("userID");
	String c_id = request.getParameter("c_id");
	int c_id_no = Integer.parseInt(request.getParameter("c_unit"));
%>
<%
	Connection myConn = null;
	CallableStatement cstmt=null;
	String result = null;
	String user = "dbp";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl ="jdbc:oracle:thin:@localhost:1521:orcl";
	String passwd = "123";
	ResultSet rs = null;
	
	try{
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection(dburl, user, passwd);
		
	}catch(SQLException ex){
		System.err.println("SQLException:" +ex.getMessage());
	}
	cstmt = myConn.prepareCall("{call InsertEnroll(?,?,?,?)}");
	cstmt.setString(1,s_id);
	cstmt.setString(2,c_id);
	cstmt.setInt(3,c_id_no);
	cstmt.registerOutParameter(4, Types.VARCHAR);
	cstmt.execute();
	String ans = cstmt.getString(4);
	//System.out.println(ans);
%>
<script type = "text/javascript"> 
	var ans = "<%=ans%>";
	alert(ans);
location.href="insert.jsp" 
</script>
<%
cstmt.close();
%>
</body>
</html>