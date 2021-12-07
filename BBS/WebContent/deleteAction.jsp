<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="bbs.BbsDAO" %>
<%@ page import ="bbs.Bbs" %> <!-- 데이터 베이스의 값을 가지고 오기 위해 임포트 하는 것 -->
<%@ page import ="java.io.PrintWriter" %> <!-- 자바스크립트의 명령어를 쓰기 위해 임포트 하는 것 -->
<% request.setCharacterEncoding("UTF-8"); %>

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
	   }
	   
		int bbsID = 0;
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
   		}else{
   					BbsDAO bbsDAO = new BbsDAO();
					int result = bbsDAO.delete(bbsID);
					if(result== -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 삭제에 실패 했어요.')");
						script.println("history.back()");
						script.println("</script>");
					} else{
						
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 삭제에 성공 했지만 난 너가 무슨 글을 썼는지 알고 있다 흐흐흐.')");
						script.println("location.href = 'bbs.jsp'");
						script.println("</script>");
					} 
	          // 흠... 바로 삭제가 되어버리네... 정말 삭제 할거냐는 안내 문구가 나오면 좋을 거 같은데... view 페이지에 그 내용을 추가한다.
	          //onclick = "return confirm()" 을 이용하여 눌렀을 때 확인 메시지가 나오도록 하였다.
		
		}
	%>
</body>
</html>