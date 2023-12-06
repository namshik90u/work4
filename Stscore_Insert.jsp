<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연동</title>
</head>
<body>

	<% /* 자바 DB 연동 프로그램 */
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			PreparedStatement stmt = con.prepareStatement("INSERT INTO SCORE_TBL VALUES(?,?,?,?,?)");
				stmt.setString(1, request.getParameter("ID"));
				stmt.setString(2, request.getParameter("KOREAN"));
				stmt.setString(3, request.getParameter("MATH"));
				stmt.setString(4, request.getParameter("ENGLISH"));
				stmt.setString(5, request.getParameter("HISTORY"));
		stmt.execute();
		stmt.close();
		con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
<a href="Stscore.html">돌아가기</a>
</body>
</html>