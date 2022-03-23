<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import = "models.*, dao.*, java.util.*, java.text.SimpleDateFormat"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String startDate = (String)request.getParameter("startDate");
	String endDate = (String)request.getParameter("endDate");
	session.setAttribute("startDate", startDate);
	session.setAttribute("endDate", endDate);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	BookStatDAO dao = new BookStatDAO();
	List<BookStat> bookStat = dao.getBookStatistic(startDate, endDate);
	session.setAttribute("bookStat", bookStat);
	response.sendRedirect("BookStatisticUI.jsp");
%>
</body>
</html>