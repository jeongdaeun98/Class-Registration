<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>강의 추가</title>
<style>
ul{
	list-style:none;
}
label{
	width:100px;
	display:inline-block;
}
</style>

<script type="text/javascript">
function refresh(id){
	window.opener.location.reload();
	window.close();
}

</script>
</head>
<body>
<%
String session_id = (String)session.getAttribute("userID");
	if (session_id == null) { %>
	<script>
		alert("로그인한 후 사용하세요.");
		location.href="login.jsp";
	</script>
<%	}
	session.setMaxInactiveInterval(20*60);
    
    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String user = "dbp";
    String pw = "123";
    String driver = "oracle.jdbc.driver.OracleDriver";
    String id = "0";
    try {
        Class.forName(driver);
        Connection conn = DriverManager.getConnection(url, user, pw);
		Statement stmt = conn.createStatement();	
		String query ="select c_id from course";
		ResultSet rs = stmt.executeQuery(query);
		id = Double.toString(21000000 + Math.floor(Math.random() * 9999) + 1);

		while(rs.next()){
			String queryId = rs.getString("c_id");
			while(queryId == id) id = Double.toString(21000000 + Math.floor(Math.random() * 9999) + 1);
		}
		stmt.close();
		conn.close();
    }
    catch(SQLException e){
    	System.err.println("SQLException : " + e.getMessage());
    }
				
%>
<ul>
	<li>
	
	<form action ="insert_verify_professor.jsp" method="post">
	<label for="c_name">과목명</label>
	<input type="text" id ="c_name"/>
	</li>
		<br>
	<li>
	<label for="c_unit">분반 예>001 </label>
	<input type="text" id="c_unit"/>
	</li>
		<br>
	<li>
	<label for="c_type">교과구분</label>
	<select name="c_type">
	<option value="0">교양</option>
	<option value="1">전공</option>
	</select>
	</li>
		<br>
	<% for(int i = 1; i <= 2; i++){
	String date = "t_day" + Integer.toString(i);
	String time = "t_time" + Integer.toString(i);
	%>
	<li>
	<label for=<%=date %>>강의 요일(<%=i %>)</label>
	<select name=<%=date %>>
	<option value="" selected="selected">요일 선택</option>
	<option value="1">월</option>
	<option value="2">화</option>
	<option value="3">수</option>
	<option value="4">목</option>
	<option value="5">금</option>
	<option value="6">토</option>
	<option value="0">일</option>
	</select>
	</li>
		<br>
	<li>
	<label for = <%=time %>>강의 시간(<%=i %>)</label>
	<select name=<%=time %>>
	<option value="" selected="selected">시간 선택</option>
	<option value="1">1교시</option>
	<option value="2">2교시</option>
	<option value="3">3교시</option>
	<option value="4">4교시</option>
	<option value="5">5교시</option>
	<option value="6">6교시</option>
	<option value="7">7교시</option>
	<option value="8">8교시</option>
	<option value="9">9교시</option>
	</select>
	</li>
		<br>
	<%} %>
	<li>
	<lable for="t_location">강의 장소</lable>
	<input type="text" id ="t_location"/>
	
	</li>
	<br>
	<li>
	<label for = "c_credit">학점</label>
	<select name="c_credit">
	<option value= "" selected = "selected">학점 선택</option>
	<option value="1">1학점</option>
	<option value="2">2학점</option>
	<option value="3">3학점</option>
	</select>
	</li>
	<br>
	<li>
	<label for= "t_personnel">정원</label>
	<select name="t_personnel">
	<option value= "" selected = "selected">정원 선택</option>
	<option value="1">1명</option>
	<option value="2">2명</option>
	<option value="3">3명</option>
	</select>
	</li>
	<table width="75%" align="center" border="0">
	<tr><td align="center">
	<input type="submit" name="submit" value="신청"/>
	<input type="reset" value="취소"/>
	</td></tr></table>
	</form>
	</ul>

</body>
</html>