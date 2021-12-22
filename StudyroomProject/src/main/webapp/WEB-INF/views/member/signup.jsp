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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		function idDuplicate(){
			const id = document.getElementById('m_id').value;
			const checkResult = document.getElementById('id-dup-check');
			$.ajax({
				type: 'post',
				url: 'idDuplicate', 
				data: {'m_id': id}, 
				dataType: 'text', 
				success: function(result){ 
					console.log('ajax 성공');
					console.log(result);
					if(result=="ok"){
						checkResult.style.color = 'green';
						checkResult.innerHTML = '멋진 아이디네요!';
					} else {
						checkResult.style.color = 'red';
						checkResult.innerHTML = '이미 사용중인 아이디입니다!';
					}
				},
				error: function(){ 
					console.log('실패')
				}
				
			});
		}
		
		function idcheck(){
			const checkResult = document.getElementById('id-dup-check');
			if(checkResult.innerHTML == '이미 사용중인 아이디입니다!'){
				alert('아이디를 확인해주세요.');
				history.back();
			}else{
				alert('회원가입 되었습니다.');
			}
		}
	</script>
</head>
<body>
<form action = "signup" method="post">
	<div id="divm">
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">ID</label>
  			<input type="text" class="form-control" id="m_id" name="m_id" onblur="idDuplicate()">
  			<span id="id-dup-check"></span><br>
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">PASSWORD</label>
  			<input type="password" class="form-control" id="m_password" name="m_password">
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">NAME</label>
  			<input type="text" class="form-control" id="m_name" name="m_name">
		</div>


		<button type="submit" class="btn btn-outline-dark" onclick="idcheck()">회원가입</button>
		<button type="button" class="btn btn-dark" onclick="javascript:history.back();">취소</button>

	</div>
</form>
</body>
</html>