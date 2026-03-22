<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<p> 잘못된 데이터가 입력되었습니다.
	<p> <%="숫자1(분자) : " + request.getParameter("num1") %>
	<p> <%="숫자2(분모) : " + request.getParameter("num2") %>
</body>
</html>