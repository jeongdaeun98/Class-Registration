<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title> 수강신청 사용자 정보 수정 </title>
	</head>
	<body>
 <form method="post" action="update.jsp"></form>
 <%
	String newPwd= request.getParameter("newPassword");
	String oldPwd = request.getParameter("oldPassword");
	String userId = (String)session.getAttribute("userId");
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "dbp";
	String passwd = "123";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection connection = DriverManager.getConnection(dburl, user, passwd);
	String UpdatingPwdSQL ="update students set s_pwd = '" + newPwd + "' where s_id = '"+userId+"' and s_pwd = '"+
	oldPwd+"'";
	Statement stmt = connection.createStatement();
	try{
		int num = stmt.executeUpdate(UpdatingPwdSQL);
		if(num == 1){
			%>
			<script>confirm("패스워드가 변경되었습니다.");location.href="update.jsp";</script><%
		}
		else{
			%>
			<script>alert("기존의 패스워드가 아닙니다.");location.href="update.jsp";</script><%
		}
		
		stmt.close();
		connection.close();
}
	catch(SQLException ex) {
 		String sMessage;
 		if (ex.getErrorCode() == 20002){ 
			%>
			<script>alert("암호는 4자리 이상이어야 합니다.");location.href="update.jsp";</script><%
			}
 		else if (ex.getErrorCode() == 20003){ 
			%>
			<script>alert("암호에 공란은 입력되지 않습니다.");location.href="update.jsp";</script><%
			}
		else{
			%>
			<script>alert("다시 시도해보세요.");location.href="update.jsp";</script>
			<%
			}
	}
 %>

 </body></html>