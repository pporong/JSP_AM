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
			color : purple;
		}
		.detailP >.detailBtn {
			text-align : right;
		}
		.detailBtn a {
			text-decoration : none;
		}
		h1 {
			text-align: center;
			color : navy;
		}

</style>


<%@ include file="../part/topBar.jspf" %>


<div class="detailP">

	<h3 class="detailHeadText"> <%=id %>번 글 상세보기 </h3>
	
	<div>* 번 호 : <%=(int)articleRow.get("id") %></div>
	<div>* 날 짜 : <%=(LocalDateTime)articleRow.get("regDate") %></div>
	<div>* 제 목 : <%=(String)articleRow.get("title") %></div>
	<div>* 내 용 : <%=(String)articleRow.get("body") %></div>
	<div>* 작성자 : <%=(String)articleRow.get("writer") %></div>
	
	<br />
	<br />
	
	<div class="detailBtn">
		<button><a href="list"> 뒤로가기 </a></button>
		<button><a href="doDelete?id=<%=articleRow.get("id") %>"> 삭제 </a></button>
		<button><a href="modify?id=<%=articleRow.get("id") %>"> 수정 </a></button>
	</div>

</div>



</body>
</html>