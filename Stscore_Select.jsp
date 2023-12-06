<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

	<style>
		table{
			margin:Auto;
			text-align:center;
		}
		h1{
			text-align:center;
		}
	</style>
<form action="Stscore.html">
<body>
<h1>학생 조회</h1>
<table border="1">
	<tr>
		<td>학번</td>
		<td>이름</td>
		<td>학년</td>
		<td>반</td>
		<td>번호</td>
		<td>성별</td>
	</tr>
	<% /* 자바 DB 연동 프로그램 */
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT S.ID , S.NAME , SUBSTR(S.ID, 1,1), SUBSTR(S.ID, 2,2), SUBSTR(S.ID, 4,2), S.GENDER FROM STINFO_TBL S, SCORE_TBL C WHERE S.ID=C.ID GROUP BY S.ID , S.NAME , SUBSTR(S.ID, 1,1) , SUBSTR(S.ID, 2,2) , SUBSTR(S.ID, 5,2) , S.GENDER  ORDER BY S.ID");
			while(rs.next()){
				%>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %></td>
					</tr>
				<%
			}
			stmt.close();
			con.close();
		
		stmt.close();
		con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
		<tr>
			<td colspan="6"><button>돌아가기</button></td>
		</tr>
</table>
</body>
</form>
</html>