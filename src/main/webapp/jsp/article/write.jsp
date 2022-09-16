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

String title = request.getParameter("title");
String body = request.getParameter("body");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시물 작성 </title>
</head>
<body>

<h2> 글 작성하기 </h2>

<form action="write" method="get" >
ID : <input type="text" name="title" /><br />
PW : <input type="text" name="body" /><br />
<button type="submit">Login</button>
</form>


<div> <a href="list"> 리스트로 돌아가기 </a></div>

</body>
</html>