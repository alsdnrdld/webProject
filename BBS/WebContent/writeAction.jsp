<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="bbs.BbsDAO" %> <!-- 데이터 베이스의 값을 가지고 오기 위해 임포트 하는 것 -->
<%@ page import ="java.io.PrintWriter" %> <!-- 자바스크립트의 명령어를 쓰기 위해 임포트 하는 것 -->
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/> 
<!-- scope ="page"하게 되면 현재 페이지 안에서만 자바 bean(DAO)를 사용 할 수 있게 된다. -->
<jsp:setProperty  name="bbs" property="bbsTitle" /> 
<!-- login.jsp에서 정의한 userID의 값을 property로 가지고 오라는 코딩-->
<jsp:setProperty  name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
 
<title>writeAction</title>
</head>
<body>
	<%	
	   String userID = null;
	   if(session.getAttribute("userID") != null){
		   userID = (String)session.getAttribute("userID");  
	   }
	   if(userID == null){
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('로그인을 하소서')");
		   script.println("location.href = 'login.jsp'");
		   script.println("</script>");  
	   } else{
		   if(bbs.getBbsTitle() == null ||bbs.getBbsContent() == null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					BbsDAO bbsDAO = new BbsDAO();
					int result = bbsDAO.write(bbs.getBbsTitle(),userID,bbs.getBbsContent());
					if(result== -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패 했어요.')");
						script.println("history.back()");
						script.println("</script>");
					} else{
						
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = 'bbs.jsp'");
						script.println("</script>");
					} 
	            }
		
		}
	%>
</body>
</html>