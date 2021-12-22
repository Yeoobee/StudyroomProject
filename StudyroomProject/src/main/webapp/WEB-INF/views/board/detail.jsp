<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
	
	<table class="table">
	<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>글내용</th>
	<th>조회수</th>
	<th>작성시간</th>
	<th>사진</th>
	<th>수정</th>
	<th>삭제</th>

	</tr>
	<tr>
				<td>${board.b_number}</td>
				<td>${board.b_title}</td>
				<td>${board.m_id}</td>
				<td>${board.b_contents}</td>
				<td>${board.b_hits}</td>
				<td>${board.b_date}</td>
				
	<td><img alt="" src="/resources/upload/${board.b_filename}" style="width:500px;"></td>
	
	<td><c:if test="${sessionScope.loginId eq board.m_id}">
	<a href="/board/update?b_number=${board.b_number}">수정</a>
	</c:if>
	</td>
	<td><c:if test="${sessionScope.loginId eq board.m_id or sessionScope.loginId eq 'admin' }">
	<a href="/board/delete?b_number=${board.b_number}">삭제</a>
	</c:if>
	</td>
	
	
	
	</tr>
	</table>
</body>
</html>