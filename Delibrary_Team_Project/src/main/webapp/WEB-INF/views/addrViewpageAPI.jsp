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

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#addr_title").css("color","#3635a5").css("margin","10px");
	
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
			<div class="addr">
				<div class="hgroup">
					<h2 id="addr_title">오시는길</h2>
					<hr>
				</div>
					<br>
		
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.
		1103800594706!2d126.93563751468302!3d37.552463132692885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.
		1!3m3!1m2!1s0x357c98be0a2cf6e3%3A0x4d8963de2196f6dc!
		2z7ISc7Jq47Yq567OE7IucIOuniO2PrOq1rCDrjIDtnaXrj5kg67Cx67KU66GcIDIz!5e0!3m2!1sko!2skr!4v1601211189306!5m2!1sko!2skr" 
		width="700" height="450" frameborder="0"></iframe>
			<div id="text" align="center">	 
			<br>
				<b>Delibrary</b> | 서울 마포구 백범로 23 구프라자 3층<br>
				 
				<b>고객센터</b> | 070-1234-5678<br>
				평일 9:00 - 18:00, 점심시간 12:00 - 13:30 &nbsp;( <span><font color="red"> 주말/공휴일 휴무 </font></span> )<br>
				 
				<b>팩스번호</b> | 0504-123-1234<br>
						 
				<b>이 메 일</b> | delibrary@book.com<br>
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