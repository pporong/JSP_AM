<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isLogined = ((boolean)request.getAttribute("isLogined"));
	int loginedMemberId = ((int)request.getAttribute("loginedMemberId"));
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 메인 페이지 </title>
</head>
<body>
<style>
	a {
		color : inherit;
		text-decoration : none;
	}
	a:hover {
		color : green;
		font-weight: bold;
	}
	.main_page {
		width : 500px;
		margin : 0 auto;
		margin-top : 15px;
		text-overflow: ellipsis;
 		overflow : hidden; 
/* 		white-space: nowrap; */
		word-spacing : 5px;
		text-align : center;
	}
</style>

	
<!-- 	<div><a href="/JSP_AM/article/list"> 게시물 리스트 </a></div> -->

	<div class="main_page">
	
		<h1> 메인 페이지 </h1>
		
		<% if(isLogined) { %>
				<%=loginedMemberId %>번 회원
				<button><a href="../member/doLogout"> 로그아웃 </a></button>
				<button><a href="../article/write"> 글쓰기 </a></button>
		<%} %>
		
		<% if(!isLogined) { %>
				<button><a href="http://localhost:8081/JSP_AM/member/login"> 로그인 </a></button>
				<button><a href="http://localhost:8081/JSP_AM/member/join"> 회원가입 </a>
		</button>
		<%} %>
		<button>
			<a href="http://localhost:8081/JSP_AM/article/list"> 게시물 리스트 </a>
		</button>
		
	</div>
	
</body>
</html>