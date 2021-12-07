<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
<meta name = "viewport" content ="width = device-width", initial-scale="1">
  <!-- 어떤 것으로 접속을 해도 그것에 알맞는 해상도로 보여주라는 명령어 -->
<link rel = "stylesheet" href="css/bootstrap.css">
  <!-- stylesheet의 값을 적용 할것이고 그것의 값은 css/bootstrap.css라는 파일에 있는 값이다. -->
<link rel = "stylesheet" href="css/custom.css">
 <style type="text/css">
 	a,a:hover{
 	color : #0000000;
 	text-decoration: none;}
 </style>
<title>bbs.jsp</title>
</head>
<body>
   <%
   		// 로그인이 된 사람들
   		String userID = null;
   		if(session.getAttribute("userID") != null){
   			userID=(String)session.getAttribute("userID");
   		}
   		int pageNumber = 1; // 기본페이지번호
   		if(request.getParameter("pageNumber") !=null){
   			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
				<li ><a href ="main.jsp">메인으로 가기</a></li>
				<li class = "active"><a href ="bbs.jsp">게시판으로 가기</a></li>
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
		<div class = "container">
			<div class= "row">
				<table class ="table table-striped" style ="text_align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style ="background-color:#eeeeee; text-align: center;">번호</th>
							<th style ="background-color:#eeeeee; text-align: center;">제목</th>
							<th style ="background-color:#eeeeee; text-align: center;">작성자</th>
							<th style ="background-color:#eeeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody style = "text-align: center;">
						<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
							for(int i = 0; i<list.size(); i++){
						%>
							<tr>
								<td><%=list.get(i).getBbsID() %></td>
								<td><a href = "view.jsp?bbsID=<%=list.get(i).getBbsID() %>"><%=list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></td>
								<td><%=list.get(i).getUserID() %></td>
								<td><%=list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13)+'시'+list.get(i).getBbsDate().substring(14,16)+'분' %></td>
							</tr>
							
						<%
							}
						 %>						
					</tbody>
				</table>
				<%
					if(pageNumber != 1){
						
				%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left">이전</a>
				<%		
					}if(bbsDAO.nextPage(pageNumber+1)){
				%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arraw-left">다음</a>
				<%
					}
				%>
			
				<a href="write.jsp" class ="btn btn-primary pull-right"> 글쓰기</a>
			</div>
		</div>
		
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
	<!-- webContent 아래에 있는 js 폴더의 bootatrap.js의 값을 적용하겠다는 뜻  -->
</body>
</html>