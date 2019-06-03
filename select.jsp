<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<style>
	table.timetable {
		border-collapse: collapse;
    	text-align: center;
    	algin:center;
    	line-height: 1.5;
    	border: 1px solid #333333;
    	margin: 20px 10px;
	}
	table.timetable thead {
		border-right: 1px solid #333333;
    	border-left: 1px solid #333333;
    	background: #e7708d;
	}
	table.timetable thead th {
		padding: 10px;
    	font-weight: bold;
    	vertical-align: top;
    	color: #fff;
	}
	table.timetable tbody th{
		width: 150px;
    	padding: 10px;
    	font-weight: bold;
    	vertical-align: top;
    	border-bottom: 1px solid #ccc;
    	background: #fcf1f4;
	}
	table.timetable td {
    	width: 350px;
    	height: 50px;
    	padding: 10px;
    	vertical-align: top;
    	border-bottom: 1px solid #ccc;
	}
</style>
</head>
<body>
<%@ include file="top.jsp" %>
<%
	String s_id = (String)session.getAttribute("userID");
%>
<%
	Connection myConn = null;
	CallableStatement cstmt=null;
	String mySQL=null;
	Connection myConn2 = null;
	CallableStatement cstmt2=null;
	String user = "dbp";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl ="jdbc:oracle:thin:@localhost:1521:orcl";
	String passwd = "123";
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	try{
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection(dburl, user, passwd);
		myConn2 = DriverManager.getConnection(dburl, user, passwd);
		
	}catch(SQLException ex){
		System.err.println("SQLException:" +ex.getMessage());
	}
%>
<%
	String getYear = "select to_number(TO_CHAR(sysdate,'YYYY')) as year from dual";
	String getMonth = "select to_number(to_char(sysdate,'mm')) as month from dual";
	Statement stmt = myConn.createStatement();
	rs = stmt.executeQuery(getYear);
	int year=0;
	int month=0;
	if(rs!=null){
		while(rs.next()){
			year = rs.getInt("year");
		}
	}
	rs = stmt.executeQuery(getMonth);
	if(rs!=null){
		while(rs.next()){
			month = rs.getInt("month");
		}
	}
	
	int semester=0;
	if(month>=5 && month<=10){
		semester=2;
	}
	else{
		semester=1;
	}
%>
<script type="text/javascript">
	var id = "<%=s_id%>";
	var year = "<%=year%>";
 	var semester = "<%=semester%>";
</script>
<h2 align="center">
<script>
	document.write(id+"님의 "+year+"년도 "+semester+"학기 시간표입니다.");
</script>
</h2>
<%
	int time=0;
	String[][] Arr = new String[9][6];
	Statement stmt2 = myConn2.createStatement();
	for(int i=1;i<10;i++){
		time = i;
		String getTimetable = "select c.c_name as name, t.t_day1 as day, t.t_location as location from course c, enroll e, teach t where e.s_id= '" +s_id+ "' and e.c_id=c.c_id and e.c_id = t.c_id and e.c_unit = t.c_unit and e.c_unit = c.c_unit and t.t_year="+year+" and t.t_semester="+semester+" and t.t_time1=" +time+ " UNION select c.c_name as name, t.t_day2, t.t_location from course c, enroll e, teach t where e.s_id='"+s_id+"' and e.c_id=c.c_id and e.c_id = t.c_id and e.c_unit = t.c_unit and e.c_unit = c.c_unit and t.t_year="+year+" and t.t_semester="+semester+ " and t.t_time2=" +time+ " order by day";
		rs2 = stmt2.executeQuery(getTimetable);
		if(rs2!=null){
			while(rs2.next()){
				Arr[time-1][rs2.getInt("day")-1]=rs2.getString("name")+" ("+rs2.getString("location")+")";
			}
		}
	}
	
	int[][] span = new int[9][6];
	for(int i=0;i<9;i++){
		for(int j=0;j<6;j++){
			span[i][j]=1;
		}
	}
	for(int i=0;i<6;i++){
		for(int j=1;j<9;j++){
			if(Arr[j][i]!= null && Arr[j][i].equals(Arr[j-1][i])){
				span[j][i] = span[j-1][i]+1;
			}
		}
	}

	for(int i=0;i<9;i++){
		for(int j=0;j<6;j++){
			if(span[i][j]>1){
				int range = span[i][j];
				span[i-range+1][j] = range;
				for(int k=i-range+2;k<=i;k++){
					Arr[k][j]=null;
					span[k][j]=-1;
				}
			}
		}
	}
	
%>
<table width="75%"; class="timetable"; align="center"; border= "1px solid #333333";>
<thead>
    <tr>
    	<th scope="cols"></th>
        <th scope="cols">월</th>
        <th scope="cols">화</th>
        <th scope="cols">수</th>
        <th scope="cols">목</th>
        <th scope="cols">금</th>
        <th scope="cols">토</th>
    </tr>
</thead>
<tbody>
  <%
  	for(int i=0;i<9;i++){
  		out.println("<tr>");
  		out.println("<th scope=\"cols\">"+(i+1)+"교시</th>");
  		for(int j=0;j<6;j++){
  			if(span[i][j]!=-1){
  				if(Arr[i][j]!=null){
  					//bgcolor수정
  					out.println("<td rowspan=\""+span[i][j]+"\" bgcolor = \"#FFFFFF\">"+Arr[i][j]+"</td>");
  				}
  				else
  					out.println("<td></td>");
  			}
  		}
  	}
  %>
</tbody>
</table>
</body>
</html>