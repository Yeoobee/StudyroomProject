<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div style="display:flex">

<div>
<jsp:include page="../include.jsp" flush="true"/>
</div>

</div>
	
	<div id="divm">
<table class="table">
<thead class="table-light">
	<tr>
	<th>글 번호</th>
	<th>글 제목</th>
	<th>작성자</th>
	<th>조회수</th>
	<th>작성시간</th>
	</tr>
	</thead> 
	<tbody>
	<c:forEach items="${bList}" var="bList">
			<tr>
				<th scope="row">${bList.b_number}</th>
				<td><a href="/board/detail?b_number=${bList.b_number}&page=${paging.page}">${bList.b_title}</a></td>
				<td>${bList.m_id}</td>
				<td>${bList.b_hits}</td>
				<td>${bList.b_date}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div> 
		<c:choose>
			<c:when test="${paging.page<=1}">
				[이전]&nbsp;
			</c:when>
			<c:otherwise>
				<a href="/board/paging?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					${i}
				</c:when>
				<c:otherwise>
					<a href="/board/paging?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="/board/paging?page=${paging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>
	

<div style="float:right; padding:10px;">
	<button type="button" class="btn btn-primary" onclick="location.href='write'">글쓰기</button>
</div>

	<div style="float:right; padding:10px;">
	<form action="/board/search" method="get">
		<select name="searchtype">
			<option value="b_title">제목</option>
			<option value="m_id">작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어">
		<input type="submit" value="검색">
	</form>
	</div>
</div>	
</body>
</html>