<%--
  Created by IntelliJ IDEA.
  User: hyeon
  Date: 2019-05-20
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<% String session_id = (String) session.getAttribute("user");
    String log;
    if (session_id == null)
        log = "<a href=login.jsp>로그인</a>";
    else log = "<a href=logout.jsp>로그아웃</a>"; %>
<table width="75%" align="center" bgcolor="#FFFF99" border>
    <tr>
        <td align="center"><b><%=log%></b></td>
        <td align="center"><b><a href="update.jsp">사용자 정보 수정</a></b></td>
        <td align="center"><b><a href="insert.jsp">수강신청 입력</a></b></td>
        <td align="center"><b><a href="delete.jsp">수강신청 삭제</a></b></td>
        <td align="center"><b><a href="select.jsp">수강신청 조회</a></b></td>
    </tr>
</table>
