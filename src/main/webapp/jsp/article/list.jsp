<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.KoreaIT.java.am.dto.Article" %>
<%@ page import="java.time.LocalDateTime" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<Article> articles = (List<Article>) request.getAttribute("articles");
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
<style>
	h1 {
	text-align: center;
	color : navy;
	}
</style>

	<h1> 게시물 리스트 </h1>
	
	<!-- topBar 적용 -->
	<%@ include file="../part/topBar.jspf" %>
	
	<table border="1" bordercolor="pink" align="center">
	<colgroup>
		<col width="50"/>
		<col width="200"/>
	</colgroup>
	<tr class="title" bgcolor = "orange">
		<th>번 호</th>
		<th>제 목</th>
		<th>작성자</th>
		<th>날 짜</th>
		<th>수 정</th>
		<th>삭 제</th>
		
	</tr>
	
		<%for (Article article : articles){ %>
		<tr>
			<td align="center"><%=article.id %>번</td>
			<td align="center"><a href="detail?id=<%=article.id %>"><%=article.title %></a></td>	
			<td align="center"><%=article.extra__writer %></td>
			<td align="center"><%=article.regDate %></td>		
			
			<td align="center"><a href="modify?id=<%=article.id %>"> 수정 </a></td>	
			<td align="center"><a href="doDelete?id=<%=article.id %>"> 삭제 </a></td>

			
		</tr>
		<%} %>
	
	</table>	

	<!-- paging -->
	<style type="text/css">
		.page >a {
			text-decoration : none;
			color : inherit;
		}
		.page > a.red {
			color: red;
			font-weight : bold;
			text-decoration : underline;
		}
		.page {
			width : 500px;
			margin : 0 auto;
			margin-top : 15px;
			text-overflow: ellipsis;
 			overflow : hidden; 
/* 			white-space: nowrap; */
			word-spacing : 5px;
			text-align : center;
		}
	</style>
	
	<div class="page">
	<% if(cPage >= 1) {%>
	<a href="list?page=1">◀◀</a>
	<%
	}
	%>
	<%
	int pageSize = 5;
	int from = cPage - pageSize;
	if (from < 1) {
		from = 1;
	}
	int end = cPage + pageSize;
	if (end > totalPage){
		end = totalPage;
	}
	
	for (int i = from; i <= end; i++) { %>
	<a class="<%=cPage == i ? "red" : "" %>" href="list?page=<%=i %>"><%=i %></a>
	<%} %>
	<% if(cPage <= totalPage) {%>
	<a href="list?page=<%=totalPage%>">▶▶</a>
	<%
	} %>
	</div>



</body>
</html>