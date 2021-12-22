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
	<header>
		<c:choose>
			<c:when test="${sessionScope.loginId eq null}">	
           	 	<div style="float:right; padding:20px;">
                	<button type="button" class="btn btn-primary" onclick="location.href='member/signin'">로그인</button>
            	</div>
            </c:when>
            <c:otherwise>
				<div class="btn-group" role="group" aria-label="Basic example" style="float:right; padding:20px;">
  					<button type="button" class="btn btn-primary" onclick="location.href='member/findById?m_number=${sessionScope.loginNumber}'" >${sessionScope.loginId}</button>
  					<button type="button" class="btn btn-outline-primary" onclick="location.href='member/logout'">로그아웃</button>
				</div>
		</c:otherwise>
		</c:choose>
		<div style="float:right; padding:20px;">
        	<ul class="nav">
        		<c:if test="${sessionScope.loginId eq 'admin'}">
        		<li class="nav-item">
   					 <a class="nav-link" href="member/list">회원목록(관리자용)</a>
  				</li>
        		</c:if>
  				<li class="nav-item">
   					 <a class="nav-link" href="#">스터디룸 사진</a>
  				</li>
  				<li class="nav-item">
   					 <a class="nav-link" href="#">예약하기</a>
  				</li>
  				<li class="nav-item">
   					 <a class="nav-link" href="board/review">후기 게시판</a>
  				</li>

			</ul>
        </div>
        <div style="float:right; padding:20px;">
        </div>
    </header> 
</body>
</html>

