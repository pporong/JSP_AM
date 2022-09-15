<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDateTime" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<Map<String, Object>> articleRows = (List<Map<String, Object>>)request.getAttribute("articleRows");
int cPage = (int)request.getAttribute("page");
int totalPage = (int)request.getAttribute("totalPage");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시물 리스트 </title>
</head>
<body>
	
	<div> <a href="../home/main"> 메인 페이지 바로가기 </a></div>
	
	<h1 align="center"> 게시물 리스트 </h1>
	
	<table border="1" bordercolor="pink" align="center">
	<colgroup>
		<col width="50"/>
		<col width="200"/>
	</colgroup>
	<tr class="title" bgcolor = "orange">
		<th>번 호</th>
		<th>날 짜</th>
		<th>제 목</th>
		<th>삭 제</th>
	</tr>
	
		<% for(Map<String, Object> articleRow : articleRows){ %>
		<tr>
			<td align="center"><%=articleRow.get("id") %>번</td>
			<td align="center"><%=articleRow.get("regDate") %></td>
			<td align=""><a href="detail?id=<%=articleRow.get("id") %>"><%=articleRow.get("title") %></a></td>
			
			<td align="center"><a href="doDelete?id=<%=articleRow.get("id") %>"> 삭제 </a></td>
		</tr>
		<%} %>
	
	</table>	

	<!-- paging -->
	<style type="text/css">
		.page > a.red {
			color: red;
		}
		.page {
			text-align : center;
			margin-top : 15px;
		}
	</style>
	
	<div class="page">
	<%for (int i = 1; i <= totalPage; i++) { %>
		<a class="<%=cPage == i ? "red" : "" %>" href="list?page=<%=i %>"><%=i %></a>
	<%} %>
	</div>



</body>
</html>