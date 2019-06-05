<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
%>
<ul>
	<li>
	
	<form action ="insert_verify_professor.jsp" method="post">
	<label for="c_name">과목명</label>
	<input type="text" name ="c_name"/>
	</li>
		<br>
	<li>
	<label for="c_unit">분반 예>001 </label>
	<input type="text" name="c_unit"/>
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
	<input type="text" name ="t_location"/>
	
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