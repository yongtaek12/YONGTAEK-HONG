<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="StyleSheet" type="text/css" href="/resource/TeamCSS.css">

<script>
    function value_check() {
        var check_count = document.getElementsByName("genre").length;
 
        for (var i=0; i<check_count; i++) {
            if (document.getElementsByName("genre")[i].checked == true) {
                alert(document.getElementsByName("genre")[i].value);
            }
        }
    }
</script>
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
		#p_del input{
		background-color: #eff3f8;
		padding: 7px 15px;
		border: 1px solid #eee;
		border-radius: 5px;
		font-size: 15px;
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
	</style>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(document).ready(function () {
			    $("#p_del input").css('cursor', 'pointer');
			});
			$("#p_del>input").mouseover(function(){
				$(this).css("background-color", "#b2c4df");
			});
			$("#p_del>input").mouseout(function(){
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
			<br><br>
			<h3>커뮤니티</h3><br><br>
			<p><a href="postList.do?group=10">공지사항</a></p><br>
			<p><a href="postList.do?group=20">창작물 게시판</a></p><br>
			<p><a href="postList.do?group=30">중고장터</a></p><br>
		</aside>
		<section id="main_section">
			<article class="main_article">
				<c:if test="${group eq 10 }">
					<h3>공지사항<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 20 }">
					<h3>창작물 게시판<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 30 }">
					<h3>중고장터<br>&nbsp;</h3>
				</c:if>
		        <div style="border: 1px solid #eee; padding: 10px; margin: 10px 10px 10px 0px;">
		        
		        <form action="postDelete.do?p_id=${z.p_id }&&cus_no=${cust_no}" method="post">
					<div id="p_del">
						<h4>게시물을 삭제하시겠습니까?</h4>
						<input type="hidden" name="p_id" value="${z.p_id }">
						<input type="hidden" name="cust_no" value="${cust_no }">
						<br><br>
						<%-- <p style="font-size: 15px; color: #aaa;">게시일 ${p.p_regdate} | 작성자 ${p.p_writer} | 조회 ${p.p_hit }</p> --%>
						<input type="submit" value="확인">
					</div>
				</form>	
				</div>
			</article>
		</section>
	</div>
	<footer id="main_footer">
		<h3>footer입니다.</h3>
	</footer>
</body>
</html>