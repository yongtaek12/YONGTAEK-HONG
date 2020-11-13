<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" type="text/css"
	href="/resource/TeamCSS_nonAside.css">
<link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">

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
	top: 20px;
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
<style>
.my_libraryForm {
	float: left;
	padding: 20px 12px 20px;
	border-left: none;
	font-size: 20px;
	border-radius: 4px;
	text-align: left;
	line-height: 40px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">

//전역변수
var FOL_NO =1;
let cust_no = Number(${cust_no});

//소메뉴바 파란색
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


	// 내서재 보기 기능 //삭제예정.
$(function(){
	var arr;
	// 내서재 보기 기능//삭제예정.
	var loadMy_Library = function(){
		$("#f").html("");
		//var cust_no =eval(${cust_no });
		
		$.ajax({
			url:"/listMy_Library",
			dataType:"Json",
			data: "cust_no="+${cust_no },
			success:function(data){
			
			$.each( arr , function(idx,item){
				var div = $("<div></div>").addClass("item");
				var TITLE = $("<h3></h3>").html( item.ML_TITLE );
				var REGDATE = $("<p></p>").html( item.ML_REGDATE );				
				var CONTENT = $("<p></p>").html( item.ML_CONTENT );
				var FILE = $("<img/>").attr("src","img/"+item.ML_FILE);
				$(ML_FILE).attr({
					width:40,
					height:40
				});
				$(div).append(TITLE,REGDATE,CONTENT,FILE);					
			//	$(li).attr("idx", idx );
				$("#f").append(div);
			});
		}});
	}
	//마이폴더보기 /삭제예정.
	
	
	var loadFolder=function(){
		
		$("#ul").html("");
		$.ajax({
			url:"/listFolder",
			dataType:"Json",
			data:"cust_no="+${cust_no },
			success:function(data){
				//alert(data);
			//console.log(data);
			  var getJson = JSON.stringify(data,['FOL_NO',1]);
			  alert(getJson);
	
					/*
					for(var i in data){
						var g = data[i];
						//alert(tr);
						var tr = document.createElement("tr");
						for(var j in g){
							var td = document.createElement("td");
							var tx = document.createTextNode(g[j]);
							td.appendChild(tx);
						}
						tr.appendChild(td);		
						}
					var list = document.getElementById("list");
					list.appendChild(tr);*/
							
				},error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }

			});
		}

	var insertPost = function(){
		
		var P_TITLE="${b.b_title }";

		//폴더값 가져와지는지 확인용
		//alert(P_TITLE)
		var data ={"FOL_NO":FOL_NO,"P_TITLE":P_TITLE,"cust_no":cust_no }
		$.ajax({
			url:"/insertPost",
			dataType:"Json",
			type:"POST",
			data:data,
			success:function(data){
				console.log(data);
				}
			});
		}
	$('.folder').mouseover(function() {
		$(this).addClass("reverse",700);
	}); 
	$('.folder').mouseleave(function() {
		$(this).removeClass("reverse",700);
	});
	// 폴더 클릭하면 값가져오기
	$('#tempList').on("click","tr",function(){
		//alert($(this).find("td:eq(0)").text());
		FOL_NO =eval($(this).find("td:eq(0)").text());
		//alert(FOL_NO);
		var result = confirm("폴더에 저장하시겠어요?");

		if(result){
			insertPost();
		    alert("저장");
			
		}else{
		    alert("취소");
		}
		
		});
		
	$('.revers').mouseover(function() {
		$(this).addClass("reverse",700);
	}); 
	
	$('.revers').mouseleave(function() {
		$(this).removeClass("reverse",700);
	});
	//대여버튼
	$('#borrow').click(function(){
		
		$('#dialog-borrow').dialog({
		modal: true, 
		buttons: {
				
			
			"대출하고싶어요": function() {
				//대여 날짜를 선택
				$('#dialog-borrow-date').dialog({
					modal: true, 
					buttons: {
						"대출":function(){
							let BOR_DATE = document.getElementById("BOR_DATE").value
							//let RETURN_DATE = BOR_DATE.setDate(BOR_DATE.getDate()+15);
							//alert(RETURN_DATE);
							var count = eval(${b.b_count });
							 var b_no = eval(${b.b_no });
							 var cust_no = eval(${cust_no });
							 var data= {"BOR_DATE" : BOR_DATE, "b_no": b_no, "cust_no":cust_no, }
							if(count <1){
								alert("대여가능한 도서가 없습니다")
							}else{
								
								var b_no =eval(${b.b_no });
								var cust_no =eval(${cust_no });
								
								$.ajax({
									url :"/insertBorrow",
									dataType:"Json",
									data:data,
										//"b_no="+b_no,
									//data: "cust_no="+${cust_no }}
									type: "POST",
									success:function(data){
										//alert("대출완료")
									},
									error : function(){
										//alert("에러")		
									}
									});	
							}
								//alert("대여완료")
								$( this ).dialog( "close" );								
							}				
					}										
				});	$( this ).dialog( "close" );				
		},"싫어요": function() { alert("취소하셨습니다.") }
				 },					
	});						
	});
	//내서재 추가
	$('#my_library').click(function(){
		//var result = confirm('내서재에 추가하시겠습니까??'); 
			//if(result){
				//var cust_no =eval(${cust_no });
			
			
			
								
				$('#dialog-library').dialog({
					modal:true,
				  	show: {effect: "blind", duration: 600 },			
					height:400,
					width:550,
					buttons:   {
						"내서재보기":function(){
							$("#library-list").dialog({
								modal:true,
							  	show: {effect: "blind", duration: 600 },			
								height:500,
									width:650,
								})
							
							}
							 }
						
				});
				});
	document.getElementById("defaultOpen").click();
	
});
</script>
</head>
<body>

	<header id="main_header">
		<div id="title">
			<a href="Home.do"> <img alt="홈페이지" src="img/Logo.png"
				width=500px; height=150px;>
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
			<div class="menu">
				<a>도서대여</a>
			</div>
			<div class="menu">
				<a href="postList.do?group=10">커뮤니티</a>
			</div>
			<div class="dropdown">
				<img src="resource/img/community icon.png" class="menu_icon">
				<div class="subWrapper">
					<div class="sub">
						<a href="postList.do?group=10">공지사항</a>
					</div>
					<br>
					<div class="sub">
						<a href="postList.do?group=20">창작물 게시판</a>
					</div>
					<br>
					<div class="sub">
						<a href="postList.do?group=30">중고장터</a>
					</div>
				</div>
			</div>
			<div class="menu">
				<a href="faqViewpage.do">고객지원</a>
			</div>
			<div class="dropdown">
				<img src="resource/img/customer service icon.png" class="menu_icon">
				<div class="subWrapper">
					<div class="sub">
						<a href="faqViewpage.do">FAQ</a>
					</div>
					<br>
					<div class="sub">
						<a href="QnaList.do">Q&A</a>
					</div>
					<br>
					<div class="sub">
						<a href="addrViewpageAPI.do">오시는길</a>
					</div>
				</div>
			</div>
			<div class="menu">
				<a href="MyPage_Info.do?cust_no=${cust_no }">마이페이지</a>
			</div>
			<div class="dropdown">
				<img src="resource/img/mypage icon.png" class="menu_icon">
				<div class="subWrapper">
					<div class="sub">
						<a href="MyPage_Info.do?cust_no=${cust_no}">내정보</a>
					</div>
					<br>
					<div class="sub">
						<a href="MyPage_Folder.do?cust_no=${cust_no}">나의서재</a>
					</div>
					<br>
					<div class="sub">
						<a href="optOutCustomer.do">회원탈퇴</a>
					</div>
				</div>
			</div>
			<div class="menu">
				<a href="siteMap.do">사이트맵</a>
			</div>
		</nav>
	</header>

	<div id="content">
		<section id="main_section">
			<article class="main_article">
				<p>
					<img class="b_image" width=170px height=220px alt="book image"
						src="img/${b.b_image }"><br>
				</p>

				<div class="b_info1">
					<h3 class="revers">책제목 : ${b.b_title }</h3>
					<br>
					<h3 class="revers">저자 : ${b.b_writer }</h3>
					<br>
					<h3 class="revers">출간일 : ${b.b_year }</h3>
					<br>
					<h3 class="revers">이용가능한 서점 : ${bs.website }</h3>
					<br>
					<h3 class="revers">가격 : ${b.b_price }</h3>
					<br>
				</div>
			</article>
			<div id="dialog-borrow" title="도서대여" style='display: none'>
				<img width="50px" height="60px" alt="book image"
					src="img/${b.b_image }"><span
					style='color: green; font-size: 15pt;'> 도서 재고 현재</span> <span
					style='font-size: 20pt;'>${b.b_count } 개</span> <span><b><u>대출하시겠습니까??</u></b></span>
			</div>
			
			<div id="dialog-borrow-date" title="대출일을 선택해주세요"
				style='display: none'>
				대출일 : <input type="date" name="BOR_DATE" id="BOR_DATE"><br>
			</div>
			
			<div id="dialog-library" title="내폴더 선택" style='display: none'>
							<h3>폴더 목록</h3>
				<table width="30%" id="tempList">
					<tr>
						
					<tr>
					<c:forEach var="g" items="${f }">
					<tr>
						<td>${g.fol_no }</td>
						<td  id ="test" class="folder">${g.fol_name }</td>				
					</tr>
					</c:forEach>						
				</table>
				
			</div>
			<div id="library-list" title="내서재목록" style='display: none'>
			 
				<table width="30%">
					<tr>
						<th>책이름</th>
					</tr>
					<c:forEach var ="m" items="${ml }">
					<tr>
						<td>${m.ML_TITLE }</td>
						
					</tr>
					</c:forEach>
				</table>
				
			</div>

			<article class="main_article" style="height: 170px;">
				<article class="main_article2" style="height: 140px;">
					<div class="tab">
						<button class="tablinks" onclick="openD(event, 'detail')"
							id="defaultOpen">책소개</button>
						<button class="tablinks" onclick="openD(event, 'index')">목차</button>
						<button class="tablinks" onclick="openD(event, 'writer')">저자소개</button>
					</div>

					<div id="detail" class="tabcontent">
						<h3>${b.b_detail }</h3>
					</div>

					<div id="index" class="tabcontent">
						<h3>${b.b_index }</h3>
					</div>

					<div id="writer" class="tabcontent">
						<h3>${b.b_writer }</h3>
					</div>
				</article>
			</article>

			<!-- 	<a href="BookAddAction.do?b_no=${b.b_no }"> -->
			<button id=my_library class="buttonadd"
				style="float: left; margin-left: 50px;">
				<span>내서재 추가</span>
			</button>
			<button id=borrow class="buttonadd"
				style="float: left; margin-left: 70px;">
				<span>바로 대여</span>
			</button>


		</section>
	</div>

	<footer id="main_footer">
		<p>&copy; 탈주금지조. All rights reserved. | Design by members of
			탈주금지조.</p>
		<img alt="트위터" src="img/twitter_icon.png"> <img alt="페이스북"
			src="img/facebook_icon.png"> <img alt="인스타그램"
			src="img/insta_icon.png"> <img alt="유튜브"
			src="img/youtube_icon.png">
	</footer>
</body>
</html>