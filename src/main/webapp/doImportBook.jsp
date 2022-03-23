<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.ImportBook"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import = "java.util.*, models.*, dao.*"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%      
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		String idBook = (String)request.getParameter("idBook");
		String title = (String)request.getParameter("title");
		String importDate = (String)request.getParameter("importDate");
		String quantity = (String)request.getParameter("quantity");
		String Price = (String)request.getParameter("Price");
                session.getAttribute("addBook");
                
		ImportBook b = new ImportBook(Integer.parseInt(idBook), Integer.parseInt(quantity), title, Double.parseDouble(Price), sdf.parse(importDate));
                List<ImportBook> listBook =  (ArrayList)session.getAttribute("addBook");
                listBook.add(b);
                session.setAttribute("listBook", listBook);
                response.sendRedirect("ImportBook.jsp");
       
		
	%>
</body>
</html>