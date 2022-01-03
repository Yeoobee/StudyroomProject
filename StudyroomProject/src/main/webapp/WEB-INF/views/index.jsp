<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">
<style>
	.image-box{
    height:1000px;
    overflow:hidden;
    margin:0 auto;
    background-image:url('../resources/upload/headerbg1.jpg');
    background-size: cover;
	}
	
	.right-box{
	position: fixed;
  	top: 0; right: 0;
	}
	.left-box{
	position: fixed;
  	top: 0; left: 0;
	}

</style>
</head>
<body class="body">


	<header id="header">
	<div class="image-box" style="margin-bottom:200px;">
	<div class="left-box">
		 <a href="#header"> <img src="../resources/upload/homei.png" style="width:100px"> </a>
	</div>
	<div class="right-box">
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
        		<c:if test="${sessionScope.loginId eq 'admin'}">
        		<li class="nav-item">
   					 <a class="nav-link" href="reservation/list">예약목록(관리자용)</a>
  				</li>
        		</c:if>
  				<li class="nav-item">
   					 <a class="nav-link" href="#sroom">스터디룸 사진</a>
  				</li>
  				<li class="nav-item">
   					 <a class="nav-link" href="reservation/reservation">예약하기</a>
  				</li>
  				<li class="nav-item">
   					 <a class="nav-link" href="reservation/reserlist">예약현황</a>
  				</li>
  				<li class="nav-item">
   					 <a class="nav-link" href="board/review">후기 게시판</a>
  				</li>

			</ul>

 </div>
 </div>
        </div>
    </header> 


        <section id="sroom">
            <div class="container">
               <div class="text-center" style="margin-bottom:50px;">
                    <h1 class="section-heading text-uppercase" style="font-family: 'Stylish', sans-serif;">study room</h1>
                </div>
            
            
               <div style="display : flex">
	<div class="card" style="width: 50rem; margin:10px;">
  <img src="../resources/upload/방1.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">소형룸</h5>
    <p class="card-text">1~2인용 스터디룸</p>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" disabled>
  사진 보기
</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


  </div>
</div>
	<div class="card" style="width: 50rem; margin:10px;">
  <img src="../resources/upload/방2.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">단체룸</h5>
    <p class="card-text">단체로 공부할 수 있도록 꾸며진 스터디룸</p>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" disabled>
  사진 보기
</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


  </div>
</div>
	<div class="card" style="width: 50rem; margin:10px;">
  <img src="../resources/upload/방3.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">회의용룸</h5>
    <p class="card-text">4~6인용 스터디룸</p>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" disabled>
  사진 보기
</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


  </div>
</div>
</div>
</div>
</section>


 <!-- Footer-->
        <footer class="footer py-4" style="height:100px; margin-top:100px;">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">My Website 2021</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">JaeYeop</a>
                        <a class="link-dark text-decoration-none" href="#!">Kim</a>
                    </div>
                </div>
            </div>
        </footer>

    </body>
</html>
