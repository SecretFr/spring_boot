<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
//name 인수에 "왕눈이"를 저장 
request.setAttribute("name", "JAVA 개발자");

%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>
request의 name 속성(표현식 방식): <%=request.getAttribute("name")%> <br>
request의 name 속성(EL-requestScope.name): ${requestScope.name} <br /><br /> 
request의 name 속성(EL-name): ${name} <br /><br />
</h2>

</body>
</html>