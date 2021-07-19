<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 
<%  
// http://localhost:8000/el/elParam.jsp 
// http://localhost:8000/el/elParam.jsp?code=ABCDE 

String code = request.getParameter("code"); %> 
code 파라미터(스크립틀릿 방식) : <% out.println(code);%> <br> 
code 파라미터(EL 방식) : ${param.code} <br /> 
</h2> 

</body>
</html>