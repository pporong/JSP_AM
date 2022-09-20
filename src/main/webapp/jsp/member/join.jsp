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
		cursor : pointer;
	}
	.join_form {
		border : 2px solid black;
		text-align : center;
		width : 500px;
		height : 300px;
		margin : 0 auto;
		padding : 20px;
	}
	.join_form >.btn_box {
		margin : 20px;
	}
	h1 {
		text-align : center;
	}
</style>

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

			form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
			if (form.loginPwConfirm.value.length == 0) {
				alert('!! 비밀번호 확인을 입력해주세요. !!');
				form.loginPwConfirm.focus();
				return;
			}

			if (form.loginPw.value != form.loginPwConfirm.value) {
				alert('!! 비밀번호가 일치하지 않습니다. !!');
				form.loginPw.focus();
				return;
			}

			form.name.value = form.name.value.trim();
			if (form.name.value.length == 0) {
				alert('!! 이름을 입력해주세요. !!');
				form.name.focus();
				return;
			}

			form.submit();
			JoinForm__submitDone = true;
		}
	</script>

	<form action="doJoin" method="post"
		onsubmit="JoinForm__submit(this); return false;">

		<div class="join_form">
			
			<h1>회원가입</h1>
		
			<div style="margin-bottom : 20px">
				* 이름 : <input autocomplete="off" placeholder="이름을 입력해주세요"
					name="name" type="text" />
			</div>
			<div style="margin-bottom : 20px">
				* 아이디 : <input autocomplete="off" placeholder="아이디를 입력해주세요"
					name="loginId" type="text" />
			</div>
			<div style="margin-bottom : 20px">
				* 비밀번호 : <input autocomplete="off" placeholder="비밀번호" name="loginPw"
					type="password" />
			</div>
			<div style="margin-bottom : 20px">
				* 비밀번호 확인: <input autocomplete="off" placeholder="비밀번호 확인"
					name="loginPwConfirm" type="password" />
			</div>

			<div class = "btn_box">
				<button type="submit">가입 하기</button>

				<button>
					<a href="../home/main">취소 하기</a>
				</button>
			</div>

		</div>

	</form>

</body>
</html>