<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="el.DateUtil" %>
<%@ taglib prefix="elfunc" uri="/ELFunctions" %>
<%
java.util.Date today = new java.util.Date();
request.setAttribute("today", today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

Today is <b>${ elfunc:dateFormat(today) }</b>
<br>
Today is <b><%=today %>></b>
<br>
Today is <b><%=DateUtil.format(today) %></b>
<br>
Today is <b><%=request.getAttribute("today") %>></b>

</body>
</html>