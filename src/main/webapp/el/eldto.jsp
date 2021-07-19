<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="el.*" %>

<%   
ELDTO dto = new ELDTO("다니엘 레드클리프", "해리 포터와 불의 잔"); 
request.setAttribute("dto", dto); 
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 
EL 사용 안한 경우<br><br> 
<%  
Object obj = request.getAttribute("dto"); 

ELDTO eldto = (ELDTO)obj; 
out.println("영화명: " + eldto.getMovie() + "<br/><br/>"); 
out.println("주  연: " + eldto.getName() + "<br/><br/>"); 
%> 
<br><br> 
EL 사용한 경우 - name일 경우 getName() 호출<br><br> 
영화명: ${requestScope.dto.movie}<br><br> 
주  연: ${requestScope.dto.name}<br><br> 
Type2: 주  연: ${dto.movie} - ${dto.name}<br><br> 
Type3: 주  연(X): ${requestScope.movie}<br><br> 
Type4: 주  연(X): ${movie}<br><br> 

</h2> 
</body>
</html>