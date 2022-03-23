<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import = "models.*, dao.*, java.util.*"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	int callcardId = Integer.parseInt((String)request.getParameter("callcardId"));
	CallCardDAO dao = new CallCardDAO();
	CallCardDetail callcardDetail = dao.getCallCardDetail(callcardId);
	session.setAttribute("callcardDetail", callcardDetail);
	response.sendRedirect("ViewCallCardUI.jsp");
%>
</body>
</html>