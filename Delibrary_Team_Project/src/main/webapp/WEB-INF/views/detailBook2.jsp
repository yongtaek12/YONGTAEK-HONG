<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" type="text/css"
	href="/resource/TeamCSS_nonAside.css">
<link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>

<!-- 용택 css 추가시작  사진 -->
<style>
* {
	box-sizing: border-box
}

body {
	font-family: "Lato", sans-serif;
}

.tab {
	padding: 5px;
	border-radius: 10px;
	float: left;
	background-color: #CEECF5;
	width: 30%;
	height: 300px;
}

/*버튼 */
.tab button {
	display: block;
	background-color: inherit;
	color: black;
	padding: 22px 16px;
	width: 100%;
	border: none;
	outline: none;
	text-align: left;
	cursor: pointer;
	transition: 0.3s;
	font-size: 17px;
}

/*hover  색변경 */
.tab button:hover {
	background-color: #A9E2F3;
}

/* 책소개 인덱스 저자소개 내용 */
.tabcontent {
	float: left;
	padding: 20px 12px;
	width: 70%;
	border-left: none;
	height: 350px;
}

.reverse {
	color: white;
	background-color: #58ACFA;
	border-radius: 10px;
}

.b_image {
	padding: 0px 5px;
	width: 200px;
	height: 250px;
	float: left;
}

/* 사진 옆에 타이틀 작가, 출간일 칸*/
.b_info1 {
	padding: 0px 20px 10px 30px;
	float: left;
	width: 400px;
	height: 250px;
	text-align: left;
}
</style>
<style>
/* 하얀색 동그란 배경*/
.main_article {
	border-radius: 20px;
	position: relative;
        left: 15px;
        top:20px;


}

.main_article2 {
	text-align: left;

}
</style>

<style>
/* 내서재 추가 / 바로대여*/
.buttonadd {
	border-radius: 4px;
	background-color: #F2F2F2;
	color: black;
	text-align: center;
	font-size: 20px;
	width: 20%;
	height: 10%;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}
/* 내서재 추가 / 바로대여*/
.buttonadd span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}
/* 내서재 버튼 효과/ 바로대여*/
.buttonadd span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.buttonadd:hover span {
	padding-right: 25px;
}

.buttonadd:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
//책소개 누르면 나오기
function openD(evt, Name) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  document.getElementById(Name).style.display = "block";
	  
	  
	}




$(function(){
	

	
	$('.revers').mouseover(function() {
		$(this).addClass("reverse",700);
	}); 
	
	$('.revers').mouseleave(function() {
		$(this).removeClass("reverse",700);
	});
	
	$('#borrow').click(function(){
		$('#dialog-message').dialog({
		modal: true, 
		buttons: {
			
			
			"대출하고싶어요": function() {
			 var count = eval(${b.b_count });
			if(count =0){
				alert("대여가능한 도서가 없습니다")
			}else{
				var return_ok ="ok";
				$.ajax("/insertBorrow",{
					return_ok:return_ok,
					success:function(res){
						console.log(res);
					}});	
			}
				alert("대여완료")
				
		},"싫어요": function() { alert("취소하셨습니다.") }
				 },
			
	});

	});
	$('#my_library').click(function(){
		var result = confirm('내서재에 추가하시겠습니까??'); 
			if(result){
				location.replace('insertMy_Library.jsp')};				
			
	});
	document.getElementById("defaultOpen").click();

	<!-- 홈화면에서 책 누르면 자동으로 검색되는 ajax (재성이 추가)-->
	let search = function() {
		$.ajax({
			method: "GET",
			url: "https://dapi.kakao.com/v3/search/book?target=title",
			data: { query:  $("#query").val() },
			headers: {Authorization: "KakaoAK 0050577fad730d5470e0f11bcdf64cd6"}
		})
			.done(function(msg) {
				$('#b_image').attr("src", msg.documents[0].thumbnail);
				$('#b_title').text("책 제목 : " + msg.documents[0].title);
				$('#b_writer').text("저자 : " + msg.documents[0].authors);
				$('#b_year').text("출간일 : " + (msg.documents[0].datetime).substr(0, 10));
				$('#b_price').text("가격 : " + msg.documents[0].price);
				$('#detail').text(msg.documents[0].contents);
			});
	}
	search();
});
</script>

</head>
<body>
	<input id="query" value="${query}" type="hidden">
	<header id="main_header">
		<div id="title">
			<a href="Home.do">
			<img alt="홈페이지" src="img/Logo.png" width=500px; height=150px;>
			</a>
		</div>
		<nav id="main_gnb">
			<ul>
				<c:if test="${empty cust_no }">
					<li><a href="LoginPage.do">로그인</a></li>
					<li><a href="insertCustomer.do">회원가입</a></li>
				</c:if>
				<c:if test="${not empty cust_no }">
					<li><a href="MyPage_Info.do?cust_no=${cust_no }">마이페이지</a></li>
					<li><a href="logout.do?cust_no=${cust_no }">로그아웃</a></li>
				</c:if>
			</ul>
		</nav>
		<nav id="main_lnb">
			<div class="menu"><a>도서대여</a></div>
			<div class="menu"><a href="postList.do?group=10">커뮤니티</a></div>
				<div class="dropdown">
					<img src="resource/img/community icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="postList.do?group=10">공지사항</a></div><br>
						<div class="sub"><a href="postList.do?group=20">창작물 게시판</a></div><br>
						<div class="sub"><a href="postList.do?group=30">중고장터</a></div>
					</div>
				</div>
			<div class="menu"><a href="faqViewpage.do">고객지원</a></div>
				<div class="dropdown">
					<img src="resource/img/customer service icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="faqViewpage.do">FAQ</a></div><br>
						<div class="sub"><a href="QnaList.do">Q&A</a></div><br>
						<div class="sub"><a href="addrViewpageAPI.do">오시는길</a></div>
					</div>
				</div>
			<div class="menu"><a href="MyPage_Info.do?cust_no=${cust_no }">마이페이지</a></div>
				<div class="dropdown">
					<img src="resource/img/mypage icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="MyPage_Info.do?cust_no=${cust_no}">내정보</a></div><br>
						<div class="sub"><a href="MyPage_Folder.do?cust_no=${cust_no}">나의서재</a></div><br>
						<div class="sub"><a href="optOutCustomer.do">회원탈퇴</a></div>
					</div>
				</div>
			<div class="menu"><a href="siteMap.do">사이트맵</a></div>
		</nav>
	</header>

	<div id="content">
		<section id="main_section">
			<article class="main_article">
				<p>
					<img id="b_image" class="b_image" width=170px height=220px alt="book image"
						src="img/${b.b_image }"><br>
				</p>

				<div class="b_info1">
					<h3 class="revers" id="b_title"></h3>
					<br>
					<h3 class="revers" id="b_writer"></h3>
					<br>
					<h3 class="revers" id="b_year"></h3>
					<br>
					<h3 class="revers">이용가능한 서점 : ${bs.website }</h3>
					<br>
					<h3 class="revers" id="b_price"></h3>
					<br>
				</div>
			</article>
					<!-- 모달 다이얼로그 모음 -->
			<div id="dialog-message" title="도서대여" style='display: none'>
				<span style='color: green;font-size: 15pt;'>도서 재고 현재</span> <span
					style='font-size: 20pt;'>${b.b_count } 개</span> <b><u>대출하시겠습니까??</u></b><br />

			</div>

			<article class="main_article" style="height: 170px;">
				<article class="main_article2" style="height: 140px;">
					<div class="tab">
						<button class="tablinks" onclick="openD(event, 'detail')"
							id="defaultOpen">책소개</button>
					</div>

					<div id="detail" class="tabcontent">
						<h3>${b.b_detail }</h3>
					</div>
				</article>
			</article>

			<!-- 	<a href="BookAddAction.do?b_no=${b.b_no }"> -->
			<button id=my_library class="buttonadd" style="float:left; margin-left:50px;">
				<span>내서재 추가</span>
			</button>
			<button id=borrow class="buttonadd" style="float: left; margin-left:70px;">
				<span>바로 대여</span>
			</button>
	

		</section>
	</div>

	<footer id="main_footer">
		<p>&copy; 탈주금지조. All rights reserved. | Design by members of 탈주금지조.</p>
		<img alt="트위터" src="img/twitter_icon.png">
		<img alt="페이스북" src="img/facebook_icon.png">
		<img alt="인스타그램" src="img/insta_icon.png">
		<img alt="유튜브" src="img/youtube_icon.png">
	</footer>  
</body>
</html>