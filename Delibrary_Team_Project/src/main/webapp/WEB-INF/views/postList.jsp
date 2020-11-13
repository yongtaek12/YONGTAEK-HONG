<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" type="text/css" href="/resource/TeamCSS.css">
<style type="text/css">
	.insert{
		padding: 3px; 
		text-decoration: none; 
		background-color: #eff3f8; 
		color: black;
		border-radius: 5px;
	}
	#submit{
		background-color: #eff3f8;
		padding: 1px 4px;
		border: 1px solid #eff3f8;
		border-radius: 5px;
	}
	.post_list a:hover{
		text-decoration: underline;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).ready(function () {
		    $("#submit").css('cursor', 'pointer');
		});
		
		$(".post_list").mouseover(function(){
			$(this).css("background-color", "#eff3f8");
		});
		$(".post_list").mouseout(function(){
			$(this).css("background-color", "transparent");
		});
		
		$("#submit").mouseover(function(){
			$(this).css("background", "#b2c4df");
		});
		$("#submit").mouseout(function(){
			$(this).css("background-color", "#eff3f8");
		});
		$(".insert").mouseover(function(){
			$(this).css("background", "#b2c4df");
		});
		$(".insert").mouseout(function(){
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
			<h2>커뮤니티</h2>
			<ul>
			<li><a href="postList.do?group=10">공지사항</a></li>
			<li><a href="postList.do?group=20">창작물 게시판</a></li>
			<li><a href="postList.do?group=30">중고장터</a></li>
			</ul>
		</aside>
		<section id="main_section">
			<article class="main_article">	
				<c:if test="${group eq 10}">
					<h3>공지사항<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 20}">
					<h3>창작물 게시판<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 30}">
					<h3>중고장터<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 60}">
					<h3>자유게시판<br>&nbsp;</h3>
				</c:if>
				<br>
				<form action="" method="post" class="search">
					<span>총 ${totalCount} 개 </span> 
					<select name="option">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
					</select>
					<input type="search" name="search">
					<input id="submit" type="submit" value="검색">
				</form>
				<table>
					<tr>
		                  <th nowrap width="80">분류</th>
		                  <th nowrap width="200" align="left">제목</th>
		                  <th nowrap width="200">게시일</th>
		                  <th nowrap width="100">작성자</th>
		                  <th nowrap width="80">조회</th>
               			</tr>
		
					<c:forEach var="p" items="${list }" begin="${start }" end="${end }">
						<tr class="post_list">
							<td align="center">${p.p_no%10000 }</td>
							<td>
								<a href="postDetail.do?p_id=${p.p_id}&&group=${group}">${p.p_title }</a>
							</td>
							<td align="center"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${p.p_regdate }" /></td>
							<td align="center">${p.p_writer }</td>
							<td align="center">${p.p_hit }</td>
						</tr>
					</c:forEach>
				</table>
				<c:forEach var="i" begin="1" end="${totalPage }">
					<a href="postList.do?group=${group}&&pageNUM=${i }">${i }</a>&nbsp;
				</c:forEach>
				<a href="postInsert.do?group=${group}&&cust_no=${cust_no}" class="insert">글쓰기</a>
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