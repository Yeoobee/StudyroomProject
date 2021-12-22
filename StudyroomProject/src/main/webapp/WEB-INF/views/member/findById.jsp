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
	<div id="divm">
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">ID</label>
  			<input type="text" class="form-control" id="m_id" name="m_id" value="${sessionScope.loginId}" readonly>
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">PASSWORD</label>
  			<input type="text" class="form-control" id="m_password" name="m_password" value="${sessionScope.loginPassword}" readonly>
		</div>	
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">NAME</label>
  			<input type="text" class="form-control" id="m_name" name="m_name" value="${sessionScope.loginName}" readonly>
		</div>

		<button type="button" class="btn btn-dark" onclick="javascript:history.back();">뒤로</button>

	</div>
</body>
</html>