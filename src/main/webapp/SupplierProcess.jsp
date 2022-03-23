<%@page import="java.util.Objects"%>
<%@page import="models.Supplier"%>
<%@page import="java.util.List"%>
<%@page import="dao.SupplierDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	
	import = "models.User, dao.LoginDAO"
	    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String NameofSupplier = (String)request.getParameter("NameofSupplier");
		
		
//		User user = new User();
//		user.setUsername(username);
//		user.setPassword(password);
		
		SupplierDAO dao = new SupplierDAO();
		Supplier checkSupplier = dao.checkSupplier(NameofSupplier);
		if (checkSupplier.getId() == 0){
			response.sendRedirect("SupplierImport.jsp?err=fail");
		} else{
//                    session.setAttribute("user", user);
			session.setAttribute("sup", checkSupplier);
			response.sendRedirect("SupplierImport.jsp");
		} 
	%>
</body>
</html>