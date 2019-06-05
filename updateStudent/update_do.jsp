<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수강신청 사용자 정보 수정</title>
</head>
<body>
<%@ include file="top.jsp" %>
<%	session_id = (String)session.getAttribute("userID"); %>
<%	if (session_id == null) { %>
		<script>
			alert("로그인한 후 사용하세요.");
			location.href="login.jsp";
		</script>
<%	} %>

<%
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "dbp";
	String passwd = "123";
	Class.forName(dbdriver);
	Connection myConn=DriverManager.getConnection(dburl, user, passwd);
	Statement stmt = myConn.createStatement();
	String mySQL = "select s_id, s_pwd, s_major, s_name, s_phone, s_email from students where s_id='" + session_id + "'";
	String s_id = null, s_pwd = null, s_major = null, s_name = null, s_phone = null, s_email = null;
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet.next()) {
		s_id = myResultSet.getString("s_id");
		s_pwd = myResultSet.getString("s_pwd");
		s_major = myResultSet.getString("s_major");
		s_name = myResultSet.getString("s_name");
		s_phone = myResultSet.getString("s_phone");
		s_email = myResultSet.getString("s_email");
	}
%>
<br>
<div align="center">
	<form name="update" action="update_verify.jsp" method ="post">
		<table width="75%" align="center" border>
			<tr><th bgcolor="#FFFF99">학번</th><td align="center"><%= s_id %></td></tr>
			<tr><th bgcolor="#FFFF99">이름</th><td align="center"><%= s_name %></td></tr>
			<tr><th bgcolor="#FFFF99">전공</th><td align="center"><%= s_major %></td></tr>
			<tr><th bgcolor="#FFFF99">휴대폰 번호</th><td align="center"><input name="phone" type="text" value="<%= s_phone %>" /></td></tr>
			<tr><th bgcolor="#FFFF99">이메일 주소</th><td align="center"><input name="email" type="text" value="<%= s_email %>" /></td></tr>
			<tr><th bgcolor="#FFFF99">비밀번호</th><td align="center">새 비밀번호&nbsp;<input name="pwd" type="password" value="<%= s_pwd %>" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 확인&nbsp;<input name="pwd_verify" type="password" value="<%= s_pwd %>" /></td></tr>
		</table>
		<br>
		<input type="submit" value="확인">
		<input type="button" value="취소" onClick="location.href='update.jsp'">
	</form>
</div>
</body>
</html>