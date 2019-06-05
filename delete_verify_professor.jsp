<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<body>
<%@ include file="insert_and_delete_professor.jsp" %>
	<% String c_id = request.getParameter("c_id");
		String c_unit = request.getParameter("c_unit");
	    try {
	    	conn = DriverManager.getConnection(url, user, pw);
			Statement statement = conn.createStatement();
    		String deleteCourse = "delete from course where c_id = '"+ c_id + "' and c_unit = '" + c_unit + "'";
    		int deleteResultNum = statement.executeUpdate(deleteCourse);
    		if(deleteResultNum > 0){%><script>confirm("삭제되었습니다.");location.href="insert_and_delete_professor.jsp";</script>
    		<% }
    		}
    		catch(SQLException e){
    			System.out.println(e.getMessage());
    		}
    		%>
</body>
</html>