<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>

	<style>
input, button, a {
	font-family: inherit;
	font-size: inherit;
	text-decoration: none;
	color: inherit;
}
</style>

	<div class="">

	<h1 onclick="alert('안냐세욘'); return false;">회원 가입</h1>

<script>

	var JoinForm__submit = false;
	
	function JoinForm__submit(form) {
		form.userName.value = form.userName.value.trim();
		
		if (form.userName.value.length == 0) {
			alert('!! 이름을 입력 해 주세요. !!');
			form.userName.focus();
			return;
		}
		form.loginId.value = form.loginId.value.trim();
		
		if (form.loginId.value.length == 0) {
			alert('!! 아이디를 입력 해 주세요. !!');
			form.loginId.focus();
			return;
		}
		form.loginPw.value = form.loginPw.value.trim();
		
		if (form.loginPw.value.length == 0) {
			alert('!! 비밀번호를 입력 해 주세요. !!');
			form.loginPw.focus();
			return;
		}
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
		
		if (form.loginPwConfirm.value.length == 0) {
			alert('!! 비밀번호 확인을 입력 해 주세요. !!');
			form.loginPwConfirm.focus();
			return;
		}
		if (form.loginPw.value != form.loginPwConfirm.value;) {
			alert('!! 비밀번호가 일치하지 않습니다 !!');
			form.loginPw.focus();
			return;
		}
		form.submit();
	}
		

	</script>

		<form action="doJoin" method="post"
			onsubmit="JoinForm__submit(this); return false;">
			<p>
				* 이 름 : <input autocomplete="off" type="text" name="userName"
					placeholder="이름을 입력 해 주세요.">
			</p>
			<p>
				* 아이디 : <input autocomplete="off" type="text" name="loginId"
					placeholder="아이디를 입력 해 주세요.">
			</p>
			<p>
				* 비밀번호 : <input autocomplete="off" type="password" name="loginPw"
					placeholder="비밀번호">
			</p>
			<p>
				* 비밀번호 확인 : <input autocomplete="off" type="password"
					name="loginPwConfirm" placeholder="비밀번호 확인">
			</p>

			<button type="submit"">가입 하기</button>
			<button type="button">
				<a href="http://localhost:8081/JSP_AM/home/main"> 취소 하기 </a>
			</button>

		</form>

		<!-- <div> <a href="list"> 리스트로 돌아가기 </a></div> -->

	</div>

</body>
</html>