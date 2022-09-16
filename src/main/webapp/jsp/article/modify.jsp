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
	
	<div class="post_body">
		
		<h2 align> <%=(int)articleRow.get("id") %>번 게시물 수정하기 </h2>
		
		<form action="doModify" method="post" >
			<div>
				<input type="hidden" name="id" value="${param.id}" />
			</div>
		
			<div>	
				* 번 호 : <%=(int)articleRow.get("id") %> <br />
				* 날 짜 : <%=(LocalDateTime)articleRow.get("regDate") %> <br />
				* 제 목 : <input type="text" name="title" placeholder="제목을 입력 해 주세요."value=" <%=(String) articleRow.get("title")%>"><br />
				* 내 용 : <textarea type="text" name="body" placeholder="내용을 입력 해 주세요." ><%=(String)articleRow.get("body") %></textarea>
				<br />
			</div>

		<button type="submit">수정 완료</button>
		
		</form>
		
		<div> <a href="list"> 리스트로 돌아가기 </a></div>
		<div> <a href="detail"> 본문으로 돌아가기 </a></div>
	
	</div>


</body>
</html>