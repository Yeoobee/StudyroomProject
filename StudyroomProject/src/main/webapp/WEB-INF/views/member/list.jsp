<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<body>	
<table class="table">
<thead class="table-light">
	<tr>
	<th>회원 번호</th>
	<th>회원 아이디</th>
	<th>회원 비밀번호</th>
	<th>회원 이름</th>
	<th>회원 삭제</th>
	</tr>
	</thead> 
	<tbody>
	<c:forEach items="${mList}" var="mList">
			<tr>
				<th scope="row">${mList.m_number}</th>
				<td>${mList.m_id}</td>
				<td>${mList.m_password}</td>
				<td>${mList.m_name}</td>
				<c:if test="${mList.m_id != 'admin'}">
				<td><a href="/member/delete?m_number=${mList.m_number}">삭제</a></td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>