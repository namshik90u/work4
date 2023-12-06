<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연동</title>
</head>

	<style>
		button{
			border:2px solid black;
			width:60px;
			height:22px;
			border-radius:5px;
			background-Color:Dodgerblue;
			Color:white;
		}
		td{
			padding-right:100px;
		}
		table{
			margin:Auto;
		}
		h1{
			text-align:center;
		}
		div{
			margin:Auto;
		}
	</style>

	<% 
	String ID = request.getParameter("ID");
	%>
<form action="stinfo.html">
<body>
	<% /* 자바 DB 연동 프로그램 */
	if(ID!=null && !ID.isEmpty()){
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select ID,NAME,GENDER from STINFO_TBL WHERE ID='" + ID + "'");
			if(rs.next()){
				%>
				<div style="border:3px solid lightgray; width:400px; height:200px;">
					<h1 style="margin-top:10px;">학번 조회 결과</h1>
						<table>
							<tr>
								<td>학 번 : <%= rs.getString(1) %></td>
							</tr>
							<tr></tr> <tr></tr> <tr></tr> <tr></tr> <tr></tr>
							<tr>
								<td>이 름 : <%= rs.getString(2) %></td>
							</tr>
							<tr></tr> <tr></tr> <tr></tr> <tr></tr> <tr></tr>
							<tr>
								<td>성 별 : <%= rs.getString(3) %>학생</td>
							</tr>
							<tr>
								<th><button>확 인</button></th>
							</tr>
						</table>
					</div>
				<%
			}
			else{
				response.sendRedirect("NoneSelect.jsp");
			}
			stmt.close();
			con.close();
			
		stmt.close();
		con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	else{
		response.sendRedirect("NoneSelect.jsp");
	}
	%>
</body>
</form>
</html>