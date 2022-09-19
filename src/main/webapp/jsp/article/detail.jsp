<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDateTime" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Map<String, Object> articleRow = (Map<String, Object>)request.getAttribute("articleRow");
%>  
    
<%
String articleId = request.getParameter("id");
if (articleId == null) {
	articleId = "0";
}

int id = Integer.parseInt(articleId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시물 상세보기 </title>
</head>
<body>
	<style type="text/css">
		.detailP {
			width : 500px;
			margin : 0 auto;
			margin-top : 15px;
			text-overflow: ellipsis;
 			overflow : hidden; 
			/* white-space: nowrap; */
			word-spacing : 5px;
			/* text-align : center; */
			border : 2px solid black;
			padding: 4px 10px 10px 33px;
		}
		.detailP >.detailHeadText {
			text-align : center;
			color : blue;
		}
		.detailP >.detailBtn {
			text-align : right;
		}
		.detailBtn a {
			text-decoration : none;
		}
		
	</style>
	
<!-- <div> <a href="/JSP_AM/article/list" target="_blank"> 게시물 리스트 바로가기 </a></div> -->
<!-- <div> <a href="detail" target="_blank"> 상세보기 바로가기 </a> </div> -->

<div class="detailP">

	<h2 class="detailHeadText"> <%=id %>번 글 상세보기 </h2>
	
	<div>* 번 호 : <%=(int)articleRow.get("id") %></div>
	<div>* 날 짜 : <%=(LocalDateTime)articleRow.get("regDate") %></div>
	<div>* 제 목 : <%=(String)articleRow.get("title") %></div>
	<div>* 내 용 : <%=(String)articleRow.get("body") %></div>
	<br />
	<br />
	<div class="detailBtn">
		<button><a href="doDelete?id=<%=articleRow.get("id") %>"> 삭제 </a></button>
		
		<button><a href="doUpdate?id=<%=articleRow.get("id") %>"> 수정 </a></button>
		<div> <a href="list"> 리스트로 돌아가기 </a></div>
</div>

</div>



</body>
</html>