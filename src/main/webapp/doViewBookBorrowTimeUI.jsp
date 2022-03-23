<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import = "dao.*, models.*, java.util.*"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String startDate = (String)session.getAttribute("startDate");
	String endDate = (String)session.getAttribute("endDate");
	int bookId = Integer.parseInt((String)request.getParameter("bookId"));
	CallCardDAO dao = new CallCardDAO();
	List<BorrowingTurn> borrowList = dao.getBorrowList(startDate, endDate, bookId);
	session.setAttribute("borrowList", borrowList);
	response.sendRedirect("ViewBookBorrowTimeUI.jsp?bookId="+bookId);
	
	
%>
</body>
</html>