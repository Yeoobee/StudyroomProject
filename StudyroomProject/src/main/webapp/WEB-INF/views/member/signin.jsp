<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	#divm{
		width: 500px;
		height: 500px;
		border: 1px solid gray;
		border-radius: 10px;
		padding : 10px;
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
	}
</style>

</head>
<body>

		<form action = "signin" method="post">
	<div id="divm">
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">ID를 입력하시오</label>
  			<input type="text" class="form-control" id="m_id" name="m_id">
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">비밀번호를 입력하시오</label>
  			<input type="password" class="form-control" id="m_password" name="m_password">
		</div>	

		<button type="submit" class="btn btn-outline-dark">로그인</button>
		<button type="button" class="btn btn-dark" onclick="location.href='signup'">회원가입</button>

	</div>

</form>
</body>
</html>