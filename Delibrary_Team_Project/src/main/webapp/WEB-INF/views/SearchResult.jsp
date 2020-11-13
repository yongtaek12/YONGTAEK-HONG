<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<!-- kakao 검색 API -->
<script type="text/javascript">
	$(function() {
		let booklist;

		let search = function(pageNUM) {
			if(pageNUM === undefined){
				pageNUM = 1;
			}
			let size = 48;
			$.ajax({
				method: "GET",
				url: "https://dapi.kakao.com/v3/search/book?target=title&size=" + size + "&page=" + pageNUM,
				data: { query:  $("#query").val() },
				headers: {Authorization: "KakaoAK 0050577fad730d5470e0f11bcdf64cd6"}
			})
				.done(function(msg) {
					if(pageNUM == 1){
						booklist = msg;
					}
					alert(msg.documents[0].title);
					var ul = $('<ul></ul>').addClass('card-list');
					var totalPage;
	
					for(let i = 0; i < msg.documents.length; i++) {
						var li = $('<li></li>').addClass('card');
						var a = $('<a></a>').addClass('card-image')
						$(a).css('background-image', 'url(' + msg.documents[i].thumbnail + ')');
						$(a).attr('data-image-full', msg.documents[i].thumbnail);
						a.css("width", "120px");
						a.css("height","174px");
						//$(a).attr('href', );
						var img = $('<img>').attr('src', msg.documents[i].thumbnail);
						//img.css("width", "120px");
						//img.css("height","174px");
	
						var a2 = $('<a></a>');
						$(a2).addClass('card-description');
						//$(a2).attr('href', );
						$(a2).attr('target', '_blank');
						
						var h4 = $('<h4></h4>').text(msg.documents[i].title);
						var p = $('<p></p>').text(msg.documents[i].authors);
	
						$(a).append(img);
						$(li).append(a);
						
						$(a2).append(h4);
						$(a2).append(p);
						$(li).append(a2);
	
						$(ul).append(li);
						$('.searchResult-body').append(ul);
					}
					
					let totalCount = msg.meta["pageable_count"];
					if(pageNUM != 1){
						totalCount = booklist.meta["pageable_count"];
					}
					console.log(pageNUM);
					console.log(size);
					console.log(totalCount);
					totalPage = totalCount / size + 1;
					if(totalCount / size === 0){
						totalPage = totalCount / size;
					}
					
					for(let i = 1; i <= totalPage; i++) {
						$('.paging').append($('<a></a>').addClass('paging-num').text(i));
					}

					$('.paging-num').click(function() {
						let clickedPage = $(this).text();
						$('.searchResult-body').children().remove();
						$('.paging').children().remove();
						search(clickedPage);
					});
				});
		}

		search();

		// footer
		$('#year').text(new Date().getFullYear());
	});
</script>

<style type="text/css">
	/* Lazy Load Styles */
	.card-image {
		display: block;
		background: #fff center center no-repeat;
		background-size: cover;
		margin: 0 auto;
		/* filter: blur(3px); /* blur the lowres image */ */
	}
	
	.card-image > img {
		display: block;
		width: 100%;
		opacity: 0; /* visually hide the img element */
	}
	
	.card-image.is-loaded {
		filter: none; /* remove the blur on fullres image */
		transition: filter 1s;
		margin: 0 auto;
	}
	
	/* Layout Styles */
	
	.card-list {
		display: block;
		padding: 0;
		font-size: 0;
		/* text-align: center; */
		list-style: none;
	}
	
	.card-body {
		padding: 0;
	}
	
	.card {
		display: inline-block;
		width: 200px;
		height: 250px;
		margin: 1rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		box-shadow: 0 0 3rem -1rem rgba(0, 0, 0, 0.5);
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	}
	
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		box-shadow: 0 0.5em 3rem -1rem rgba(0, 0, 0, 0.5);
	}
	
	.card-description {
		display: block;
		color: #515151;
		width: 200px;
		height: 100px;
		text-align: center;
	}
	
	.card-description > h4 {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		font-size: large;
		font-weight: bold;
	}
	
	.searchResult-body {
		margin-right: 150px;
		float: left;
		width: 60%;
	}
	
	.searchResult-options {
		margin-left: 150px;
		float: left;
		width: 20%;
		text-align: center;
	}
	
	.paging {
		margin: 0 auto;
		text-align: center;
		width: 100%;
		float: left;
	}
	
	.paging-num {
		margin: 0 10px;
	}
</style>
</head>
<body>
	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark">
		<div class="container">
			<a href="home.html" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark.jpg" height="24"></a>
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
					<li class="nav-item active">
						<a href="community.html" class="nav-link">커뮤니티</a>
					</li>
					<li class="nav-item">
						<a href="mypage.html" class="nav-link">나의도서</a>
					</li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="로그인" src="img/login_bg_dark.png" height="50"></a>
					</li>
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="회원가입" src="img/add_user_bg_dark.png" height="50"></a>
					</li>
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="북카트" src="img/book_bg_dark.png" height="50"></a>
					</li>
					<li class="nav-item">
						<a href="sitemap.html" class="nav-link"><img class="icons" alt="사이트맵" src="img/map_bg_dark.png" height="50"></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- PAGE HEADER -->
	<header id="page-header">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <h1>도서 검색</h1>
			</div>
		  </div>
		</div>
	</header>
	
    <!-- MAIN SECTION -->
	<section id="contact" class="py-3">
			<div class="searchResult-options">
			  <h4>Options</h4>
			  <br>
			  	리스트 출력 옵션들
			  	<input id="query" value="${query}" type="hidden">
			</div>
			<div class="searchResult-body">
				
			</div>
			<div class="paging">
				
			</div>
	</section>
	
	<div style="clear: both"></div>

  <!-- FOOTER -->
  <footer id="main-footer" class="text-center p-4">
    <div class="container">
      <div class="row">
        <div class="col">
          <p>Copyright &copy;
            <span id="year"></span> Glozzom</p>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>