<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
<meta name = "viewport" content ="width = device-width", initial-scale="1">
  <!-- 어떤 것으로 접속을 해도 그것에 알맞는 해상도로 보여주라는 명령어 -->
<link rel = "stylesheet" href="css/bootstrap.css">
<link rel = "stylesheet" href="css/custom.css">
  <!-- stylesheet의 값을 적용 할것이고 그것의 값은 css/bootstrap.css라는 파일에 있는 값이다. -->
 
<title>update.jsp</title>
</head>
<body>
   <%
   		// 로그인이 된 사람들
   		String userID = null;
   		if(session.getAttribute("userID") != null){
   			userID=(String)session.getAttribute("userID");
   		}
   		
   		if(userID==null){
   		   PrintWriter script = response.getWriter();
  		   script.println("<script>");
  		   script.println("alert('글을 수정하고 싶으냐? 로그인부터 하거라 이놈!!')");
  		   script.println("location.href = 'login.jsp'");
  		   script.println("</script>");  
   		}
   		
   		int bbsID=0;
   		if(request.getParameter("bbsID")!=null){
   			bbsID = Integer.parseInt(request.getParameter("bbsID"));
   		}   		
   		if (bbsID == 0){
   		   PrintWriter script = response.getWriter();
 		   script.println("<script>");
 		   script.println("alert('유효하지 않은 글입니다.')");
 		   script.println("location.href = 'bbs.jsp'");
 		   script.println("</script>");  
   		}
   		
   		Bbs bbs = new BbsDAO().getBbs(bbsID);
   		if (!userID.equals(bbs.getUserID())){
   			PrintWriter script = response.getWriter();
  		   script.println("<script>");
  		   script.println("alert('당신에게는 수정할 권한이 없소이다.')");
  		   script.println("location.href = 'bbs.jsp'");
  		   script.println("</script>");  
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
		
			
		</div>
		</nav>
		<div class = "container">
			<div class= "row">
			   <form method="post" action = "updateAction.jsp?bbsID=<%=bbsID %>">
			   	<table class ="table table-striped" style ="text_align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan ="2"style ="background-color:#eeeeee; text-align: center;">게시판 글 수정하기~</th>
						</tr>
					</thead>
					<tbody style = "text-align: center;">
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength ="50" value="<%=bbs.getBbsTitle()%>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength ="2048" style="height: 350px;"><%=bbs.getBbsContent()%></textarea></td>	
						</tr>
					</tbody>
				</table>
				<input type="submit" class ="btn btn-primary pull-right" value="수정하기~">
			   </form>	
				
				
			</div>
		</div>
		
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
	<!-- webContent 아래에 있는 js 폴더의 bootatrap.js의 값을 적용하겠다는 뜻  -->
</body>
</html>