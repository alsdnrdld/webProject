<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
<meta name = "viewport" content ="width = device-width", initial-scale="1">
  <!-- 어떤 것으로 접속을 해도 그것에 알맞는 해상도로 보여주라는 명령어 -->
<link rel = "stylesheet" href="css/custom.css">
  <!-- stylesheet의 값을 적용 할것이고 그것의 값은 css/bootstrap.css라는 파일에 있는 값이다. -->
  
<link rel = "stylesheet" href="css/bootstrap.css">
 
<title>JSP 게시판 3</title>

</head>
<body>
<%Class.forName("com.mysql.jdbc.Driver"); %>
	   <%
   		// 로그인이 된 사람들
   		String userID = null;
   		if(session.getAttribute("userID") != null){
   			userID=(String)session.getAttribute("userID");
   		}
   %>
	<nav class= "navbar navbar-default">
		<div class = "navbar-header">
			<button type = "button" class ="navbar-toggle collapsed"
				data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1"
				aria-expanded = "false">
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>	
			</button>
			<a class="navbar-brand" href="main.jsp">JSP로 간단한 게시판 만들기 ♥</a>
		</div>
		<div class ="collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
			<ul class ="nav navbar-nav">
				<li class = "active"><a href ="main.jsp">메인으로 가기</a></li>
				<li><a href ="bbs.jsp">게시판으로 가기</a></li>
			</ul>
			
			<%
				if(userID == null){
			%>
			
		    	<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href ="login.jsp">로그인하기 ♥</a></li>
							<li><a href ="join.jsp">회원가입 하러가기♥</a></li>
						</ul>
					</li>
				</ul>
			
			<%	
			}else{
			%>
			<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href ="logoutAction.jsp">로그아웃 하기 ♥</a></li>
						</ul>
					</li>
				</ul>
			<%
			} 
			%>
			
			
		</div>
		</nav>
		<div class="container">
			<div class = 'jumbotron' style="text-align: center;">
				<div class='container'>
					<h1>게시판 소개</h1>
					<p>부스트스트랩과 JSP를 이용하여 만든 게시판 사이트 입니다.<br>
					 회원 가입, 로그인, 게시판 글 삭제,수정, 글 작성 기능을 <br>
					 간단하게(?) 구현 하였습니다. </p>
					<p><a class ="btn btn-primary btn-pull"  href = "https://github.com/alsdnrdld" role="button">Github로 이동하기~</a></p>
				</div>
			</div>
		</div>
		<div class="container" style="margin-bottom: 30px;"> 

  <div id="myCarousel" class="carousel slide" data-ride="carousel" >
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" >
      <div class="item active">
        <img style = "width:550px; height:500px; margin-left: 310px;" src="https://lh3.googleusercontent.com/proxy/1Hq03UsH_lOgPFbp1SaoUCV0LvPGrRtkB8UZOGck4YeL8zsIqql6scCpP8hlxjW2LQGQscnf6WQ5H1dTSxqiYKRKHraaPHOajy-X_ml7dqcnUL1YkA0wkWvKOm8SLtdvZZHOi5fFazsi17rAWzasAwPA3yquO6vyYw">
      </div>

      <div class="item">
       <img style = "width:500px; height:500px; margin-left: 310px;" src="http://gpplusmall.com/web/product/big/201809/ea6ed36d795b68b149e7544b9e8a3f93.jpg">
      </div>
    
      <div class="item">
        <img style = "width:500px; height:500px; margin-left: 310px;" src="http://m.m-holic.net/web/product/big/201801/2756_shop1_288405.jpg">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
		
	
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.js"></script>
<!-- webContent 아래에 있는 js 폴더의 bootatrap.js의 값을 적용하겠다는 뜻  -->
</body>
</html>