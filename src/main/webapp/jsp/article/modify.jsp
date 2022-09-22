<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Map<String, Object> articleRow = (Map<String, Object>) request.getAttribute("articleRow");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
<style>
	input, button, a {
		font-family: inherit;
		font-size: inherit;
		text-decoration: none;
		color: inherit;
		cursor : pointer;
	}
	.detail_form .title > textarea {
		width: 470px;
		height: 30px;
		padding: 4px;
		box-sizing: border-box;
		border-radius: 5px;
		resize: none;
		margin-top: 2px;
		font-size: 15px;
	}	
	.detail_form .post > textarea {
		width: 470px;
		height: 200px;
		padding: 10px;
		box-sizing: border-box;
		border-radius: 5px;
		resize: none;
		margin-top: 10px;
		font-size: 15px;
	}
	.detail_form {
		border : 2px solid black;
		width : 500px;
		height : 500px;
		padding : 20px;
		margin: 0 auto;
	}
	.detail_form .btn_box {
		position: absolute;
   		left: 50%;
    	top: 50%;
    	transform: translate(-50%, -50%);
	}
	.detail_form >.title {
		width: 450px;
	}
	h2 {
		text-align : center;
	}
	.detail_form .btn_box >button:hover {
		border : 2px solid green;
		font-weight: bold;
	}
</style>
	<div class="detail_form">
		
		<h2 align> <%=(int)articleRow.get("id") %>번 게시물 수정하기 </h2>
		
		<form action="doModify" method="post" >
			<div>
				<input type="hidden" name="id" value="${param.id}" />
			</div>
		
			<div>	
				* 번 호 : <%=(int)articleRow.get("id") %> <br />
				* 날 짜 : <%=(LocalDateTime)articleRow.get("regDate") %> <br />
				<div class="title"> * 제 목 <textarea type="text" name="post" placeholder="제목을 입력 해 주세요." ><%=(String)articleRow.get("title") %></textarea></div>
			<div class="post"> * 내 용 <textarea type="text" name="post" placeholder="내용을 입력 해 주세요." ><%=(String)articleRow.get("body") %></textarea></div>
			</div>

		<div class="btn_box">
			<button type="submit">수정 완료</button>
			<button> <a href="list"> 취소  </a></button>
			</form>
		</div>
	</div>


</body>
</html>