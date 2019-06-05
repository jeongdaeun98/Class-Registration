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

<table width="75%" align="center" border>
<br>
<tr><th bgcolor="#FFFF99">학번</th><td align="center"><%= s_id %></td></tr>
<tr><th bgcolor="#FFFF99">이름</th><td align="center"><%= s_name %></td></tr>
<tr><th bgcolor="#FFFF99">전공</th><td align="center"><%= s_major %></td></tr>
<tr><th bgcolor="#FFFF99">휴대폰 번호</th><td align="center"><%= s_phone %></td></tr>
<tr><th bgcolor="#FFFF99">이메일 주소</th><td align="center"><%= s_email %></td></tr>
</table>
<br>
<div align="center"><button onclick="update_do()">수정</button></div>
	<script>
		function update_do() {
			var response = prompt("정보를 변경하기 위해서는 비밀번호를 한 번 더 입력하여야 합니다", "비밀번호");
			var s_pwd = "<%=s_pwd%>";
			if (response == s_pwd) {
				location.href = "update_do.jsp";
			}
			else {
				alert("비밀번호가 틀렸습니다.");	
			}
		}
	</script>
</body>
</html>