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
		String username = (String)request.getParameter("username");
		String password = (String)request.getParameter("password");
		
		//User user = new User();
		//user.setUsername(username);
		//user.setPassword(password);
		
		LoginDAO dao = new LoginDAO();
		User checkUser = dao.checkUser(username, password);
		if (checkUser == null){
			response.sendRedirect("LoginUI.jsp?err=fail");
		} else{
			session.setAttribute("user", checkUser);
			response.sendRedirect("MainManagerUI.jsp");
		} 
	%>
</body>
</html>