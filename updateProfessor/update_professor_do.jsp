<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 정보 수정</title>
</head>
<body>
<%@ include file="top_professor.jsp" %>
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
	String mySQL = "select p_id, p_pwd, p_major, p_name, p_phone, p_email from professor where p_id='" + session_id + "'";
	String p_id = null, p_pwd = null, p_major = null, p_name = null, p_phone = null, p_email = null;
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet.next()) {
		p_id = myResultSet.getString("p_id");
		p_pwd = myResultSet.getString("p_pwd");
		p_major = myResultSet.getString("p_major");
		p_name = myResultSet.getString("p_name");
		p_phone = myResultSet.getString("p_phone");
		p_email = myResultSet.getString("p_email");
	}
%>
<br>
<div align="center">
	<form name="update" action="update_professor_verify.jsp" method ="post">
		<table width="75%" align="center" border>
			<tr><th bgcolor="#FFFF99">교번</th><td align="center"><%= p_id %></td></tr>
			<tr><th bgcolor="#FFFF99">이름</th><td align="center"><%= p_name %></td></tr>
			<tr><th bgcolor="#FFFF99">전공</th><td align="center"><%= p_major %></td></tr>
			<tr><th bgcolor="#FFFF99">휴대폰 번호</th><td align="center"><input name="phone" type="text" value="<%= p_phone %>" /></td></tr>
			<tr><th bgcolor="#FFFF99">이메일 주소</th><td align="center"><input name="email" type="text" value="<%= p_email %>" /></td></tr>
			<tr><th bgcolor="#FFFF99">비밀번호</th><td align="center">새 비밀번호&nbsp;<input name="pwd" type="password" value="<%= p_pwd %>" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 확인&nbsp;<input name="pwd_verify" type="password" value="<%= p_pwd %>" /></td></tr>
		</table>
		<br>
		<input type="submit" value="확인">
		<input type="button" value="취소" onClick="location.href='update_professor.jsp'">
	</form>
</div>
</body>
</html>