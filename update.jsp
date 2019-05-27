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
	String mySQL = "select s_id, s_pwd, s_major from students where s_id='" + session_id + "'";
	String s_id = null, s_pwd = null, s_major = null;
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet.next()) {
		s_id = myResultSet.getString("s_id");
		s_pwd = myResultSet.getString("s_pwd");
		s_major = myResultSet.getString("s_major");
	}
%>

<table width="75%" align="center" border>
<br>
<tr><th bgcolor="#FFFF99">학번</th><td align="center"><%= s_id %></td></tr>
<tr><th bgcolor="#FFFF99">전공</th><td align="center"><%= s_major %></td></tr>
</table>

<table width="75%" align="center" bgcolor="#FFFF99" border>
<br>
<tr> <td><div align="center">패스워드 변경</div></td></table>
<table width="75%" align="center" border>
<form method="post" action="update_verify.jsp">
<tr>
<td><div align="center">기존 패스워드</div></td>
<td><div align="center">
<input type="text" name="oldPassword">
</div></td>
</tr>
<tr>
<td><div align="center">새 패스워드</div></td>
<td><div align="center">
<input type="password" name="newPassword">
</div></td></tr>
<tr>
<td colspan=2><div align="center">
<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="변경">
<INPUT TYPE="RESET" VALUE="취소">
</div></td></tr>
</form>
</table>

</body>
</html>