<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="resource/style.css">
  <title>딜리브러리 Delibrary - 로그인</title>
</head>

<body>
	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark">
		<div class="container">
			<a href="Home.do" class="navbar-brand"><img alt="딜리브러리" src="resource/img/logo_bg_dark.jpg" height="24"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item">
						<a href="about.html" class="nav-link">도서관소개</a>
					</li>
					<li class="nav-item">
						<a href="books.html" class="nav-link">도서정보</a>
					</li>
					<li class="nav-item">
						<a href="community.html" class="nav-link">커뮤니티</a>
					</li>
					<li class="nav-item">
						<a href="mypage.html" class="nav-link">나의도서</a>
					</li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a href="LoginPage.do" class="nav-link"><img class="icons" alt="로그인" src="resource/img/login_bg_dark.png" height="50"></a>
					</li>
					<li class="nav-item">
						<a href="insertCustomer.do" class="nav-link"><img class="icons" alt="회원가입" src="resource/img/add_user_bg_dark.png" height="50"></a>
					</li>
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="북카트" src="resource/img/book_bg_dark.png" height="50"></a>
					</li>
					<li class="nav-item active">
						<a href="sitemap.do" class="nav-link"><img class="icons" alt="사이트맵" src="resource/img/map_bg_dark.png" height="50"></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

  <!-- PAGE HEADER -->
  <header id="page-header">
    <div class="container">
      <div class="row">
        <div class="col-md-7 m-auto text-center">
		  <h1 class="display-5" style="font-weight:100;">회원로그인</h1>
        </div>
      </div>
    </div>
  </header>

  <!-- MAIN SECTION -->
	<section id="loginPage">
		<!-- 타이틀: 딜리브러리 -->	
		<h1 class="heroTitle">Delibrary<span class="heroTitle_dot"> : </span> <span class="heroTitle_kor">딜리브러리</span></h1>
		<hr class="heroLine">
		
		<!-- 로그인 폼 시작 -->	
		<form action="Home.do" method="post">
		<div class="form-group mt-4">
			<input class="form-control form-control-lg" type="email" id="email" name="email" placeholder="이메일 주소">
			<input class="form-control form-control-lg mt-2" type="password" id="pw" name="pw" placeholder="비밀번호">
			<input type="hidden" name="loginOk" value="ok">
			<button class="btn btn-dark btn-lg btn-block mt-2 btn-Customer" type="submit">로그인</button>
		</div>
	</form>
	
	<!-- 회원가입 / 이메일찾기 / 비밀번호찾기 -->	
	<div id="loginInfo">
		<p class="text-right">아직 딜리브러리 회원이 아니신가요? <br>
		<a href="insertCustomer.do">회원가입하기</a><br>
		<hr class="heroLineSecond">
		<p class="text-muted text-center mb-5">
			<a href="#" data-toggle="modal" data-target="#emailModal">이메일 찾기 </a>
			&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#pwModal">비밀번호찾기</a> </p>
		</form>
	</div>


	<!-- 이메일찾기 MODAL -->
	<div class="modal" id="emailModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">내 이메일 찾기</h5>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="username">이름</label>
							<input type="text" placeholder="이름을 입력하세요" class="form-control">
						</div>
						<div class="form-group">
							<label for="password">가입 휴대전화번호</label>
							<small class="text-muted">ex) 010-1234-5678</small>
							<input type="tel" placeholder="휴대전화번호를 입력하세요" class="form-control">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-outline-info btn-Customer" data-dismiss="modal">내 이메일 찾기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀번호 찾기 MODAL -->
	<div class="modal" id="pwModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">내 비밀번호 찾기</h5>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="username">이름</label>
							<input type="text" placeholder="이름을 입력하세요" class="form-control">
						</div>
						<div class="form-group">
							<label for="password">가입 이메일</label>
							<small class="text-muted">ex)hello@delibrary.com</small>
							<input type="email" placeholder="이메일을 입력하세요" class="form-control">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-outline-info btn-Customer" data-dismiss="modal">비밀번호 찾기</button>
				</div>
			</div>
		</div>
	</div>

	</section>
  <!-- FOOTER -->	
  <footer id="main-footer" class="text-center p-4">
    <div class="container">
      <div class="row">
        <div class="col">
          <p>Copyright &copy;
            <span id="year"></span> Delibrary 딜리브러리</p>
        </div>
      </div>
    </div>
  </footer>

  <!---------------------- 자바스크립트 섹션 ----------------------->

  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());
  </script>
</body>

</html>