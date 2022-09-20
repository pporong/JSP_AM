<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 </title>
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

	<h1> 로그인 </h1>

	<script>
		var JoinForm__submitDone = false;

		function JoinForm__submit(form) {
			if (JoinForm__submitDone) {
				alert('처리중 입니다.');
				return;
			}

			form.loginId.value = form.loginId.value.trim();
			if (form.loginId.value.length == 0) {
				alert('!! 아이디를 입력해주세요. !!');
				form.loginId.focus();
				return;
			}

			form.loginPw.value = form.loginPw.value.trim();
			if (form.loginPw.value.length == 0) {
				alert('!! 비밀번호를 입력해주세요. !!');
				form.loginPw.focus();
				return;
			}

			if (form.loginPw.value != form.loginPwConfirm.value) {
				alert('!! 비밀번호가 일치하지 않습니다. !!');
				form.loginPw.focus();
				return;
			}

			form.submit();
			JoinForm__submitDone = true;
		}
	</script>

	<form action="doLogin" method="post"
		onsubmit="JoinForm__submit(this); return false;">
		<div>
			* 로그인 아이디 : <input autocomplete="off" placeholder="아이디를 입력해주세요"
				name="loginId" type="text" />
		</div>
		<div>
			* 로그인 비밀번호 : <input autocomplete="off" placeholder="비밀번호"
				name="loginPw" type="password" />
		</div>

		<div>
			<button type="submit"> 로그인 </button>

			<button>
				<a href="../home/main">돌아가기</a>
			</button>
		</div>

	</form>

</body>
</html>