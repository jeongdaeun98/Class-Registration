<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String session_id = (String) session.getAttribute("userID");
String log;
if (session_id == null)
log = "<a href=login.jsp>로그인</a>";
else log = "<a href=logout.jsp>로그아웃</a>";
%>
<table width="75%" align="center" bgcolor="#FFFF99" border>
<tr>
<td align="center"><b><%=log%></b></td>
<td align="center"><b><a href="update.jsp">사용자 정보 수정</b></td>
<td align="center"><b><a href="insert.jsp">강의 추가 및 삭제</b></td>
<td align="center"><b><a href="delete.jsp">강의 조회</b></td>
<td align="center"><b><a href="view_students.jsp">수강생 조회</b></td>
</tr>
</table>