<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="num1" value="${20}"/>
<c:set var="num2">
10.5
</c:set>
<c:set var="today" value="<%= new java.util.Date() %>" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set 태그와 remove 태그</title> 
</head>
<body>
var num1 = ${ num1 } <br>
var num2 = ${ num2 } <br>
num1 + num2 = ${ num1 + num2 } <br>
Today is ${ today }

<c:remove var="num1" scope="page"/>

<p> 
삭제한 후의 num1 = ${num1} <br> 
삭제한 후의 num1 + num2 = ${num1 + num2} 
</body>
</html>