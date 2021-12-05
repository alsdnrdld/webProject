<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="user.UserDAO" %> <!-- 데이터 베이스의 값을 가지고 오기 위해 임포트 하는 것 -->
<%@ page import ="java.io.PrintWriter" %> <!-- 자바스크립트의 명령어를 쓰기 위해 임포트 하는 것 -->
<% request.setCharacterEncoding("UTF-8"); %>




<jsp:useBean id="user" class="user.User" scope="page"/> 
			<!-- scope ="page"하게 되면 현재 페이지 안에서만 자바 bean(DAO)를 사용 할 수 있게 된다. -->
<jsp:setProperty  name="user" property="userID" /> 
				<!-- login.jsp에서 정의한 userID의 값을 property로 가지고 오라는 코딩-->
<jsp:setProperty  name="user" property="userPassword" /> 




<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
 
<title>JSP 게시판</title>
</head>
<body>
	<%  
	   // 로그인을 완료 하였으므로 더이상 로그인 페이지를 볼 필요가 없으므로 다음과 같이 코딩한다. 
	   String userID = null;
	   if(session.getAttribute("userID") != null){
		   userID = (String)session.getAttribute("userID");
		   // 이미 session.setAttribute()로 인해 세션이 존재하는 존재하지 않는지를 .getAttribute()를 통해 파악하고
		   // null이 아니라면 해당 세션 값을 userID에 할당 되도록 한다.
		   // 유저의 아이디가 이제부터 자신에게 부여된 세션의 값이 되게 하기 위함이다. 	  
	   }
	   
	   if(userID != null){
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('이미 로그인이 되어 있으시네요')");
		   script.println("location.href = 'main.jsp'");
		   script.println("</script>");  
	   } // 유저에게 부여된 session 값을 기준으로 반복적인 로그인을 막아주는 부분
	   
	   
	   
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(),user.getUserPassword());
		if(result==1){            //key     value
			session.setAttribute("userID",user.getUserID()); //로그인이 성공한 회원에게 세션을 부여
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
			
		} else if(result == 0){ // 즉, 비밀번호가 틀린 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀렸어요')");
			script.println("history.back()");
			script.println("</script>");
			
		}else if(result == -1){ // 즉, 비밀번호가 틀린 경우 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('ID가 존재하지 않아요')");
			script.println("history.back()");
			script.println("</script>");
			
		}else if(result == -2){ // 즉, 비밀번호가 틀린 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>