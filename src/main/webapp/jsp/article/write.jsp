<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시물 작성 </title>
</head>
<body>
	
	<div class="post_body">
		
		<h2> 글 작성하기 </h2>
		
		<form action="doWrite" method="post" >
			<div></div>
		
			<div>		
				* 제 목 : <input type="text" name="title" placeholder="제목을 입력 해 주세요."/><br />
				* 내 용 : <textarea type="text" name="body" placeholder="내용을 입력 해 주세요." ></textarea>
				<br />
			</div>

		<button type="submit">작성 하기</button>
		
		</form>
		
		
		<div> <a href="list"> 리스트로 돌아가기 </a></div>
	
	</div>

</body>
</html>