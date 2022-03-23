<%-- 
    Document   : doStatisticSupplier
    Created on : Mar 18, 2022, 8:43:48 PM
    Author     : HieuTT
--%>

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
    <%
	String startDate = (String)request.getParameter("startDate");
	String endDate = (String)request.getParameter("endDate");
	session.setAttribute("startDate", startDate);
	session.setAttribute("endDate", endDate);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	SupplierStatDAO dao = new SupplierStatDAO();
	List<SupplierStat> supplierStat = dao.getSupplierStatistic(startDate, endDate);
	session.setAttribute("supplierStat", supplierStat);
	response.sendRedirect("StatisticSupplier1.jsp"); // da sua co the co loi
%>>
</html>
