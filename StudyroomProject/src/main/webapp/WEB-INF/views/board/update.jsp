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
<form action="update" method="post" enctype="multipart/form-data">
	<div id="divm">
		<input type="hidden" name="page" value="${page}">
		<input type="hidden" name="b_number" value="${board.b_number}">
	<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">작성자</label>
  			<input class="form-control" name="m_id" value="${sessionScope.loginId}" readonly>
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">제목</label>
  			<input type="text" class="form-control" name="b_title">
  			<span id="id-dup-check"></span><br>
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">내용</label>
  			<textarea class="form-control" name="b_contents" rows="3"></textarea>
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">사진첨부</label>
  			<input class="form-control" type="file" name="b_file">
		</div>

		<button type="submit" class="btn btn-outline-dark">수정하기</button>
		<button type="button" class="btn btn-dark" onclick="javascript:history.back();">취소</button>

	</div>
</form>
</body>
</html>