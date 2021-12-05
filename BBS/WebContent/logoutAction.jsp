<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="user.UserDAO" %> <!-- 데이터 베이스의 값을 가지고 오기 위해 임포트 하는 것 -->
<%@ page import ="java.io.PrintWriter" %> <!-- 자바스크립트의 명령어를 쓰기 위해 임포트 하는 것 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
 
<title>logoutAction</title>
</head>
<body>
<!-- 로그인액션, 조인액션에서 회원에게 부여한 세션값을 해제하게 한다.  -->
	<%
		session.invalidate();
	%>
	<script>
		location.href='main.jsp'
	</script>
</body>
</html>