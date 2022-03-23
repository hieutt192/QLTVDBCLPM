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
	String libcardAtt = (String)session.getAttribute("libcardId");
	if (libcardAtt.equals("")){
		response.sendRedirect("BookBorrowingUI.jsp?err=empty_libcardId");
	} else {
		int libcardId = Integer.parseInt(libcardAtt);
		LibcardDAO dao = new LibcardDAO();
		CallCardDAO ccdao = new CallCardDAO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (dao.checkValidLibCardId(libcardId)){ 
			//extract callcard data
			User librarian = (User)session.getAttribute("user"); //librarian id
			Date borrowingDate = (Date)session.getAttribute("borrowingDate"); //borrowing date
			Date dueDate = (Date)session.getAttribute("dueDate"); //due date
			int callcardId = (Integer)session.getAttribute("callcardId"); //callcard id
			List<BookCopy> addedBooks = (List<BookCopy>)session.getAttribute("addedBooks");		
			try{
				ccdao.submit(new CallCard(callcardId, sdf.format(borrowingDate), sdf.format(dueDate), libcardId, librarian.getId()), addedBooks);
			} catch(Exception e){
			 	throw e;
			}
			
			session.removeValue("borrowingDate");			
			session.removeValue("dueDate");
			session.setAttribute("libcardId", "");
			session.setAttribute("addedBooks", new ArrayList<BookCopy>());
			response.sendRedirect("SuccessfulSubmitUI.jsp?");
			
		} else {
			response.sendRedirect("BookBorrowingUI.jsp?err=invalid_libcardId");
		}
	}
%>
</body>
</html>