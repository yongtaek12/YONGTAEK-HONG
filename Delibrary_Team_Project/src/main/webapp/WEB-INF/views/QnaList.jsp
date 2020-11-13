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
<style type="text/css">
	#button{
		margin : 10px;
		padding: 1px 4px;
		text-decoration: none; 
		background-color: #eff3f8; 
		color: black;
		border: 1px solid #eff3f8;
		border-radius: 5px;
	}
	#button_search{
		margin : 10px;
		padding: 1px 4px;
		text-decoration: none; 
		background-color: #eff3f8; 
		color: black;
		border: 1px solid #eff3f8;
		border-radius: 5px;
	}
	.qna_list a:hover{
		text-decoration: underline;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).ready(function () {
		 	$("#button").css('cursor', 'pointer');
		});		

		$(".qna_list").mouseover(function(){
			$(this).css("background-color", "#eff3f8");
		});
		$(".qna_list").mouseout(function(){
			$(this).css("background-color", "transparent");
		});

		$("#button").mouseover(function(){
			$(this).css("background", "#b2c4df");
		});
		$("#button").mouseout(function(){
			$(this).css("background-color", "#eff3f8");
		});

		$("#button_search").mouseover(function(){
			$(this).css("background", "#b2c4df");
		});
		$("#button_search").mouseout(function(){
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
<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////// -->		
		<section id="main_section">
			<article class="main_article">	
			<h3>Q&A 게시판</h3>
			<br>
			
			<form action="QnaList.do" method="get" class="search">
		       	<p align="right">
		       	<span>총 ${totalCount} 개 </span> 
		       	
			        <select name="option" size="1">
			           <option value="p_title">제목</option>
			           <option value="p_writer">작성자</option>
			        </select>
			        <input type="search" name="search"> <!-- 검색단어input태그 -->
					<button id="button_search">검색</button>
				</p>
		    </form>
			<table>
			
						<tr align="center">
		                  <th nowrap width="80">번호</th>
		                  <th nowrap width="200" align="left">제목</th>
		                  <th nowrap width="200">게시일</th>
		                  <th nowrap width="100">작성자</th>
		                  <th nowrap width="80">조회</th>
               			</tr>
				
				<c:forEach var="q" items="${list }" begin="${start }" end="${end }">
						<tr class="qna_list" align="center">
						    <td>${q.p_no%10000}</td>
						    <td><a href="QnaDetail.do?p_id=${q.p_id }">${q.p_title }</a></td>
							<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${q.p_regdate }" /></td>
						    <td>${q.p_writer}</td>
						    <td>${q.p_hit}</td>
						 </tr>
				 </c:forEach>
				 
			</table>
				<p align="right">
				<a href="QnaInsert.do?cust_no=${cust_no}" class="insert">글쓰기</a>
				</p>
				<br>
				<p align="center">
					<c:forEach var="i" begin="1" end="${totalPage }">
						<a href="QnaList.do?pageNUM=${i }">${i }</a>&nbsp;
					</c:forEach>
				</p>
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