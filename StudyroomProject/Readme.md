mysql에서 구성한 테이블 생성

-- 회원테이블
create table member_table(
		m_number bigint auto_increment,
        m_id varchar(20) unique not null,
        m_password varchar(20) not null,
        m_name varchar(10) not null,
        constraint primary key(m_number));
        
-- 게시판테이블
create table board_table(
    b_number bigint auto_increment,
    b_title varchar(50) not null,
	m_id varchar(20) not null,
	b_contents varchar(1000) not null,
	b_hits int default 0,
	b_date datetime,
	b_filename varchar(100),
    constraint primary key(b_number),
    constraint foreign key(m_id) references member_table(m_id)
	);
	
-- 댓글테이블
create table comment_table(
	c_number bigint auto_increment,
    b_number bigint not null,
    m_id varchar(20) not null,
    c_contents varchar(200) not null,
    c_date datetime,
    constraint primary key(c_number),
    constraint foreign key(b_number) references board_table(b_number),
    constraint foreign key(m_id) references member_table(m_id)
    );
    
-- 스터디룸테이블
create table studyroom_table(
	s_number bigint auto_increment,
    s_name varchar(20) not null,
    s_filename varchar(100) not null,
    constraint primary key(s_number)
    );
        
-- 예약테이블
create table reservation_table(
	r_number bigint auto_increment,
    m_id varchar(20) not null,
    r_date datetime,
    s_number bigint not null,
    constraint primary key(r_number),
    constraint foreign key(s_number) references studyroom_table(s_number)
    );
               
StudyroomProject 생성
pom.xml, root-context.xml, web.xml 수정
각종 클래스 생성(Controller, Service, Repository, mapper ,Dto).. 어노테이션까지
mybatis-config.xml 생성
server 경로 '/' 로 수정
index.jsp에 로그인 버튼 생성
로그인 버튼을 누르면 로그인창을 띄우고 밑에 회원가입 버튼을 넣음
signin.jsp를 만들고 로그인버튼을 누르면 MemberController에 메서드 작성을 하고 띄우도록 함
signin.jsp 안에 회원가입(signup.jsp) 기능 생성. MemberController에 signupform 메서드 생성
signup.jsp에 회원가입 폼을 생성하고 MemberController signup 메서드를 통해 DB를 저장하도록 함
signup.jsp에 아이디 중복확인을 위한 함수 작성(ajax)
'취소'버튼을 추가해서 전 페이지로 가는 기능 추가
회원가입 기능 완료 후 로그인 기능 추가
로그인을 하면 메인페이지에 있는 '로그인' 버튼이 사라지고 로그인 된 아이디가 나옴(c:choose문을 활용)
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<c:choose>
			<c:when test="${sessionScope.loginId eq null}">	
           	 	<div style="float:right; padding:20px;">
                	<button type="button" class="btn btn-primary" onclick="location.href='member/signin'">로그인</button>
            	</div>
            </c:when>
            <c:otherwise>
				<div class="btn-group" role="group" aria-label="Basic example" style="float:right; padding:20px;">
  					<button type="button" class="btn btn-primary" disabled>${sessionScope.loginId}</button>
  					<button type="button" class="btn btn-outline-primary" onclick="location.href='member/logout'">로그아웃</button>
				</div>
		</c:otherwise>
		</c:choose>
로그아웃 기능 구현
스터디룸 사진, 예약하기, 후기게시판 링크 추가
클래스(Controller, Service, Repository, mapper, DTO) 및 mybatis 추가
후기게시판을 누르면 board/review.jsp로 이동
List<boardDTO>를 활용하여 글 리스트들이 나오도록 설정
review.jsp에 글쓰기 버튼 생성
글쓰기를 누르면 write.jsp로 이동
로그인을 해야만 글을 쓸 수 있으며, 글을 쓸 때 아이디는 고정되어있음.
회원목록을 볼 수 있는 기능 구현.(관리자만 열람 가능)
회원목록은 <c:forEach items="${mList}" var="mList"></c:forEach> 문으로 구현
회원삭제는 회원 아이디가 'admin'이면 삭제 불가능하고 다른 회원들은 삭제가 가능하다
회원상세정보 보기
로그인을 하고 자신의 아이디를 누르면 상세정보 보기가 가능
게시글 리스트에 페이징 기능 추가
글 제목을 누르면 그 글에 대한 상세 정보 보기.
누르면 조회수도 1 증가
게시글 삭제 기능 추가(본인과 관리자만 삭제 가능)
게시글 수정 기능 추가(본인이 쓴 글만 수정 가능)
게시글 검색 기능 추가