<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" type="text/css" href="/resource/TeamCSS.css">
<style type="text/css">
.accordion{
	margin:10px;
}
label{
	width: 700px;
}
input[id*="answer"]{
	display: none;
}
input[id*="answer"] + label {
	display: block;
	padding: 20px;
	border: 1px solid #232188;
	border-bottom: 0;
	color: #fff;
	font-weight: 900;
	background: #3635a5;
	cursor: pointer;
	position: relative;
}
/*
input[id*="answer"] + label em {
	position: absolute;
	top: 50%;
	right: 10px;
	width: 30px;
	height: 30px;
	margin-top: -15px;
	display: inline-block; 
}
*/
input[id*="answer"] + label + div {
	max-height: 0;
	transition: all .35s;
	overflow: hidden;
	background: #ebf8ff;
	font-size: 11px;
}
input[id*="answer"] + label + div p {
	display: inline-block;
	padding: 20px;
	font-size: 11px;
}
input[id*="answer"]:checked  + label + div{
	max-height: 100px;
	background-position: 0 -30px;
	width: 720px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#faq_title").css("color","#3635a5").css("margin","10px");
	$(".search").css("margin","10px");
	
});
</script>
</head>
<body>
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
    	<aside id="main_aside">
      	<h2>고객지원</h2>
       		<ul>
				<li><a href="faqViewpage.do">FAQ</a></li>
		    	<li><a href="QnaList.do">QNA</a></li>
		    	<li><a href="addrViewpageAPI.do">오시는 길</a></li>
       		</ul>
      	</aside>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<section id="main_section">      
			<div class="faq">
				<div class="hgroup">
					<h2 id="faq_title">FAQ</h2>
					<hr>
				</div>

				<form action="#" method="post" class="search">
		       	
			        <select name="option" size="1">
			           <option value="제목">제목</option>
			           <option value="내용">내용</option>
			        </select>
			        <input type="search" name="search" value="검색어를 입력하세요">
					<button id="button_search">검색</button>
		    	</form>
			<br>
			<br>
				
				<div class="accordion">
					<input type="radio" name="accordion" id="answer01"> 
						<label for="answer01">Q : 회원가입을 하면 편리한 점이 무엇인가요?</label>
						<div><p>ㅇ 도서관 홈페이지 이용시 반복되던 신분확인 절차가 회원가입시 한번의 인증으로 간소화 됩니다.<br>
								ㅇ 홈페이지에서 등록된 아이디로 간편하게 도서관 서비스 신청이 가능합니다.<br>
								ㅇ 회원가입시 입력하신 관심 주제분야의 추천도서를 제공 받을 수 있습니다.</p></div>
					<input type="radio" name="accordion" id="answer02"> 
						<label for="answer02">Q : 등록된 내 정보를 변경하고 싶습니다.</label>
						<div><p>Delibrary의 회원정보 변경은 고객님께서 직접 홈페이지 로그인 후<br>
						[마이페이지 > 회원정보 > 회원 정보 조회/수정] 에서 정보를 변경하실 수 있습니다.</p></div>
					<input type="radio" name="accordion" id="answer03"> 
						<label for="answer03">Q : 탈퇴는 어떻게 하나요?</label>
						<div><p>Delibrary 홈페이지 로그인 => ‘회원정보수정’ => ‘회원탈퇴’ 메뉴 클릭</p></div>	
				</div>
			</div>
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