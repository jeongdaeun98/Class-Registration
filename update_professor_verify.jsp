<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title> 수강신청 사용자 정보 수정 </title>
	</head>
	<body>
	<form method="post" action="update.jsp"></form>
<%
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String pwd= request.getParameter("pwd");
	String pwd_verify = request.getParameter("pwd_verify");
	String userId = (String)session.getAttribute("userID");
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "dbp";
	String passwd = "123";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection connection = DriverManager.getConnection(dburl, user, passwd);
	Statement stmt = connection.createStatement();
	String getOldInfo = "select p_pwd, p_phone, p_email from professor where p_id='" + userId + "'";
	ResultSet rs = stmt.executeQuery(getOldInfo);
	String old_pwd = "", old_phone = "", old_email = "";
	if (rs.next()) {
		old_pwd = rs.getString("p_pwd");
		old_phone = rs.getString("p_phone");
		old_email = rs.getString("p_email");
	}
	stmt.close();
	rs.close();
	String next_location = null, sMessage = null;
	if (!pwd.equals(pwd_verify)) {
		next_location = "update_professor_do.jsp";
		sMessage = "비밀번호 확인이 일치하지 않습니다.";
		%>
		<script>
			show_alert();
			function show_alert() {
				var sMessage = "<%=sMessage%>";
				if (sMessage == "정보 수정 성공!")
					alert(sMessage);
				else
					alert("정보 수정 실패! 다시 시도해보세요.\n(에러 내용: " + sMessage + ")");
				location.href = "<%=next_location%>";
			}
		</script>
<%
	}
	try {
		connection.setAutoCommit(false);
		if (!pwd.equals(old_pwd)) {
			stmt = connection.createStatement();
			String updatePwd = "update professor set p_pwd='" + pwd +"' where p_id='" + userId + "'";
			stmt.executeUpdate(updatePwd);
			stmt.close();
		}
		if (!phone.equals(old_phone)) {
			stmt = connection.createStatement();
			String updatePhone = "update professor set p_phone='" + phone +"' where p_id='" + userId + "'";
			stmt.executeUpdate(updatePhone);
			stmt.close();
		}
		if (!email.equals(old_email)) {
			stmt = connection.createStatement();
			String updateEmail = "update professor set p_email='" + email +"' where p_id='" + userId + "'";
			stmt.executeUpdate(updateEmail);
			stmt.close();
		}
		connection.commit();
		next_location = "update_professor.jsp";
		sMessage = "정보 수정 성공!";
	} catch(SQLException ex) {
 		if (ex.getErrorCode() == 20002){ 
 			sMessage = "암호는 4자리 이상이어야 합니다.";
		}
 		else if (ex.getErrorCode() == 20003){
 			sMessage = "암호에 공란은 입력되지 않습니다.";
		}
		else if (ex.getErrorCode() == 20004){
			sMessage = "부적절한 전화번호 형식입니다.";
		}
		else if (ex.getErrorCode() == 20005){
			sMessage = "부적절한 이메일 주소 형식입니다.";
		}
		else if (ex.getErrorCode() == 1){
			sMessage = "중복되는 이메일 주소 또는 전화번호가 이미 존재합니다.";
		}
		else {
			sMessage = "기타 오류";
		}
 		connection.rollback();
 		next_location = "update_professor_do.jsp";
	} finally {
		if (stmt != null)
			stmt.close();
		if (connection != null)
			connection.close();
		if (sMessage != null && next_location != null) {
%>
				<script>
					show_alert();
					function show_alert() {
						var sMessage = "<%=sMessage%>";
						if (sMessage == "정보 수정 성공!")
							alert(sMessage);
						else
							alert("정보 수정 실패! 다시 시도해보세요.\n(에러 내용: " + sMessage + ")");
						location.href = "<%=next_location%>";
					}
				</script>
<%
		}
	}
%>
 </body>
</html>