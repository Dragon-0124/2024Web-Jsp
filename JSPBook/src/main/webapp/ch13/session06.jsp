<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<h4>------세션을 삭제하기 전------</h4>
	<%
		String name;
		String value;
		
		Enumeration en = session.getAttributeNames();
		int i = 0;
		
		while (en.hasMoreElements()){
			i++;
			name=en.nextElement().toString();
			value=session.getAttribute(name).toString();
			out.println("설정된 세션의 속성 이름[" + i + "] : " + name + "<br>");
			out.println("설정된 세션의 속성 값[" + i + "] : " + value + "<br>");
		}
		
		session.removeAttribute("userID");
	%>
	
	<h4>------세션을 삭제한 후------</h4>
	<%
		en = session.getAttributeNames();
		i = 0;
		
		while (en.hasMoreElements()){
			i++;
			name=en.nextElement().toString();
			value=session.getAttribute(name).toString();
			out.println("설정된 세션의 속성 이름[" + i + "] : " + name + "<br>");
			out.println("설정된 세션의 속성 값[" + i + "] : " + value + "<br>");
		}
		
	%>
</body>
</html>