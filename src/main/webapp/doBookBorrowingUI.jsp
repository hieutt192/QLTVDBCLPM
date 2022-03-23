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
		String barcode = (String)request.getParameter("barcode");
		String libcardId = (String)request.getParameter("libCardId");
		session.setAttribute("libcardId", libcardId);
		BookCopyDAO dao = new BookCopyDAO();
		if (!barcode.equals("")){
			List<BookCopy> addedBooks = (List<BookCopy>)session.getAttribute("addedBooks");
			BookCopy added = dao.getAddedBookCopy(Integer.parseInt(barcode));
			boolean err = false;
			if (added != null){
				addedBooks.add(added);
				session.setAttribute("addedBooks", addedBooks);
			} else err = true;
		if(err){
			response.sendRedirect("BookBorrowingUI.jsp?err=unavailable_bookcopy");
		}else {
			response.sendRedirect("BookBorrowingUI.jsp");
		}
	} else {
		response.sendRedirect("BookBorrowingUI.jsp");
	}
		
		
		
	%>
</body>
</html>