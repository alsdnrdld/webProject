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
<jsp:setProperty  name="user" property="userName" /> 
<jsp:setProperty  name="user" property="userGender" /> 
<jsp:setProperty  name="user" property="userEmail" /> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
 
<title>joinAction</title>
</head>
<body>
	<%	
	 // 회원가입을 완료 하였으므로 더이상 회원가입 페이지를 볼 필요가 없으므로 다음과 같이 코딩한다. 
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
		   script.println("alert('이미 회원가입이 되어 있으시네요')");
		   script.println("location.href = 'main.jsp'");
		   script.println("</script>");  
	   } // 유저에게 부여된 session 값을 기준으로 반복적인 회원가입을 막아주는 부분
	   
		if(user.getUserID() == null ||user.getUserPassword() == null||user.getUserName() == null||
		   user.getUserGender() == null||user.getUserEmail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result== -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else{
				session.setAttribute("userID",user.getUserID()); // 가입 성공한 회원에게 세션을 부과해서 관리
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
		// 세션을 유지하게 함으로써 한번 로그인을 하게 되면 새로운 페이지 이동시 반복적으로 로그인을 하지 않게 한다.
	%>
</body>
</html>