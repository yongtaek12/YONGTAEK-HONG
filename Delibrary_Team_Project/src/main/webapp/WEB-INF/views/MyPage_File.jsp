<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" type="text/css" href="resource/TeamCSS.css">
<!--  양현왕 추가  -->
<style type="text/css">
.scroll{
	  background-color: white;
	  width: 700px;
	  height: 600px;
	  overflow-x: hidden;
	  overflow-y: scroll;
	}
	
	.file_list {
	    width: 100%; 
	    border-collapse: separate; 
	    border-spacing: 3px;
	}
	.file_list th {
	    padding: 15px; 
	    border: none; 
	    border-left: 5px solid #C03; 
	    border-bottom: 1px solid #DDD; 
	    background: #FCF0F3; 
	    font-weight: normal; 
	    text-align:center; 
	    text-shadow: 0 1px #FFF; 
	    vertical-align: middle;
	
	}
	.file_list td {
	   padding: 15px; 
	   border: none;
	   border-bottom: 1px solid #DDD; 
	   text-align: left; 
	   vertical-align: baseline;
	   background-color: #FBF2EF;
	}
	
</style>
<script type="text/javascript">
	    function value_check() {
	        var check_count = document.getElementsByName("genre").length;
	 
	        for (var i=0; i<check_count; i++) {
	            if (document.getElementsByName("genre")[i].checked == true) {
	                alert(document.getElementsByName("genre")[i].value);
	            }
	        }
	    }

	    function changeArray(asc) {
	        location.href="Mypage_File.do?group=50&&array="+asc;
	    }
	    
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
          <h2>마이페이지</h2>
			<ul>
				<li><a href="MyPage_Info.do?cust_no=${c.cust_no}">&nbsp;&nbsp;내정보</a></li>
				<li><a href="MyPage_Folder.do?cust_no=${c.cust_no}">&nbsp;&nbsp;나의서재</a></li>
				<li><a href="optOutCustomer.do">&nbsp;&nbsp;회원탈퇴</a></li>
			</ul>
    	</aside>
		
		<section id="main_section">
			<br>
  		<div style="background-color: #aaa; width: 100% padding: 20px">
    	<img src="img/${c.fname }" width="100" heigth="100" align="left" style="background: white;"><br>
		<p align="left" style="font-size: large; font-weight: bold;">탈주금지 님의 서재</p>
		<p>&nbsp;</p>
        </div>
    	<form action="#">
    	<br>
		<p align="right" style="padding-right: 4px;">
		<input type="search" value="내 서재 검색">
		<input type="submit" value="검색">
        </p>
        </form>
        <form action="#">
	   		<p align="left">
	   		<font style="font-size: x-large; font-weight: bold;" >세줄독후감</font>&nbsp;&nbsp;도서 ${totalRecord }권 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<form action="#">
				<input type="checkbox" name="title" value="title" onclick="changeArray(this.value)">제목 순 정렬
				<input type="checkbox" name="number" value="number" onclick="changeArray(this.value)">추가 순 정렬
			</form>
			</p>
        </form>
        <hr>
        <br>
        <div class="scroll" id="f">
        	<div align="left" id="list_book">
        	<table class="file_list">
       		 <c:forEach var="p" items="${list }">
        		<tr>
	        		<th scope="row">
					  	<a href="MyPage_DetailFile.do?p_id=${p.p_id}&&p_no=${p.p_no}&&group=${group}">
					  		<img src="img/${p.fname }" width="100" height="100" class="file_css">
				  		</a>
	          		</th>
        			<td style="font-size: small; color: gray; text-align: center; padding-top: 50px;">${p.p_content }</td>
			  	</tr>
			  	<tr>
          			<th scope="row" style="font-weight: bold;">${p.p_title }</th>
          			<td style="text-align: center; font-size: small;">${p.p_writer }</td>
			  	</tr>
	  			</c:forEach>
		  	</table>
		  
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