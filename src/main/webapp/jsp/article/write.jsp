<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시물 작성 </title>
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
	.write_form .title > textarea {
		width: 470px;
		height: 30px;
		padding: 4px;
		box-sizing: border-box;
		border-radius: 5px;
		resize: none;
		margin-top: 10px;
		font-size: 15px;
	}	
	.write_form .post > textarea {
		width: 470px;
		height: 200px;
		padding: 10px;
		box-sizing: border-box;
		border-radius: 5px;
		resize: none;
		margin-top: 10px;
		font-size: 15px;
	}
	.write_form {
		border : 2px solid black;
		width : 500px;
		height : 500px;
		padding : 20px;
		margin: 0 auto;
	}
	.write_form .btn_box {
		position: absolute;
   		left: 50%;
    	top: 50%;
    	transform: translate(-50%, -50%);
	}
	.write_form >.title {
		width: 450px;
	}
	h2 {
		text-align : center;
	}
	.write_form .btn_box >button:hover {
		border : 2px solid green;
		font-weight: bold;
	}
</style>
	
	<div class="write_form">
		
		<h2 align> 글 작성하기 </h2>
		
		<form action="doWrite" method="post" >
			
		
			<div class="title" style="margin-bottom : 15px;"> * 제 목 <textarea type="text" name="title" placeholder="제목을 입력 해 주세요." ></textarea> </div>
			<div class="post" style="margin-bottom : 15px;"> * 내 용 <textarea type="text" name="body" placeholder="내용을 입력 해 주세요." ></textarea> </div>
	
		</form>
				
		<div class="btn_box">
			<button type="submit">작성 하기</button>
			<button> <a href="list"> 리스트로 돌아가기 </a></button>
		</div>	
		
	</div>

</body>
</html>