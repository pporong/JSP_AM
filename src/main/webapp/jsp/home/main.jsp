<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 메인 페이지 </title>
</head>
<body>
	<style type="text/css">

		.mainP {
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

	
<!-- 	<div><a href="/JSP_AM/article/list"> 게시물 리스트 </a></div> -->

	<div class="mainP">
	
		<h1> 메인 페이지 </h1>
		
		<button>
			<a href="http://localhost:8081/JSP_AM/member/join"> 회원가입 </a>
		</button>
		<button>
			<a href="http://localhost:8081/JSP_AM/member/login"> 로그인 </a>
		</button>	
		<button>
			<a href="http://localhost:8081/JSP_AM/article/list"> 게시물 리스트 </a>
		</button>
		
	</div>
	
</body>
</html>