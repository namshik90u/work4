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
				<div style="border:3px solid lightgray; width:400px; height:200px;">
					<h1 style="margin-top:10px;">학번 조회 결과</h1>
						<table>
							<tr>
								<td>학 번 : <%= ID %></td>
							</tr>
							<tr></tr> <tr></tr> <tr></tr> <tr></tr> <tr></tr>
							<tr>
								<td>이 름 : 등록된 학생이 없습니다!!</td>
							</tr>
							<tr></tr> <tr></tr> <tr></tr> <tr></tr> <tr></tr>
							<tr>
								
							</tr>
							<tr>
								<th><button>확 인</button></th>
							</tr>
						</table>
					</div>
</body>
</form>
</html>