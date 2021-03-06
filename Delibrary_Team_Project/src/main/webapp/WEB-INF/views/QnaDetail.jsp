<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="StyleSheet" type="text/css" href="/resource/TeamCSS.css">
<!-- 콘텐츠 -->
<style>
	#content {
		text-align: left;
	}
	
	#content > #main_section {
		width: 750px;
		float: right;
		margin-left: auto;
	}
	
	#content > #main_aside {
		text-align: center;
	}
</style>
<!-- 사이드 -->
<style>
	.tab_item {
		height: 230px;
	}
</style>
<!-- 게시글 상세 -->
<style type="text/css">
	#main_section a{
		padding: 3px; 
		text-decoration: none; 
		background-color: #eff3f8; 
		color: black;
		border-radius: 5px;
	}
	#move_list{
		margin: 20px 0 10px 0;
	}
	#move_list a{
		padding: 7px 15px;
	}
	#move_list2 a{
		padding: 3px 10px;
		font-size: 14px;
		float: right;
		border: 1px solid #eee;
	}
	#p_title{
		border-bottom: 1px solid #eee; 
		padding-bottom: 10px;
	}
	#p_title p{
		font-size: 25px;
	}
	#p_content{
		padding: 10px;
		border-bottom: 1px solid #eee;
	}
	#re_Submit{
		 margin-top:20px; 
	}
	#re_Submit span{
		 font-size: 20px;
	}
	#re_Submit textarea{
		resize: none;
		width:100%; 
		height:100px; 
		border: 1px solid #ccc; 
		margin:5px 0 10px 0;
	}
	#re_Submit input{
		background-color: #eff3f8;
		padding: 0 3px;
		border: 1px solid #eee;
		border-radius: 5px;
		font-size: 13px;
	}
	#re_content div{
		border: 1px solid #eff3f8;
		margin-top: 10px;
		padding:5px;
	}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).ready(function () {
		    $("#re_Submit input").css('cursor', 'pointer');
		});
		
		$("#main_section a").mouseover(function(){
			$(this).css("background-color", "#b2c4df");
		});
		$("#main_section a").mouseout(function(){
			$(this).css("background-color", "#eff3f8");
		});
		
		$("#re_Submit>input").mouseover(function(){
			$(this).css("background-color", "#b2c4df");
		});
		$("#re_Submit>input").mouseout(function(){
			$(this).css("background-color", "#eff3f8");
		});
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
			<li><a href="QnaList.do">Q&A</a></li>
			<li><a href="addrViewpageAPI.do">오시는 길</a></li>
			</ul>
		</aside>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////// -->		
		<section id="main_section">
			<article class="main_article">
				
		  		
					<h3>Q&A 게시판<br>&nbsp;</h3>
		        
		         
		        <div id="move_list">
		        	<a href="#">&lt; 이전</a>&nbsp;&nbsp;
		        	<a href="#">다음 &gt;</a>&nbsp;&nbsp;
		        	<a href="QnaList.do">목록</a>
	        	</div>
		        <div style="border: 1px solid #eee; padding: 10px; margin: 10px 10px 10px 0px;">
	        	<!--  삭제수정링크 -->
		        <div id="move_list2">	        	
						<a href="QnaDelete.do?p_id=${a.p_id }&&cust_no=${cust_no}">삭제</a>
						<a href="QnaUpdate.do?p_id=${a.p_id }&&cust_no=${cust_no}">수정</a>
		        </div>
					<div id="p_title">
						<p>${a.p_title }</p>
						<br>
						<p style="font-size: 13px; color: #aaa;">게시일 <fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${p.p_regdate }" /> | 작성자 ${p.p_writer} | 조회 ${p.p_hit }</p>
					</div>
					<div id="p_content">
						${a.p_content }
					</div>
					<div>
	               	<a href="img/${a.fname }"><img alt="${a.fname }" src="img/${a.fname }" height="150"></a>
	                </div>
					<div>
						<div id="re_Submit">
							<span>댓글 </span>
							<input type="submit" value="등록">
							<textarea></textarea>
						</div>
						<div id="re_content">
							<c:forEach var="r" items="${listReply }">
								<div>
									<p style="font-weight: bold; background-color: #eff3f8; padding: 5px;">${r.re_writer}</p>
									<p style="font-size: 13px; color: #aaa;"><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${r.re_regdate }" /></p>
									<p>${r.re_content }</p>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</article>
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