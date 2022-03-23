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

<!--phan sua co the co loi can ktra-->

<body>   
<%
	String startDate = (String)session.getAttribute("startDate");
	String endDate = (String)session.getAttribute("endDate");
	int supplierId = Integer.parseInt((String)request.getParameter("IDSupplier"));
	SupplierStatDAO dao = new SupplierStatDAO();
	List<SupplierDetail> supStat = dao.getSupplierDetail(startDate, endDate,supplierId );
	session.setAttribute("supStat", supStat);
	response.sendRedirect("StatisticSupplier2.jsp?supId="+supplierId);
	
	
%>
</body>
</html>