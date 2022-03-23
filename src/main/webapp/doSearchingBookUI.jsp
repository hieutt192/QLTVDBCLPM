<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import = "dao.BookDAO"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String input = (String)request.getParameter("input");
		response.sendRedirect("SearchingBookUI.jsp?input=" + input);
	%>
</body>
</html>